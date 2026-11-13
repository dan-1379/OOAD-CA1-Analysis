# 02 – Reconciliation and Expansion Record

## Purpose

Scenario 28 - Student Work-Placement Coordination Service was selected for CA2 following the scenario suitability matrix [scenario suitability matrix](./01-scenario-suitability-matrix.md) and lecturer approval  ([DR-001](decisions/decision-log.md), [DR-002](decisions/decision-log.md)).

Before it became the groups CA2 baseline, the group reviewed the Scenario 28 CA1 analysis item by item rather than adopting it unchanged. The review drew on the issues raised by each member during scoring and on good practice from the other three CA1 analyses. 

This record shows which items were accepted, changed, merged, rejected, or added, with the reasoning for each decision and the artefacts it affects.

Together, these decisions form the revised analysis baseline used for CA2.

<br>

## Sources Reviewed

| Source | What it contributed | Link |
| --- | --- | --- |
| Scenario 28 CA1 analysis (Dan) | The baseline under review: scope, stakeholders, requirements, business rules, use cases, Gherkin and domain model | [CA1](../CA1/) |
| Scenario suitability matrix | Issues raised about Scenario 28 by Eoin, Isabelle and Bart during scoring | [Suitability matrix](01-scenario-suitability-matrix.md#suitability-matrix) |
| Scenario 02 CA1 analysis (Eoin) | Practices considered for adoption | [CA1](https://github.com/EoinMannix/OOAD-ca1-analysis) |
| Scenario 03 CA1 analysis (Bart) | Practices considered for adoption | [CA1](https://github.com/Bart-Jed/VolunteerTransportCoordination_Scenario3_OOAD) |
| Scenario 05 CA1 analysis (Isabelle) | Practices considered for adoption | [CA1](https://github.com/isabellelynch/RuralHealthAppointmentTransportService) |
| Lecturer approval and expansion brief | Confirmation of Scenario 28. No expansion items | [DR-002](decisions/decision-log.md) |
| Scenario 28 brief | Original case evidence, used to check disputed items | [Scenario 28](references/scenarios/28_Student_Work_Placement_Coordination_Service.md) |

<br>

## Reconciliation Decisions

Each item below was raised during scoring or identified when the group reviewed the Scenario 28 CA1. Items that were checked and kept without change are included, so the record shows the whole analysis was reviewed, not only the parts that changed.

> [!NOTE]
> **Decision values:**
> - **Accepted:** kept as in the CA1
> - **Changed:** kept, but corrected or reworded
> - **Merged:** combined with another item
> - **Rejected:** removed from the CA2 baseline
> - **Added:** new item not in the CA1
> - **Deferred:** recorded as a deferred requirement until the policy is agreed

<br>

### Scope and Requirements

| ID | CA1 item | Issue raised | Raised by | Decision | Reason | Affects |
| --- | --- | --- | --- | --- | --- | --- |
| RC01 | In-scope (IS1–IS9) and out-of-scope (OS1–OS6) lists | None traced to problems and reasons | Eoin, Isabelle, Bart | Accepted | All raters scored Scope 3 | — |
| RC02 | FR01–FR12, US01–US12, UC01–UC12 mapped one to one | None | Eoin, Bart | Accepted | Clear traceability is a strength of the CA1 | Traceability matrix |
| RC03 | IS3 Priority Management and BR02 rest on unagreed priority rules (Q2) | Policy not agreed, so UC04 cannot be designed or tested | Eoin, Bart | Deferred | Adopts Scenario 05's deferred-requirements practice so the open policy does not block the first release | IS3, FR04, BR02, UC04 |
| RC04 | IS4 and BR03 rest on undefined third-party authority (Q3) | Blocks UC05 | Isabelle, Eoin, Bart | Changed – working assumption added | UC05 is a candidate slice and needs a testable rule | BR03, UC05 |

<br>

### Business Rules

| ID | CA1 item | Issue raised | Raised by | Decision | Reason | Affects |
| --- | --- | --- | --- | --- | --- | --- |
| RC05 | BR01 evidence required before a decision (Q1) | Depends on what evidence counts | Eoin, Bart | Accepted | The CA1 already holds a working assumption for Q1, so BR01 is testable now | BR01, UC01 |
| RC06 | BR05, BR06, BR07 (two decisions, history kept, silence is not approval) | None confirmed and outcome-changing | Eoin, Isabelle, Bart | Accepted | Strongest rules in the scenario | UC06, UC07 |
| RC07 | BR08 stalled threshold undefined (Q4) | Blocks UC08 testing | Isabelle, Eoin, Bart | Changed – working assumption added | UC08 is a candidate slice and needs a testable threshold | BR08, UC08 |
| RC08 | BR04 match conditions Match deferred (Q10) | Match may be stored or derived | Eoin | Accepted – Match stays deferred | Not needed by any candidate slice revisit if a slice needs it | BR04, domain model |

<br>

### Use Cases

| ID | CA1 item | Issue raised | Raised by | Decision | Reason | Affects |
| --- | --- | --- | --- | --- | --- | --- |
| RC09 | UC02, UC03, UC09, UC11 are read-only | Too thin to be CA3 slices | Eoin, Bart | Accepted – kept as use cases, not used as slices | They meet real stakeholder needs but would make slices uneven | Implementation catalogue |
| RC10 | UC06 Record Selection Decision and UC07 Record Academic Approval share proceed logic (BR05) | Overlapping slices | Eoin, Bart | Changed – shared decision rule placed behind one interface | Keeps both use cases while avoiding duplicated logic between slices | UC06, UC07, architecture contract |
| RC11 | Use case labels "Set Activity Status" and "Release Stalled Allocation" | Terminology drift from the glossary (Activity is Action Allocation is Placement) | Dan | Changed – renamed to Set Action Status and Release Stalled Provisional Placement | Matches the domain model | UC08, UC10, use case diagram, traceability |
| RC12 | Only UC01 has a detailed use case and Gherkin | Limited coverage for the other candidate slices | Isabelle, Bart | Added – detailed use cases and Gherkin for each selected use case | Required by the behavioural design stage (Iteration 2) | Selected use cases |

<br>

### Domain Model

| ID | CA1 item | Issue raised | Raised by | Decision | Reason | Affects |
| --- | --- | --- | --- | --- | --- | --- |
| RC13 | ID attributes (studentNumber, staffNumber, programmeCode) | IDs are design detail, not domain attributes | Eoin, Bart | Changed – removed | The domain model should hold no IDs | Domain model |
| RC14 | Supervisor (SH12) has no class, although supervisor allocation is in scope (IS6) | Missing concept | Isabelle, Eoin | Added – provisional class, pending Q8 | IS6 needs somewhere to record the allocation Q8 decides whether Supervisor is college staff or an employer contact | Domain model, IS6 |
| RC15 | Third-party permission (BR03) not modelled | Missing concept for UC05 | Isabelle | Added – Permission concept | UC05 must record and check permission, so the domain needs to remember it | Domain model, UC05 |
| RC16 | Staff merges coordinator, administrator and placement staff into one class | Actors modelled as a class | Bart (judged justified) | Accepted | Staff holds information the domain needs: who owns an action, who recorded a decision, what each role may see | Domain model |
| RC17 | Association reasons | Isabelle judged them mostly one-ended Eoin and Bart judged them read from both ends | Isabelle, Eoin, Bart | Changed – reasons reviewed and rewritten where only one end was explained | The raters disagreed, so each reason was checked rather than assumed correct | Domain model |

<br>

## Practices adopted from other CA1s

The other three CA1 analyses were reviewed for techniques that would strengthen the Scenario 28 baseline. The practices below were adopted, and a few were considered and deliberately not adopted.

<br>

### Adopted

| ID | Practice | From | How it is used in CA2 | Affects |
| --- | --- | --- | --- | --- |
| PA01 | Unresolved policies moved into a list of deferred requirements, rather than left inside first-release rules (DFR01–DFR17) | Scenario 05 (Isabelle) | Q2 priority rules become a deferred requirement, so UC04 no longer blocks the first release (see RC03) | Requirements catalogue, BR02, UC04 |
| PA02 | Gherkin scenarios grouped under `Rule:` blocks, each naming the business rule it tests | Scenario 05 (Isabelle) | Every CA2 feature file groups its scenarios by business rule (e.g. `Rule: A placement cannot proceed without both decisions (BR05)`) | Gherkin feature files |
| PA03 | Scenario Outline with an Examples table for boundary values | Scenario 05 (Isabelle) | Used for the BR08 stalled threshold (before, at and after) and for BR01 evidence completeness | Gherkin feature files |
| PA04 | Constraints recorded with type, source and impact | Scenario 05 (Isabelle) | The four Scenario 28 constraints (CS1–CS4) gain type and impact columns in the revised baseline | Constraints |
| PA05 | Feature file header listing the use case and requirements it covers (`Linked to: UC-04, FR-04, FR-05`) | Scenario 03 (Bart) | Every CA2 feature file starts with a `Linked to:` line, keeping Gherkin traceable | Gherkin feature files, traceability matrix |
| PA06 | Boundary case using an expiry the day before the event (a driver's checks expired on Saturday) | Scenario 03 (Bart) | Same pattern used for a provisional placement that becomes stalled the day before review | BR08, UC08 tests |
| PA07 | Detailed use cases separating extensions (goal still reached) from exceptions (goal fails), with an open issues list naming the question behind each step | Scenario 03 (Bart) | All detailed use cases in CA2 use this layout | Detailed use cases |
| PA08 | External system shown as a supporting actor and accessed through an interface (library management system) | Scenario 02 (Eoin) | Programme evidence requirements, held in external academic records (A3), are reached through an interface with a fake adapter for testing | Architecture contract, UC01 |
| PA09 | Explicit transactions table naming each transaction concept and what it links | Scenario 02 (Eoin) | Added to the revised domain model for Request, Placement, Decision and OperationalChange | Domain model |
| PA10 | Risk register separate from assumptions and questions (RK1–RK3) | Scenario 02 (Eoin) | Scenario 28's risks are recorded in the project board's Risks list and in the revised baseline | Rules and uncertainty register, board |

<br>

### Considered but not adopted

| ID| Practice | From | Reason not adopted |
| --- | --- | --- | ---|
| Coordinator, Referrer and Partner modelled as domain classes | Scenario 03 (Bart) | Scored as a weakness in the matrix. Scenario 28 keeps actors outside the domain model, except Staff, whose information the domain needs (RC16) |
| A large question register (22 questions) | Scenario 05 (Isabelle) | Scenario 28 keeps its ten questions. New questions are added only when a design decision depends on them |
| Association reasons explaining one end only | Scenario 02 (Eoin) | Raised as a weakness in the matrix. Scenario 28 reasons are checked from both ends (RC17) |

<br>

## Expansion items

### Lecturer expansion brief

None. Scenario 28 was approved as presented by Andrew Shields on 9 November 2026, with no additional rules, actors, constraints or use cases [DR-002](decisions/decision-log.md).

<br>

### Group expansions

The following items are not in the Scenario 28 CA1. They were added by the group to make the scenario designable and testable for CA2.

| ID | Added item | Type | Reason | From | Decision record |
| :--- | :--- | :--- | :--- | :--- | :--- |
| EX01 | Working assumption for Q3: [the authority the group agrees is required when a third party acts for a student] | Assumption | UC05 needs a testable permission rule (BR03) | RC04 | DR-004 |
| EX02 | Working assumption for Q4: [the threshold after which a provisional placement counts as stalled] | Assumption | UC08 needs a testable threshold (BR08) | RC07 | DR-005 |
| EX03 | Deferred requirement for priority and exception rules (Q2) | Deferred requirement | Keeps an unagreed policy out of the first release | RC03, PA01 | — |
| EX04 | Supervisor concept (provisional, pending Q8) | Domain concept | Supervisor allocation is in scope (IS6) but had no class | RC14 | — |
| EX05 | Permission concept for third-party access | Domain concept | UC05 must record and check permission before disclosure | RC15 | — |
| EX06 | Detailed use cases and Gherkin feature files for each selected use case | Analysis artefacts | The CA1 only had these for UC01 | RC12 | — |

<br>

## Open questions carried forward

All ten stakeholder questions from the Scenario 28 CA1 were reviewed. Each one is either handled by a working assumption, deferred, provisionally answered by the model, or carried forward as open. Questions that block a selected CA3 slice must be resolved, or given a working assumption, before that slice is designed.

> [!NOTE]
> **Status values:**
> - **Working assumption:** a temporary answer agreed by the group and recorded as a decision
> - **Deferred:** the dependent requirement is moved out of the first release
> - **Provisional:** the CA1 model already gives an answer, which needs confirming
> - **Open:** still unanswered the "Blocks" column shows what it affects

<br>

| ID | Question | Status | Handled by | Blocks |
| :--- | :--- | :--- | :--- | :--- |
| Q1 | What information is required before a request is ready for decision? | Working assumption | Existing CA1 assumption: a fixed evidence list per programme (RC05) | Nothing BR01 and UC01 are testable now |
| Q2 | How should eligibility, priority and exceptions be applied? | Deferred | Deferred requirement (RC03, EX03) | UC04 (not a CA3 slice) |
| Q3 | What authority is required when another person acts for the requester? | Working assumption | [DR-004](decisions/decisions.md#dr-004) (EX01) | UC05 until DR-004 is agreed |
| Q4 | When should provisional allocations expire or become confirmed? | Working assumption | [DR-005](decisions/decisions.md#dr-005) (EX02) | UC08 until DR-005 is agreed |
| Q5 | Who may approve changes, substitutions or withdrawal? | Open | — | Revised decisions in UC07 withdrawal handling |
| Q6 | How should versions, reviews and outstanding actions be related? | Provisional | CA1 domain model: Decision *supersedes* Decision, Review *generates* Action, Review *leads to* OperationalChange | Nothing in the first release confirm with stakeholders |
| Q7 | Which information may be shared with staff, partners and funders? | Open | Partly covered by DR-004 for third parties | Summary reporting (NFR01, CS3) not a selected slice |
| Q8 | Is a placement supervisor a college staff member, an employer contact, or can it be either? | Provisional | Supervisor kept as a provisional concept (EX04) | Supervisor associations in the domain model |
| Q9 | Does "approval" of an advertised opportunity mean the same as academic approval of a placement, or is it a separate approval? | Open | — | What UC07 records as academic approval |
| Q10 | Should a match be recorded as its own outcome, or is it the point at which a request satisfies all the important requirements? | Deferred | Match stays deferred (RC08) | Nothing in the first release |

<br>

## Summary

The group reviewed the Scenario 28 CA1 item by item before adopting it as the CA2 baseline. Its strongest parts were kept: the scope boundary, the one-to-one traceability between requirements, user stories and use cases, and the confirmed decision rules (BR05–BR07). Its weaker parts were corrected or extended. ID attributes were removed, missing concepts were added, terminology was aligned with the domain model, and unresolved policies were either deferred or given working assumptions, so the candidate CA3 slices can be designed and tested.

| Area | Result |
| :--- | :--- |
| **Reconciliation decisions** | 17 items reviewed: 7 accepted, 6 changed, 3 added, 1 deferred, 0 merged, 0 rejected |
| **Practices from other CA1s** | 10 adopted, 3 considered and not adopted |
| **Expansion items** | None from the lecturer. 6 added by the group |
| **Open questions** | 3 working assumptions (Q1, Q3, Q4), 2 deferred (Q2, Q10), 2 provisional (Q6, Q8), 3 open (Q5, Q7, Q9) |

These decisions form the revised analysis baseline used for the behavioural design in Iteration 2. Any later change to the baseline is recorded as a new decision rather than overwriting this record.