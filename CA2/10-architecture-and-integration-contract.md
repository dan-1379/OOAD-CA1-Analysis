# 10 – Architecture and Integration Contract

| Field | Value |
| --- | --- |
| Artefact ID | CA2-10 |
| Owner | Bartlomiej Jedrzejowski |
| Reviewer | Daniel Courtney |
| Feeds into | Shared names and types used by 05, 06, 07, 08 and 09 |


## 1. Purpose

This file shows the layered structure of the UC01 `Submit Placement Request` design and the shared interfaces, types and conventions that connect its parts. It is needed because [SSD-01](./05-system-sequence-diagrams.md) shows an external call to Academic Records (`getRequiredEvidence(programme)`) and leaves the parameter types open ([05](./05-system-sequence-diagrams.md#notes-and-assumptions) note 6, [06](./06-operation-contracts.md#notes-and-assumptions) note 8). This file turns external dependencies into interfaces, so the design does not rely on how the academic records system works. The operation contracts (06), design class diagram (08) and object-interaction sequence diagrams (09) use the names and conventions defined here.

## 2. Package / layer view

Source: [`diagrams/package-view-uc01.puml`](diagrams/package-view-uc01.puml)

![Package view](diagrams/package-view-uc01.png)

| Layer / package | Responsibility | Contains | May depend on | Must not depend on |
| --- | --- | --- | --- | --- |
| Presentation | Show screens and take student's input | Nothing designed, no UI in CA2 scope | Application | Domain, Ports, Infrastructure |
| Application | Coordinates work and receives the five system operations from the SSD. | `SubmitPlacementRequestHandler` (see [07](./07-crc-responsibility-model.md)) | Domain, Ports | Presentation, Infrastructure |
| Domain | Holds business data and enforces BR01. | `Request`, `Student`, `Opportunity`, `EvidenceRequirements`, `Receipt`, `RequestStatus` | None | All other layers |
| Ports / Interfaces | Describes what the design needs from outside, without saying how. | `ProgrammeEvidencePort` (IF-01), `RequestRepository` (IF-02), `StudentRepository` (IF-03), `OpportunityRepository` (IF-04), `Clock` (IF-05) | Domain | Application, Presentation, Infrastructure |
| Infrastructure | Connects to real outside systems (named, not built). | `AcademicRecordsAdapter`, `PlacementRecordRequestRepository`, `PlacementRecordStudentRepository`, `PlacementRecordOpportunityRepository`, `SystemClock` | Ports (implements them), Domain | Application, Presentation |

### 2.1 Dependency rules

- **Dependencies point inwards.** The Domain layer depends on no other layer, so BR01 is enforced in the same way regardless of where evidence requirements come from or how requests are stored (Low Coupling, Layers pattern).
- **Presentation only speaks to the Application layer.** The five system operations from the SSD arrive at one controller, so the screens contain no business rules (GRASP Controller, Model–View Separation).
- **The Application layer uses ports, never infrastructure.** The controller asks `ProgrammeEvidencePort` for requirements without knowing it is Academic Records. If the college changes systems, only the adapter changes (Protected Variations).
- **Infrastructure implements ports, and nothing depends on infrastructure.** The Academic Records adapter and the store implementation can be swapped without touching the domain or the controller (Indirection).

<br>

## 3. Shared types

| Type | Kind | Values or fields | Rule it supports | Used in |
| --- | --- | --- | --- | --- |
| `RequestStatus` | enum | `IN_PROGRESS` (internal, never shown – 06 CO1, 07 note 3), `AWAITING_EVIDENCE`, `READY_FOR_DECISION` | BR01 | CO1, CO3, CO4, OSD-04, SC01–SC04 |
| `EvidenceItem` | identifier | `E1`, `E2`, `E3` (feature file Background), compared by identifier | BR01 | `Request.evidence`, `EvidenceRequirements`, `addEvidence(evidenceItem)`, `getRequiredEvidence` result, CO3, CO4, SC02–SC04, 08 |
| `waitingOn` | list | The list of `EvidenceItem`s still missing when the request is confirmed. Empty when the request is *ready for decision* | FR02, BR01 | CO4, OSD-04, SC03, SC04 |


<br>

## 4. Interface catalogue

### IF-01 – `ProgrammeEvidencePort`

| Field | Content |
| --- | --- |
| Purpose | Supplies the evidence items a programme requires |
| Used by | `SubmitPlacementRequestHandler` |
| Realised by | `AcademicRecordsAdapter` |
| Why an interface | Protected Variations: academic records are an external system (A3) that the college may change, so only the adapter would change |
| Appears in | SSD-01, OSD-01, CO1 (output) |

| Operation | Input | Output | Errors |
| --- | --- | --- | --- |
| `getRequiredEvidence(programme)` | Student's programme reference | `EvidenceRequirements` | `ACADEMIC_RECORDS_UNAVAILABLE` |

### IF-02 – `RequestRepository`

| Field | Content |
| --- | --- |
| Purpose | Stores confirmed requests in the single shared placement record. |
| Used by | `SubmitPlacementRequestHandler` |
| Realised by | `PlacementRecordRequestRepository` |
| Why an interface | Pure Fabrication: no domain class is a natural home for storage, so a separate class holds it. `Request` stays focused on its own responsibilities (evidence, status, BR01) (High Cohesion) and does not depend on how requests are stored (Low Coupling). |
| Appears in | OSD-04, CO4 |

| Operation | Input | Output | Errors |
| --- | --- | --- | --- |
| `save(request)` | The confirmed `Request` | none | `CANNOT_SAVE` |
| `findByStudent(studentId)` | Student reference | List of that student's confirmed `Request`s | none |

### IF-03 – `StudentRepository`

| Field | Content |
| --- | --- |
| Purpose | Finds the identified student by reference. |
| Used by | `SubmitPlacementRequestHandler` |
| Realised by | `PlacementRecordStudentRepository` |
| Why an interface | Pure Fabrication: no domain class should know how students are looked up (Low Coupling) |
| Appears in | OSD-01, CO1 (precondition) |

| Operation | Input | Output | Errors |
| --- | --- | --- | --- |
| `findByReference(studentRef)` | Student reference | `Student` | `STUDENT_NOT_FOUND` |

### IF-04 – `OpportunityRepository`

| Field | Content |
| --- | --- |
| Purpose | Finds the requested opportunity by reference. |
| Used by | `SubmitPlacementRequestHandler` |
| Realised by | `PlacementRecordOpportunityRepository` |
| Why an interface | Pure Fabrication: no domain class should know how opportunities are looked up (Low Coupling) |
| Appears in | OSD-01, CO1 (step 1) |

| Operation | Input | Output | Errors |
| --- | --- | --- | --- |
| `findByReference(opportunityRef)` | Opportunity reference | `Opportunity` | `OPPORTUNITY_NOT_FOUND` |

### IF-05 – `Clock`

| Field | Content |
| --- | --- |
| Purpose | Supplies the current date. |
| Used by | `SubmitPlacementRequestHandler` |
| Realised by | `SystemClock` |
| Why an interface | Protected Variations: the date is an external concern so the handler depends on this interface rather than on the operating system's clock |
| Appears in | OSD-04, CO4 |

| Operation | Input | Output | Errors |
| --- | --- | --- | --- |
| `today()` | none | Current date | none |

<br>

## 5. Input, output and result types

### 5.1 Inputs and outputs per system operation

| System operation (from 05) | Input | Output / result | Contract |
| --- | --- | --- | --- |
| `startRequest(opportunity)` | Opportunity reference. | `EvidenceRequirements`. | CO1 |
| `enterPreferences(preferences)` | Student's preferences. | Acknowledgement that the preferences were recorded. | CO2 |
| `addEvidence(evidenceItem)` | One `EvidenceItem` | List of `EvidenceItem`s still missing (empty if complete) | CO3 |
| `confirmRequest()` | none | `Receipt`. | CO4 |
| `cancelRequest()` | none | Acknowledges submission cancellation. Nothing is recorded. | CO5 |

### 5.2 Result convention
Normal outcomes of each system operation are returned as the outputs listed in §5.1. When a precondition is broken or an outside system fails, the operation stops, signals one of the named errors in §6, and nothing is recorded in the shared placement record. *Awaiting evidence* (4b) and *cancelled* (5a) are normal outcomes, not errors. This keeps the outputs simple (`confirmRequest` returns a plain `Receipt`) and matches the operation contracts, where a broken precondition means the operation does not run and none of its postconditions happen.


## 6. Error conventions

| Error | Meaning | Raised by | Source | Gherkin |
| --- | --- | --- | --- | --- |
| `STUDENT_NOT_FOUND` | The system cannot find the student. Possibly doesn't exist | `startRequest` | UC01 precondition. CO1 precondition. | none |
| `ACADEMIC_RECORDS_UNAVAILABLE` | The system cannot reach Academic Records | `startRequest` | none (new in 10, comes from A3) | none |
| `NO_REQUEST_IN_PROGRESS` | There is no request in progress (e.g. `addEvidence` called before `startRequest`) | `enterPreferences`, `addEvidence`, `confirmRequest`, `cancelRequest` | CO2–CO5 preconditions. | none |
| `CANNOT_SAVE` | The shared placement record could not be written to. No `Receipt` is issued, and the request is not recorded and remains the handler's in-progress request. | `confirmRequest` | UC01 minimal guarantee. CO4. | none |
| `OPPORTUNITY_NOT_FOUND` | The system cannot find the opportunity. Possibly doesn't exist | `startRequest` | UC01 precondition. CO1 precondition. | none |
| `OPPORTUNITY_NOT_OPEN` | Opportunity exists but is not open for requests. | Not raised in UC01. Reserved until OI1 is resolved. | UC01 precondition. Open issue OI1. | none |


<br>

## 7. Decisions and rejected alternatives

| DR | Decision | Rejected alternative | Reason |
| --- | --- | --- | --- |
| DR-010 | Named errors signalled for failures. Normal outcomes returned. | Return a result object from every operation. | This keeps the outputs simple, and matches the operation contracts. |
| DR-011 | Keep `Clock` as a port. | The handler reads the system date directly. | Protected Variations: the date source is an external concern, so the handler depends on an interface rather than the operating system's clock. |

<br>

## 8. Assumptions and limitations

- Evidence requirements come from outside the system (A3, A5)
- Storage is abstract, because how the shared placement record is kept is out of scope for CA2 (no implementation).
- `ACADEMIC_RECORDS_UNAVAILABLE`: the error is signalled, but no recovery (retry or manual entry) is designed. (New in 10)
