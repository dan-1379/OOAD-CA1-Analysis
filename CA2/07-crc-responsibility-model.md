# 07 - CRC and Responsibility Model

## Purpose

This file decides which software class is responsible for each part of UC01 Submit Placement Request. The operation contracts (06) say what must be true after each system operation. This file says which object makes it true and which other objects it works with.

Each class is given a CRC card (Class, Responsibilities, Collaborators). Every responsibility is justified with a GRASP pattern (Larman, 2005) so the reason for each assignment is recorded and can be checked by the reviewer. The cards are the input for the design class diagram (08) and the object-interaction sequence diagrams (09).

Responsibilities are of two kinds:
- Knowing: the information an object holds or can work out.
- Doing: the actions an object carries out, creates or coordinates.

## From Domain Model to Design Classes 

Domain classes become software classes where UC01 needs them. Classes with no responsibility in UC01 are left out of this model and are added when another use case is designed. 

| Domain class | Design class | Reason | 
| --- | --- | --- |
| Request | `Request` | Central object of UC01. Created, updated, confirmed or discarded by CO1-CO5 |
| Student | `Student` | Submits the request and knows their Programme |
| Opportunity | `Opportunity` | The opportunity the request is for. Knows whether it is open (OI1) |
| Programme | `EvidenceRequirements` (value object) | Academic records stay outside the system (A3). UC01 only needs the programme's evidence requirements, which are read through a port and held as a value object (PA05) |
| Employer, Agreement, Staff, Decision, Conflict, OperationalChange, Placement, Action, Review, Supervisor, Permission | *Not used in UC01* | No contract in 06 creates, changes or reads them |

Software-only classes are added where no domain class is a good home for a responsibility (Pure Fabrication):

| Added Class | Kind | Reason |
| --- | --- | --- |
| `SubmitPlacementRequestHandler` | Use case controller | Receives the five system operations from the UI layer |
| `ProgrammeEvidencePort` | Interface (port) | Hides the external Academic Records system (PA05) |
| `FakeProgrammeEvidenceAdapter` | Test adapter | Returns a fixed evidence list per programme for tests (04 Dependencies) |
| `RequestRepository` | Interface (port) | The single shared placement record where confirmed requests are kept |
| `StudentRepository`, `OpportunityRepository` | Interfaces (ports) | Look up the identified student and the requested opportunity |
| `Clock` | Interface (port) | Supplies the current date so submittedDate can be fixed in tests | 
| `RequestStatus` | Enumeration | The fixed set of request status values | 
| `Receipt` | Value object | What the student is shown after confirming (CO4 Output) |


## CRC Cards

### SubmitPlacementRequestHandler

| Responsibilities | Collaborators |
| --- | --- |
| Receive the system operations startRequest, enterPreferences, addEvidence, confirmRequest and cancelRequest | - |
| Know the identified student and the request currently in progress for them | `Student`, `Request` |
| Look up the requested opportunity and check it is open (CO1 precondition) | `OpportunityRepository`, `Opportunity` |
| Get the evidence requirements for the student's programme | `ProgrammeEvidencePort` |
| Pass each operation to the object that owns the work and do no business logic itself | `Student`, `Request` | 
| Save the request to the shared record when confirmed (CO4) | `RequestRepository` |
| Discard the in-progress request when cancelled (CO5) | `Request` |

**GRASP:** Controller (use case controller). One handler per use case keeps the UI layer from talking to domain objects directly and holds the in-progress request between operations (DR-008). It delegates, so it stays cohesive and does not become a bloated controller.

### Student 

| Responsibilities | Collaborators |
| --- | --- |
| Know their name and the programme they are enrolled on | - |
| Create a new Request for an opportunity, linked to themselves (CO1) | `Request`, `Opportunity`, `EvidenceRequirements` |


**GRASP:** Creator. A Student submits Requests (domain association *submits*) and has the data needed to start one: themselves and their programme. Information Expert for their own programme.


### Opportunity

| Responsibilities | Collaborators |
| --- | --- |
| Know its title, status and other opportunity details | - |
| Know whether it is open for requests (CO1 precondition, OI1) | - |

**GRASP:** Information Expert. The opportunity holds its own status, so it is the expert on whether it is open. The rule for what counts as open is open issue OI1 and will sit inside `isOpen()` once agreed.

### Request 

| Responsibilities | Collaborators |
| --- | --- |
| Know its student, opportunity, preferences, evidence, submittedDate, status and waitingOn | `Student`, `Opportunity` | 
| Know the evidence requirements it must meet, captured when it was started | `EvidenceRequirements` |
| Record the student's preferences (CO2) | - |
| Add an evidence item to its evidence, without changing its status (CO3) | - |
| Work out which required evidence items are still missing (CO3 Output, 4a) | `EvidenceRequirements` |
| Confirm itself: set submittedDate, then apply BR01 to set status to *ready for decision* or *awaiting evidence* and set waitingOn (CO4) | `EvidenceRequirements`, `RequestStatus` |
| Create the receipt shown to the student (CO4 Output) | `Receipt` |

**GRASP:** Information Expert. The Request holds the evidence supplied so it is the expert on what is missing and on its own status. Keeping the BR01 decision inside `confirm()` puts the rule in exactly one place, which matches 06 (only CO4 sets the status). Creator for `Receipt` because the Request has all the data the receipt needs.

### EvidenceRequirements

| Responsibilities | Collaborators |
| --- | --- |
| Know the evidence items required by one programme (A5) | - |
| Given a set of supplied evidence, return the required items that are missing | - |
| Given a set of supplied evidence, say whether every required item is present (BR01) | - |

**GRASP:** Information Expert. The requirements object knows the required items so it is the expert on comparing supplied evidence against them. Extra evidence that is not required (E3 in SC04) is ignored, as stated in 06 Note 4. It is a value object: it is never changed after it is read.

### ProgrammeEvidencePort

| Responsibilities | Collaborators |
| --- | --- |
| Return the evidence requirements for a programme (`getRequiredEvidence(programme)` in SSD-01) | `EvidenceRequirements` |

**GRASP:** Protected Variations and Indirection. Academic Records is an external system (A3) that may change or be unavailable. Hiding it behind an interface means the domain classes never depend on it and a fake can be used in tests and in CA3 slices (PA05).

### FakeProgrammeEvidenceAdapter

| Responsibilities | Collaborators |
| --- | --- |
| Implement `ProgrammeEvidencePort` with a fixed evidence list per programme, matching the Gherkin Background (P1 requires E1 and E2) | `EvidenceRequirements` |

**GRASP:** Pure Fabrication. Exists only to make UC01 testable without the real Academic Records system.

### RequestRepository

| Responsibilities | Collaborators |
| --- | --- |
| Save a confirmed request to the single shared placement record (CO4, FR03) | `Request` | 
| Find the requests recorded against a student (used by tests to check SC01-SC05 and later by UC02) | `Request` |

**GRASP:** Pure Fabrication. Storage is not a responsibility of any domain class so a separate class keeps `Request` cohesive. The in-memory implementation is used for tests (04 Dependencies). Only confirmed requests are ever saved which is how CO5 records nothing (minimal guarantee).

### StudentRepository and OpportunityRepository

| Responsibilities | Collaborators |
| --- | --- |
| Find a student or an opportunity by its reference | `Student`, `Opportunity` |

**GRASP:** Pure Fabrication. Seeded with S1 and OP7 from the Gherkin Background in tests.

### Clock

| Responsibilities | Collaborators |
| --- | --- |
| Supply the current date | - |

**GRASP:** Protected Variations. Lets tests fix the date so submittedDate (CO4) can be checked.

### RequestStatus

| Responsibilities | Collaborators |
| --- | --- |
| Define the status values a request can have: *in progress, ready for decision, awaiting evidence* | - |

**GRASP:** Information Expert for the allowed values. *In progress* is internal only. In-progress requests are never saved to the shared record so no student or staff member ever sees this value (06 CO1, DR-008).

### Receipt

| Responsibilities | Collaborators |
| --- | --- |
| Know the request's opportunity, submittedDate, status and any missing evidence items to show the student | - |

**GRASP:** Pure Fabrication (output value object). Keeps what is shown to the student separate from the Request itself.

## Responsibility Assignment by System Operation

This table shows, for each contract, which object receives the operation and which object makes each postcondition true. It is the plan for the object-interaction sequence diagrams in 09.

| Contract | Received By | Steps and Responsible Object | Postconditions met |
| --- | --- | --- | --- |
| CO1 `startRequest(opportunity)` | Handler | 1. `OpportunityRepository` finds the opportunity, `Opportunity.isOpen()` confirms the precondition. <br>2. `ProgrammeEvidencePort.getRequiredEvidence(student.programme)` returns `EvidenceRequirements` <br>3. `Student.startRequest(opportunity, requirements)` creates `Request` r <br>4. Handler keeps r as the in-progress request | r created, linked to Student and Opportunity, in progress |
| CO2 `enterPreferences(preferences)` | Handler | 1. `Request.recordPreferences(preferences)` | r.preferences set |
| CO3 `addEvidence(evidenceItem)` | Handler | 1. `Request.addEvidence(evidenceItem)` <br>2. `Request.missingEvidence()` asks `EvidenceRequirements.missingFrom(evidence)` and returns the list. | 
evidenceItem added to r.evidence, status unchanged |
| CO4 `confirmRequest()` | Handler | 1. `Request.confirm(clock.today())` sets submittedDate, asks `EvidenceRequirements.isMetBy(evidence)` (BR01), and sets status and waitingOn. <br>2. `RequestRepository.save(r)` records r in the shared record. <br>3. `Request.createReceipt()` returns the `Receipt`. <br>4. Handler clears the in-progress request. | submittedDate, status and waitingOn set, r in the shared record |
| CO5 `cancelRequest()` | Handler | 1. Handler discards r. r was never saved, so nothing is recorded and its links to the Student and Opportunity go with it. | Associations broken, r deleted |


## GRASP Decisions and Alternatives Considered

| Decision | Chosen | Alternative Rejected | Reason |
| --- | --- | --- | --- |
| Who applies BR01 | `Request.confirm()`, using `EvidenceRequirements` | A separate `EvidenceValidator` service or the handler | The Request holds the evidence, so it is the Information Expert. A separate validator would pull logic out of the Request, and the handler doing it would make it a bloated controller. |
| Who creates the Request | `Student` | The handler | Creator favours the class that records and has the data for the new object. The domain says a Student *submits* Requests. |
| Where the evidence requirements come from | Read once at startRequest and held by the Request | Read again from the port at each addEvidence and at confirm | Matches SSD-01 where `getRequiredEvidence` is called only after startRequest. Means the requirements a student is told about at the start are the ones their request is checked against |
| How the external system is reached | `ProgrammeEvidencePort` with a fake adapter | Calling Academic Records directly from `Request` or the handler | Protected Variations: the domain never depends on the external system and every CA3 slice can be tested with the fake (PA05) |
| How cancellation records nothing | Only confirmed requests are saved | Saving the request at startRequest and deleting it on cancel | Nothing has to be undone so the minimal guarantee cannot be broken by a failed delete (DR-008) | 
| Where the date comes from | `Clock` interface | Reading the system clock inside `Request` | Tests can fix the date and check submittedDate |

## GRASP Patterns Used

| Pattern | Where it is applied |
| --- | --- |
| Information Expert | `Request` (evidence, missing items, status, BR01), `EvidenceRequirements` (comparison), `Opportunity` (open), `Student` (programme) |
| Creator | `Student` creates `Request`, `Request` creates `Receipt` |
| Controller | `SubmitPlacementRequestHandler` receives all five system operations |
| Low Coupling | Domain classes do not know about repositories, the port or the clock. Only the handler talks to them |
| High Cohesion | Storage, external access and dates are kept out of `Request` in their own classes |
| Pure Fabrication | Repositories, fake adapter, `Receipt` |
| Indirection | `ProgrammeEvidencePort` sits between the system and Academic Records |
| Protected Variations | `ProgrammeEvidencePort` and `Clock` protect the domain from external change |

## How the Responsibilities Match the Contracts

| Check | Result |
| --- | --- |
| Every postcondition in CO1-CO5 is made true by a named object | Yes: see Responsibility Assignment by System Operation |
| Every system operation is received by one controller | Yes: `SubmitPlacementRequestHandler` | 
| BR01 is applied in exactly one place | Yes: `Request.confirm().addEvidence` only reports missing items and never sets the status | 
| The minimal guarantee holds | Yes: only `RequestRepository.save()` puts a request in the shared record and it is called only from confirmRequest |
| No design class depends directly on an external system | Yes: Academic Records is reached only through `ProgrammeEvidencePort` |
| Each external dependency in 04 has a fake | Yes: fake evidence adapter, in-memory repositories, fixed clock |

## Responsibilities by Proposed CA3 Slice

This follows the proposed split in DR-007 and changes if that split changes.

| Slice | Main Class and Responsibilities |
| --- | --- |
| A - Start request | Handler `startRequest`, `Student` creating `Request`, `Opportunity.isOpen()`, `ProgrammeEvidencePort` and fake adapter |
| B - Capture preferences and evidence | `Request.recordPreferences()`, `Request.addEvidence()`, `Request.missingEvidence()`, `EvidenceRequirements.missingFrom()` |
| C - Confirm Request | `Request.confirm()`, `EvidenceRequirements.isMetBy()`, `RequestStatus`, `Receipt`, `Clock` |
| D - Cancel and Record | Handler `confirmRequest` and `cancelRequest` flow, `RequestRepository` and in-memory implementation, in-progress request handling |


## Notes and Assumptions

1. Only UC01 is modelled. Following DR-003, only classes with a responsibility in UC01 have CRC cards. Other domain classes get cards when their use cases are deigned.
2. Programme is outside the system. The domain model's Programme class is not a software class here because academic records stay in existing systems (A3). The system only reads a programme's evidence requirements, held in `EvidenceRequirements`. 
3. In-progress status is internal. `RequestStatus` includes *in progress* so a Request always has a valid status but it is never visible to students or staff because in-progress requests are not saved (DR-008).
4. Evidence stays an attribute. Evidence is a list held by `Request`, as in the domain model and 06 Note 2. No Evidence class is added.
5. What makes an apportunity open is still open (OI1). `Opportunity.isOpen()` currently uses the opportunity's status. If the group agrees a fuller rule, only this method changes.
6. Method names are provisional. Names such as `recordPreferences`, `missingFrom` and `isMetBy` are proposals for 08 and 09. Exact signatures and types are agreed in the architecture contract (10).