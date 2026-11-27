# 12 - Design Evaluation

| Field | Value |
| --- | --- |
| Artefact ID | CA2-12 |
| Owner | Daniel Courtney |
| Reviewer | Isabelle Lynch |
| Feeds into | Design dossier, design walkthrough |

## Purpose

This file judges the UC01 design rather than describing it again. It asks whether the responsibilities are in the right place, whether the structure would survive change, and where the design is weak or still depends on assumptions. Each judgement points to the artefact it is based on, so a reviewer can check it.

The design being evaluated is the one in [07](07-crc-responsibility-model.md), [08](08-design-class-diagram.md), [09](09-object-interaction-sequence-diagrams.md) and [10](10-architecture-and-integration-contract.md). Traceability is checked separately in [11](11-traceability-matrix.md).

<br>

## Summary

| Area | Judgement | Main reason |
| --- | --- | --- |
| Cohesion | Strong | Each class has one kind of job. BR01 lives only in `Request.confirm()` |
| Coupling | Strong in the domain, concentrated in the handler | No domain class holds a port. The handler depends on five ports, which is acceptable for a controller but is its main weakness |
| Controller | Acceptable with a known cost | The handler stays thin, but it holds the in-progress `Request` as state (DR-008) |
| Object validity | Good | A `Request` always has a valid status. `submittedDate` is empty until it is confirmed |
| Protection from change | Good for the external system and the date, weak for the "open" rule | `ProgrammeEvidencePort` and `Clock` are behind interfaces. What makes an opportunity open is still OI1 |
| Failure handling | Weakest area | Errors are named and owned, but none has a Gherkin scenario and `ACADEMIC_RECORDS_UNAVAILABLE` has no recovery |

<br>

## Cohesion

The design keeps each class to one kind of responsibility.

- `Request` holds everything the contracts change (preferences, evidence, status, `waitingOn`, `submittedDate`) and applies BR01 in one method, `confirm(today)`. The 07 consistency check confirms BR01 is applied in exactly one place (DoD-18). If the rule changes, for example a programme accepting one of two documents, only `EvidenceRequirements.isMetBy` and possibly `confirm` change.
- `EvidenceRequirements` owns the comparison between required and supplied items (`isMetBy`, `missingFrom`). This keeps list logic out of `Request`, which would otherwise mix "what this request holds" with "how two lists are compared".
- Storage, external access and dates are each in their own class (`RequestRepository`, `ProgrammeEvidencePort`, `Clock`). None of these concerns appear in `Request`.
- `Receipt` is a small value object built by `Request.createReceipt()`. It only carries what the student is shown, so the UI never needs to read the `Request` directly.

**Weak point:** `Request` is the largest class on DCD-01, with eight attributes and nine operations. This is reasonable for UC01, because it is the object the use case is about. If later use cases (staff decision, evidence upload after submission) add their behaviour to `Request` too, it risks becoming a god class. Those use cases should be checked against this before operations are added.

<br>

## Coupling

**Domain coupling is low.** No domain object holds a repository, the port or the clock (07 Visibility Between Objects). Domain classes only know each other through associations shown on DCD-01, and every navigable association has a message in 09 that needs it. The domain can be tested with no fakes at all.

**The handler carries the coupling.** `SubmitPlacementRequestHandler` depends on five ports, passed in through its constructor. This is a deliberate trade-off: coordinating these is the controller's job, and putting it anywhere else would push ports into the domain. The constructor injection also means every port can be replaced by a fake (in-memory repositories, `FakeProgrammeEvidenceAdapter`, a fixed clock), which is what makes the Gherkin scenarios testable without Academic Records.

**Dependency direction.** The handler and domain depend on interfaces, and the adapters implement them (10 section 2.1). This follows the Dependency Inversion Principle: the high-level policy (BR01, the minimal guarantee) does not depend on how storage or Academic Records work.

**Weak point:** five dependencies is at the upper end for one class. If more system operations are added to UC01, the handler should be split by operation rather than given more ports.

<br>

## The Controller and Its In-Progress State

The handler is a thin controller. It finds objects, passes messages on, saves and returns. It never inspects evidence or sets a status (08 SubmitPlacementRequestHandler). This avoids the bloated-controller problem that the rejected alternative in 07 (the handler applying BR01) would have caused.

The cost is that the handler is **stateful**. It holds `inProgress : Request [0..1]` between `startRequest` and `confirmRequest` or `cancelRequest`, because DR-008 means an in-progress request is never saved.

| Benefit | Cost |
| --- | --- |
| The minimal guarantee cannot be broken. Nothing is saved until confirmation, so there is nothing to undo on cancel (SC05, OSD-05) | One handler instance is needed per student session |
| No partial requests appear in the shared record for staff to see | An in-progress request is lost if the session ends before confirmation |
| Cancel is trivial: the handler lets go of the request | The design does not say what happens if a student starts a second request before finishing the first. 06 makes "no request in progress" a precondition, but nothing enforces it |

We judge this the right trade-off for UC01, because the minimal guarantee is a stated requirement and losing an unfinished request is acceptable to the student. The rejected alternative, saving at `startRequest` and deleting on cancel, would make the guarantee depend on a delete succeeding.

<br>

## Object Validity

Every object is in a valid state from the moment it is created.

- `Request` is created with status `IN_PROGRESS`, so it always has a status. `IN_PROGRESS` is never seen by staff, because in-progress requests are not saved (07 Note 3).
- `submittedDate` is `[0..1]` and stays empty until `confirm(today)` sets it. A request cannot appear submitted without having been confirmed.
- `waitingOn` is only set by `confirm`, so it cannot fall out of step with the status.

**Weak point:** if `RequestRepository.save()` fails, `CANNOT_SAVE` is signalled and the handler keeps `r` in progress. At that point `r` has already been confirmed, so it has a `submittedDate` and a final status but is not in the shared record. A retry calls `confirm` again with a new date, so the end state is correct, but between the failure and the retry the object in memory claims to be submitted when it is not. Moving `save()` before the status change, or resetting the status on failure, would remove this.

<br>

## Protection from Change

| Point of change | Protected? | How |
| --- | --- | --- |
| Academic Records (how evidence requirements are obtained) | Yes | `ProgrammeEvidencePort` (Indirection, Protected Variations). Only the adapter changes |
| The date | Yes | `Clock` (DR-011). Tests fix the date and check `submittedDate` |
| How requests are stored | Yes | `RequestRepository`. Storage is out of scope for CA2 |
| What evidence a programme requires | Yes | Read from the port per programme (A5). The design does not hard-code E1 and E2 |
| What makes an opportunity open | No | Open issue OI1. `isOpen()` and `OPPORTUNITY_NOT_OPEN` are reserved, but the rule and the SSD branch are not designed |
| Requirements changing mid-request | Partly | Requirements are read once at `startRequest` (07). This is fair to the student, but a request can be checked against requirements that have since changed |

<br>

## Alternatives Considered

The main design choices and the alternatives rejected are recorded in 07 (GRASP Decisions and Alternatives Considered) and 10 section 7. Looking back at them:

| Decision | Holds up? | Comment |
| --- | --- | --- |
| BR01 in `Request.confirm()`, not a validator service | Yes | Keeps the rule with the data. A validator would be worth reconsidering only if BR01 grows into rules that need data from outside the `Request` |
| `Student` creates `Request`, not the handler | Yes | Follows Creator and the domain model. It adds one message to OSD-01 but keeps creation out of the controller |
| Requirements read once at start | Yes, with the risk noted above | Matches SSD-01 and gives the student a fixed target |
| Only confirmed requests are saved (DR-008) | Yes | The strongest decision in the design. It is what makes SC05 hold without extra logic |
| Named errors, not a result object (DR-010) | Yes for UC01 | Keeps `confirmRequest` returning a `Receipt`. If later use cases need partial success, a result type may suit them better |
| `missingFrom` in `EvidenceRequirements` | Yes | Gives the comparison one owner, used by both CO3 and CO4 |

<br>

## Risks and Limitations

| # | Risk or limitation | Effect | What would fix it |
| --- | --- | --- | --- |
| 1 | None of the named errors in 10 section 6 has a Gherkin scenario | The failure paths are designed but not specified as testable behaviour | Add scenarios for `STUDENT_NOT_FOUND`, `ACADEMIC_RECORDS_UNAVAILABLE`, `NO_REQUEST_IN_PROGRESS` and `CANNOT_SAVE` |
| 2 | `ACADEMIC_RECORDS_UNAVAILABLE` has no recovery (10 section 8) | The student is stopped at step 1 with no retry or manual route | Decide a retry policy or a staff-entered fallback |
| 3 | `CANNOT_SAVE` leaves a confirmed `Request` in memory | Temporary mismatch between the object and the shared record | See Object Validity |
| 4 | OI1 is open | `isOpen()` is on DCD-01 but not called. The "not open" path has no SSD branch | Resolve OI1 and add the branch to SSD-01, CO1 and OSD-01 |
| 5 | Two operations on DCD-01 are not used in UC01: `Opportunity.isOpen()` and `RequestRepository.findByStudent()` | They are kept for a reason (07 Note 5, tests) but are not exercised by any sequence diagram | Use them in the next use case or remove them |
| 6 | The UI in the sequence diagrams is a placeholder | `:StudentUI` is drawn as the sender but is not a design class | Acceptable for CA2. Model the UI only if a UI use case is designed |
| 7 | Only one use case is designed (DR-003) | The design has not been tested against a second use case sharing `Request` and `Student` | Design the staff decision use case next and re-check `Request` cohesion |

<br>

## Overall Judgement

The UC01 design meets its contracts and keeps its business rule and guarantee each in one place. Its strongest features are the single home for BR01, the domain having no dependence on infrastructure, and DR-008 making cancellation safe by design. Its weakest areas are failure handling, the handler's session state, and the one rule (OI1) that is still unresolved. None of these stop UC01 working as specified, and each has a clear next step in the table above.
