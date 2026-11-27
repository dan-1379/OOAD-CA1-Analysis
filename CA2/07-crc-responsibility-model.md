# 07 - CRC and Responsibility Model

| Field | Value |
| --------------- | -------------------------------------------------- |
| Artefact ID | CA2-07 |
| Owner | Isabelle Lynch |
| Reviewer | Eoin Mannix |
| Builds on | [05 System sequence diagrams](05-system-sequence-diagrams.md), [06 Operation contracts](06-operation-contracts.md), [domain model in 03](03-revised-analysis-baseline.md#8-domain-model), [04 Dependencies and independence](04-prioritised-implementation-catalogue.md#dependencies-and-independence) |
| Feeds into | [08 Design class diagram](08-design-class-diagram.md), [09 Object-interaction sequence diagrams](09-object-interaction-sequence-diagrams.md), [10 Architecture and integration contract](10-architecture-and-integration-contract.md) |

## Purpose

This file decides which software class is responsible for each part of UC01 Submit Placement Request. The operation contracts (06) say what must be true after each system operation. This file says which object makes it true and which other objects it works with.

Each class is given a CRC card (Class, Responsibilities, Collaborators). Every responsibility is justified with a GRASP pattern (Larman, 2005) so the reason for each assignment is recorded and can be checked by the reviewer. The cards are the input for the design class diagram (08) and the object-interaction sequence diagrams (09). Method names on the cards are the ones agreed in 08 and 10.

Responsibilities are of two kinds:
- Knowing: the information an object holds or can work out.
- Doing: the actions an object carries out, creates or coordinates.

## From Domain Model to Design Classes

Domain classes become software classes where UC01 needs them. Classes with no responsibility in UC01 are left out of this model and are added when another use case is designed.

| Domain class | Design class | Reason |
| --- | --- | --- |
| Request | `Request` | Central object of UC01. Created, updated, confirmed or discarded by CO1 - CO5 |
| Student | `Student` | Submits the request and knows their Programme (held as `programmeId`) |
| Opportunity | `Opportunity` | The opportunity the request is for. Knows its title for the receipt and whether it is open (OI1) |
| Programme | `Student.programmeId` plus `EvidenceRequirements` (value object) | Academic records stay outside the system (A3). UC01 only needs to know which programme the student is on and that programme's evidence requirements, which are read through a port and held as a value object (PA05) |
| Employer, Agreement, Staff, Decision, Conflict, OperationalChange, Placement, Action, Review, Supervisor, Permission | *Not used in UC01* | No contract in 06 creates, changes or reads them |

Software-only classes are added where no domain class is a good home for a responsibility (Pure Fabrication):

| Added class | Kind | Reason |
| --- | --- | --- |
| `SubmitPlacementRequestHandler` | Use case controller | Receives the five system operations from the UI layer |
| `ProgrammeEvidencePort` | Interface (port) | Hides the external Academic Records system (PA05, IF-01) |
| `FakeProgrammeEvidenceAdapter` | Test adapter | Returns a fixed evidence list per programme for tests (04 Dependencies) |
| `RequestRepository` | Interface (port) | The single shared placement record where confirmed requests are kept (IF-02) |
| `StudentRepository`, `OpportunityRepository` | Interfaces (ports) | Look up the identified student and the requested opportunity (IF-03, IF-04) |
| `Clock` | Interface (port) | Supplies the current date so submittedDate can be fixed in tests (IF-05) |
| `RequestStatus` | Enumeration | The fixed set of request status values |
| `Receipt` | Value object | What the student is shown after confirming (CO4 Output) |
| `InMemoryRequestRepository`, `InMemoryStudentRepository`, `InMemoryOpportunityRepository`, `FixedClock` | Test adapters | Simple versions of the ports for tests. They have no responsibility beyond the port they implement, so they share the card of that port and are drawn in 08 |


## CRC Cards

### SubmitPlacementRequestHandler

| Responsibilities | Collaborators |
| --- | --- |
| Receive the system operations startRequest, enterPreferences, addEvidence, confirmRequest and cancelRequest | - |
| Know the identified student and the request currently in progress for them | `Student`, `Request` |
| Look up the identified student | `StudentRepository`, `Student` |
| Look up the requested opportunity. Being open is a precondition of CO1 (OI1), so it is not checked in UC01 yet | `OpportunityRepository`, `Opportunity` |
| Get the evidence requirements for the student's programme | `Student`, `ProgrammeEvidencePort` |
| Pass each operation to the object that owns the work and do no business logic itself | `Student`, `Request` |
| Get today's date and pass it to the request when it is confirmed (CO4) | `Clock`, `Request` |
| Save the request to the shared record when confirmed (CO4) | `RequestRepository` |
| Discard the in-progress request when cancelled (CO5) | `Request` |
| Signal `NO_REQUEST_IN_PROGRESS` when an operation needs a request and none is in progress. Pass on errors from the ports unchanged (10, section 6) | - |

**GRASP:** Controller (use case controller). One handler per use case keeps the UI layer from talking to domain objects directly and holds the in-progress request between operations (DR-008). It delegates, so it stays cohesive and does not become a bloated controller.

### Student

| Responsibilities | Collaborators |
| --- | --- |
| Know their name and the programme they are enrolled on (`getProgrammeId()`) | - |
| Create a new Request for an opportunity, linked to themselves (CO1) | `Request`, `Opportunity`, `EvidenceRequirements` |

**GRASP:** Creator. A Student submits Requests (domain association *submits*) and has the data needed to start one: themselves and their programme. Information Expert for their own programme.

### Opportunity

| Responsibilities | Collaborators |
| --- | --- |
| Know its title, status and other opportunity details | - |
| Know whether it is open for requests (`isOpen()`). Not called in UC01 while OI1 is open, see Note 5 | - |

**GRASP:** Information Expert. The opportunity holds its own status, so it is the expert on whether it is open. The rule for what counts as open is open issue OI1 and will sit inside `isOpen()` once agreed.

### Request

| Responsibilities | Collaborators |
| --- | --- |
| Know its student, opportunity, preferences, evidence, submittedDate, status and waitingOn | `Student`, `Opportunity` |
| Start as *in progress* with no evidence and nothing waiting (CO1) | `RequestStatus` |
| Know the evidence requirements it must meet, captured when it was started | `EvidenceRequirements` |
| Record the student's preferences (CO2) | - |
| Add an evidence item to its evidence, without changing its status (CO3) | - |
| Work out which required evidence items are still missing (CO3 Output, 4a) | `EvidenceRequirements` |
| Confirm itself: set submittedDate, then apply BR01 to set status to *ready for decision* or *awaiting evidence* and set waitingOn (CO4) | `EvidenceRequirements`, `RequestStatus` |
| Create the receipt shown to the student, using the opportunity's title (CO4 Output) | `Receipt`, `Opportunity` |

**GRASP:** Information Expert. The Request holds the evidence supplied, so it is the expert on what is missing and on its own status. Keeping the BR01 decision inside `confirm()` puts the rule in exactly one place, which matches 06 (only CO4 sets the status). Creator for `Receipt` because the Request has all the data the receipt needs.

### EvidenceRequirements

| Responsibilities | Collaborators |
| --- | --- |
| Know the evidence items required by one programme (A5) | - |
| Given a set of supplied evidence, return the required items that are missing (`missingFrom`) | - |
| Given a set of supplied evidence, say whether every required item is present (`isMetBy`, BR01) | - |

**GRASP:** Information Expert. The requirements object knows the required items, so it is the expert on comparing supplied evidence against them. Extra evidence that is not required (E3 in SC04) is ignored, as stated in 06 Note 4. It is a value object: it is never changed after it is read.

### ProgrammeEvidencePort

| Responsibilities | Collaborators |
| --- | --- |
| Return the evidence requirements for a programme (`getRequiredEvidence(programme)` in SSD-01) | `EvidenceRequirements` |
| Signal `ACADEMIC_RECORDS_UNAVAILABLE` if Academic Records cannot be reached | - |

**GRASP:** Protected Variations and Indirection. Academic Records is an external system (A3) that may change or be unavailable. Hiding it behind an interface means the domain classes never depend on it and a fake can be used in tests (PA05).

### FakeProgrammeEvidenceAdapter

| Responsibilities | Collaborators |
| --- | --- |
| Implement `ProgrammeEvidencePort` with a fixed evidence list per programme, matching the Gherkin Background (P1 requires E1 and E2) | `EvidenceRequirements` |

**GRASP:** Pure Fabrication. Exists only to make UC01 testable without the real Academic Records system.

### RequestRepository

| Responsibilities | Collaborators |
| --- | --- |
| Save a confirmed request to the single shared placement record (CO4, FR03) | `Request` |
| Find the requests recorded against a student (used by tests to check SC01 - SC05 and later by UC02) | `Request` |
| Signal `CANNOT_SAVE` if the shared record cannot be written | - |

**GRASP:** Pure Fabrication. Storage is not a responsibility of any domain class, so a separate class keeps `Request` cohesive. The in-memory implementation is used for tests (04 Dependencies). Only confirmed requests are ever saved, which is how CO5 records nothing (minimal guarantee).

### StudentRepository and OpportunityRepository

| Responsibilities | Collaborators |
| --- | --- |
| Find a student or an opportunity by its reference | `Student`, `Opportunity` |
| Signal `STUDENT_NOT_FOUND` or `OPPORTUNITY_NOT_FOUND` if there is no match | - |

**GRASP:** Pure Fabrication. Seeded with S1 and OP7 from the Gherkin Background in tests.

### Clock

| Responsibilities | Collaborators |
| --- | --- |
| Supply the current date | - |

**GRASP:** Protected Variations. Lets tests fix the date so submittedDate (CO4) can be checked (DR-011).

### RequestStatus

| Responsibilities | Collaborators |
| --- | --- |
| Define the status values a request can have: *in progress, ready for decision, awaiting evidence* (`IN_PROGRESS`, `READY_FOR_DECISION`, `AWAITING_EVIDENCE` in 08) | - |

**GRASP:** Information Expert for the allowed values. *In progress* is internal only. In-progress requests are never saved to the shared record, so no student or staff member ever sees this value (06 CO1, DR-008).

### Receipt

| Responsibilities | Collaborators |
| --- | --- |
| Know the opportunity title, submittedDate, status and any missing evidence items to show the student | - |

**GRASP:** Pure Fabrication (output value object). Keeps what is shown to the student separate from the Request itself.

## Responsibility Assignment by System Operation

This table shows, for each contract, which object receives the operation and which object makes each postcondition true. It is the plan for the object-interaction sequence diagrams in 09, and the steps are in the same order as the messages there.

| Contract | Received by | Steps and responsible object | Postconditions met | Object design |
| --- | --- | --- | --- | --- |
| CO1 `startRequest(opportunity)` | Handler | 1. `StudentRepository.findByReference` finds the identified student s. <br>2. `OpportunityRepository.findByReference` finds the opportunity op. Being open is a precondition (06 CO1), so it is not checked here. <br>3. `s.getProgrammeId()` gives the student's programme. <br>4. `ProgrammeEvidencePort.getRequiredEvidence(programme)` returns `EvidenceRequirements` req. <br>5. `s.startRequest(op, req)` creates `Request` r, which starts as `IN_PROGRESS`. <br>6. Handler keeps r as the in-progress request and returns req. | r created, linked to Student and Opportunity, r.status *in progress*, r.evidence and r.waitingOn empty | OSD-01 |
| CO2 `enterPreferences(preferences)` | Handler | 1. `r.recordPreferences(preferences)` | r.preferences set | OSD-02 |
| CO3 `addEvidence(evidenceItem)` | Handler | 1. `r.addEvidence(evidenceItem)` <br>2. `r.missingEvidence()` asks `EvidenceRequirements.missingFrom(evidence)` and returns the list. | evidenceItem added to r.evidence, status unchanged | OSD-03 |
| CO4 `confirmRequest()` | Handler | 1. `Clock.today()` gives today's date. <br>2. `r.confirm(today)` sets submittedDate, asks `EvidenceRequirements.isMetBy(evidence)` (BR01), and sets status and waitingOn (using `missingFrom` when not met). <br>3. `RequestRepository.save(r)` records r in the shared record. <br>4. `r.createReceipt()` returns the `Receipt`. <br>5. Handler clears the in-progress request. | submittedDate, status and waitingOn set, r in the shared record | OSD-04 |
| CO5 `cancelRequest()` | Handler | 1. Handler discards r. r was never saved, so nothing is recorded and its links to the Student and Opportunity go with it. | Associations broken, r deleted | OSD-05 |


## Responsibilities Traced to the Design Class Diagram

Every responsibility on a card becomes a field, link or method in 08 (DoD-17). This table is the check.

| Card | Responsibility | Member in 08 |
| --- | --- | --- |
| Handler | Receive the five system operations | `startRequest`, `enterPreferences`, `addEvidence`, `confirmRequest`, `cancelRequest` |
| Handler | Know the student and the request in progress | `studentId`, `inProgress : Request [0..1]` |
| Handler | Reach the ports | `students`, `opportunities`, `evidence`, `requests`, `clock` (constructor) |
| Student | Know their programme | `programmeId`, `getProgrammeId()` |
| Student | Create a Request | `startRequest(opportunity, requirements) : Request` |
| Opportunity | Know its title | `title`, `getTitle()` |
| Opportunity | Know whether it is open | `status`, `isOpen()` |
| Request | Know its links and state | `student`, `opportunity`, `requirements`, `preferences`, `evidence`, `submittedDate`, `status`, `waitingOn` |
| Request | Start as in progress | Constructor `Request(student, opportunity, requirements)` |
| Request | Record preferences | `recordPreferences(preferences)` |
| Request | Add evidence | `addEvidence(evidenceItem)` |
| Request | Work out what is missing | `missingEvidence()` |
| Request | Confirm and apply BR01 | `confirm(today)` |
| Request | Create the receipt | `createReceipt() : Receipt` |
| EvidenceRequirements | Know the required items | `requiredItems`, `getRequiredItems()` |
| EvidenceRequirements | Compare supplied evidence | `missingFrom(supplied)`, `isMetBy(supplied)` |
| ProgrammeEvidencePort | Return a programme's requirements | `getRequiredEvidence(programme)` |
| RequestRepository | Save and find requests | `save(request)`, `findByStudent(studentId)` |
| StudentRepository, OpportunityRepository | Find by reference | `findByReference(...)` |
| Clock | Supply the date | `today()` |
| RequestStatus | Define the values | `IN_PROGRESS`, `READY_FOR_DECISION`, `AWAITING_EVIDENCE` |
| Receipt | Know what is shown | `opportunityTitle`, `submittedDate`, `status`, `missingEvidence` |


## Visibility Between Objects

A message can only be sent if the sender can see the receiver (Larman, 2005). This table records how each collaborator on the cards is reached, so the links in 08 and the messages in 09 can be checked.

| From | To | Visibility | How it is reached |
| --- | --- | --- | --- |
| Handler | `StudentRepository`, `OpportunityRepository`, `ProgrammeEvidencePort`, `RequestRepository`, `Clock` | Attribute | Passed in through the constructor and held as fields |
| Handler | `Request` r | Attribute | Held as `inProgress` between operations (DR-008) |
| Handler | `Student` s, `Opportunity` op, `EvidenceRequirements` req | Local | Returned by the repositories and the port inside startRequest |
| Handler | `Receipt` | Local | Returned by `r.createReceipt()` and passed back to the UI |
| Student | `Opportunity`, `EvidenceRequirements` | Parameter | Passed in to `startRequest(op, req)` |
| Student | `Request` | Local | Created inside `startRequest` and returned |
| Request | `Student`, `Opportunity`, `EvidenceRequirements` | Attribute | Set by the constructor and kept for the life of the request |
| Request | Today's date | Parameter | Passed in to `confirm(today)`, so `Request` never sees `Clock` |
| Request | `Receipt` | Local | Created inside `createReceipt()` and returned |

No domain object has attribute visibility of a port. This is what keeps the domain free of storage, the clock and Academic Records (Low Coupling, 10 section 2.1).


## Error Responsibilities

The named errors are agreed in the architecture contract (10, section 6, DR-010). This table says which object is responsible for noticing each one.

| Error | Noticed by | Operation | Effect |
| --- | --- | --- | --- |
| `STUDENT_NOT_FOUND` | `StudentRepository` | startRequest | No Request created |
| `OPPORTUNITY_NOT_FOUND` | `OpportunityRepository` | startRequest | No Request created |
| `ACADEMIC_RECORDS_UNAVAILABLE` | `ProgrammeEvidencePort` | startRequest | No Request created |
| `NO_REQUEST_IN_PROGRESS` | Handler (`inProgress` is empty) | enterPreferences, addEvidence, confirmRequest, cancelRequest | Nothing changes |
| `CANNOT_SAVE` | `RequestRepository` | confirmRequest | r is not recorded and no receipt is issued. r has already been confirmed in memory, but the handler keeps it as the in-progress request so the student can confirm again (10 section 6, 09 Note 6) |
| `OPPORTUNITY_NOT_OPEN` | `Opportunity.isOpen()` would decide it | Not raised in UC01 | Reserved until OI1 is resolved (Note 5) |

The handler passes the port errors on and does not decide them itself, so it stays a thin controller. Domain objects never signal errors in UC01, because none of their operations can fail once the handler has checked a request is in progress.


## GRASP Decisions and Alternatives Considered

| Decision | Chosen | Alternative rejected | Reason |
| --- | --- | --- | --- |
| Who applies BR01 | `Request.confirm()`, using `EvidenceRequirements` | A separate `EvidenceValidator` service or the handler | The Request holds the evidence, so it is the Information Expert. A separate validator would pull logic out of the Request, and the handler doing it would make it a bloated controller. |
| Who creates the Request | `Student` | The handler | Creator favours the class that records and has the data for the new object. The domain says a Student *submits* Requests. |
| Where the evidence requirements come from | Read once at startRequest and held by the Request | Read again from the port at each addEvidence and at confirm | Matches SSD-01 where `getRequiredEvidence` is called only after startRequest. Means the requirements a student is told about at the start are the ones their request is checked against |
| How the external system is reached | `ProgrammeEvidencePort` with a fake adapter | Calling Academic Records directly from `Request` or the handler | Protected Variations: the domain never depends on the external system and the design can be tested with the fake (PA05) |
| How cancellation records nothing | Only confirmed requests are saved | Saving the request at startRequest and deleting it on cancel | Nothing has to be undone, so the minimal guarantee cannot be broken by a failed delete (DR-008) |
| Where the date comes from | `Clock` interface | Reading the system clock inside `Request` | Tests can fix the date and check submittedDate (DR-011) |
| Who works out the missing items | `EvidenceRequirements.missingFrom()`, asked by `Request` | `Request` comparing the lists itself | `EvidenceRequirements` owns the required items, so it is the expert on the comparison. `Request` stays focused on its own state |
| How errors are reported | Named errors signalled by the object that notices them | A result object returned from every operation | Agreed in DR-010. Normal outcomes stay simple (`confirmRequest` returns a `Receipt`) |

## GRASP Patterns Used

| Pattern | Where it is applied |
| --- | --- |
| Information Expert | `Request` (evidence, missing items, status, BR01), `EvidenceRequirements` (comparison), `Opportunity` (open), `Student` (programme) |
| Creator | `Student` creates `Request`, `Request` creates `Receipt` |
| Controller | `SubmitPlacementRequestHandler` receives all five system operations |
| Low Coupling | Domain classes do not know about repositories, the port or the clock. Only the handler talks to them (see Visibility Between Objects) |
| High Cohesion | Storage, external access and dates are kept out of `Request` in their own classes |
| Pure Fabrication | Handler, repositories, fake adapters, `Receipt` |
| Indirection | `ProgrammeEvidencePort` sits between the system and Academic Records |
| Protected Variations | `ProgrammeEvidencePort` and `Clock` protect the domain from external change |

## How the Responsibilities Match the Contracts

| Check | Result |
| --- | --- |
| Every postcondition in CO1 - CO5 is made true by a named object (DoD-16) | Yes: see Responsibility Assignment by System Operation |
| Every system operation is received by one controller | Yes: `SubmitPlacementRequestHandler` |
| Every class with a CRC card appears on the design class diagram (DoD-17) | Yes: all 13 classes with a card (12 cards, as `StudentRepository` and `OpportunityRepository` share one) are on DCD-01. See Responsibilities Traced to the Design Class Diagram |
| The steps match the messages in 09 | Yes: same receivers and same order as OSD-01 to OSD-05 |
| BR01 is applied in exactly one place (DoD-18) | Yes: only `Request.confirm()` sets *ready for decision* or *awaiting evidence*. `addEvidence` only reports missing items and never changes the status |
| The minimal guarantee holds | Yes: only `RequestRepository.save()` puts a request in the shared record and it is called only from confirmRequest |
| No design class depends directly on an external system | Yes: Academic Records is reached only through `ProgrammeEvidencePort` |
| Each external dependency in 04 has a fake | Yes: fake evidence adapter, in-memory repositories, fixed clock |
| Every named error in 10 has a responsible object | Yes: see Error Responsibilities |

## Notes and Assumptions

1. Only UC01 is modelled. Following DR-003, only classes with a responsibility in UC01 have CRC cards. Other domain classes get cards when their use cases are designed.
2. Programme is outside the system. The domain model's Programme class is not a software class here because academic records stay in existing systems (A3). The system only keeps the student's `programmeId` and reads that programme's evidence requirements, held in `EvidenceRequirements`.
3. In-progress status is internal. `RequestStatus` includes *in progress* so a Request always has a valid status, but it is never visible to students or staff because in-progress requests are not saved (DR-008).
4. Evidence stays an attribute. Evidence is a list held by `Request`, as in the domain model and 06 Note 2. No Evidence class is added.
5. What makes an opportunity open is still open (OI1). Following 05 Note 3 and 06 Note 6, being open is a precondition, so the handler does not call `Opportunity.isOpen()` in UC01. The method is kept on `Opportunity` (Information Expert) so that if the group adds a "not open" exception, the handler calls it in CO1, signals `OPPORTUNITY_NOT_OPEN`, and SSD-01 gains a matching failure branch. `isOpen()` would use the opportunity's status until a fuller rule is agreed.
6. Method names are agreed. The names proposed on these cards (`recordPreferences`, `missingFrom`, `isMetBy` and the rest) were adopted in 08 and 09 and the types are fixed in 08 and 10. If any name changes, this file, 08, 09 and 10 change together.
7. Design-level link to evidence requirements. `Request` holds the `EvidenceRequirements` read at startRequest. This link is a design decision, not a domain-model association, so it does not contradict 06 ("the domain model is unchanged"). It is shown in the design class diagram (08).
8. In-progress handling follows DR-008 (accepted). Only confirmed requests are saved, which is why the CO4 and CO5 rows and the `RequestRepository` card are designed this way.
9. Test fakes share their port's card. The in-memory repositories and `FixedClock` only implement a port and add no responsibility of their own, so they do not have separate cards. `FakeProgrammeEvidenceAdapter` has its own card because it holds the fixed evidence list that matches the Gherkin Background.
