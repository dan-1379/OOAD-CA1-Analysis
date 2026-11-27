# 11 - Traceability Matrix

| Field | Value |
| --- | --- |
| Artefact ID | CA2-11 |
| Owner | Daniel Courtney |
| Reviewer | Isabelle Lynch |
| Feeds into | Design dossier, design walkthrough |

## Purpose

This matrix traces the selected use case from its backlog item and requirements through to the design classes that realise it. It shows that every requirement and rule UC01 depends on reaches the design, and that every design element can be traced back to a requirement.

Only UC01 is designed in CA2 ([DR-003](decisions/decision-log.md)), so the use-case table has one row. The second table breaks that row down by system operation, so each link in the chain can be checked against its neighbours. The third table traces each Gherkin scenario through the design.

<br>

## Use Case Traceability

| Use case | Backlog | Story and requirement | Rules and assumptions | Gherkin | SSD | Contracts | CRC and GRASP | Interaction design | Design classes | Structure | Decisions |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| [UC01 Submit Placement Request](use-cases/UC01-submit-placement-request.md) | [04](04-prioritised-implementation-catalogue.md#selected-use-case): rank 1, Must, DR-003 | US01, FR01 | BR01, A3, A5 | [SC01 - SC05](features/submit-placement-request.feature) | [SSD-01](05-system-sequence-diagrams.md) | [CO1 - CO5](06-operation-contracts.md) | [07](07-crc-responsibility-model.md): 12 CRC cards, 8 GRASP decisions | [OSD-01 - OSD-05](09-object-interaction-sequence-diagrams.md) | [DCD-01](08-design-class-diagram.md): `SubmitPlacementRequestHandler`, `Student`, `Opportunity`, `Request`, `EvidenceRequirements`, `RequestStatus`, `Receipt` | [10](10-architecture-and-integration-contract.md): IF-01 - IF-05 | DR-003, DR-006, DR-008, DR-010, DR-011 |

<br>

## Breakdown by System Operation

| System operation (SSD-01) | UC01 step | Contract | Controller | Responsible objects and messages | GRASP | Interfaces used | Errors (10 section 6) | Sequence diagram |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `startRequest(opportunity)` | 1 | CO1 | `SubmitPlacementRequestHandler` | `StudentRepository.findByReference`, `OpportunityRepository.findByReference`, `Student.getProgrammeId`, `ProgrammeEvidencePort.getRequiredEvidence`, `Student.startRequest` creates `Request` (`IN_PROGRESS`) | Controller, Creator, Indirection, Protected Variations | IF-01, IF-03, IF-04 | `STUDENT_NOT_FOUND`, `OPPORTUNITY_NOT_FOUND`, `ACADEMIC_RECORDS_UNAVAILABLE` | [OSD-01](09-object-interaction-sequence-diagrams.md#osd-01-startrequest-co1) |
| `enterPreferences(preferences)` | 2 | CO2 | Handler | `Request.recordPreferences` | Information Expert | - | `NO_REQUEST_IN_PROGRESS` | [OSD-02](09-object-interaction-sequence-diagrams.md#osd-02-enterpreferences-co2) |
| `addEvidence(evidenceItem)` | 3, 4, 4a | CO3 | Handler | `Request.addEvidence`, `Request.missingEvidence` asks `EvidenceRequirements.missingFrom` | Information Expert | - | `NO_REQUEST_IN_PROGRESS` | [OSD-03](09-object-interaction-sequence-diagrams.md#osd-03-addevidence-co3) |
| `confirmRequest()` | 5 - 7, 4b | CO4 | Handler | `Clock.today`, `Request.confirm(today)` asks `EvidenceRequirements.isMetBy` (BR01) and `missingFrom`, `RequestRepository.save`, `Request.createReceipt` creates `Receipt` | Information Expert, Creator, Pure Fabrication, Protected Variations | IF-02, IF-05 | `NO_REQUEST_IN_PROGRESS`, `CANNOT_SAVE` | [OSD-04](09-object-interaction-sequence-diagrams.md#osd-04-confirmrequest-co4) |
| `cancelRequest()` | 5a | CO5 | Handler | Handler discards the in-progress `Request`. It was never saved ([DR-008](decisions/decision-log.md)) | Controller | - | `NO_REQUEST_IN_PROGRESS` | [OSD-05](09-object-interaction-sequence-diagrams.md#osd-05-cancelrequest-co5) |

<br>

## Gherkin Scenarios Traced Through the Design

| Scenario | UC01 path | Operations | Outcome in the design | Sequence diagrams |
| --- | --- | --- | --- | --- |
| SC01 | Main success | startRequest, enterPreferences, addEvidence, confirmRequest | `isMetBy` true: status `READY_FOR_DECISION`, request saved, receipt shown | OSD-01, 02, 03, 04 (met branch) |
| SC02 | 4a | addEvidence more than once, then confirmRequest | `missingEvidence` lists E2, student adds it, then as SC01 | OSD-03 (repeated), OSD-04 (met branch) |
| SC03 | 4b | confirmRequest with E2 missing | `isMetBy` false: status `AWAITING_EVIDENCE`, `waitingOn` lists E2, request saved | OSD-04 (not met branch) |
| SC04 | Boundary | confirmRequest with 3, 2, 1 and 0 items | Both branches of the OSD-04 `alt` | OSD-04 |
| SC05 | 5a | cancelRequest | Nothing recorded (minimal guarantee) | OSD-05 |

<br>

## Consistency Checks

| Check | Result |
| --- | --- |
| Every system event in SSD-01 has one contract | Yes. Five events, CO1 - CO5 |
| Every contract has one sequence diagram | Yes. CO1 - CO5 map to OSD-01 - OSD-05 |
| Every Gherkin scenario traces to a path in the design | Yes. See the table above |
| Every message in 09 is an operation on its receiving class in 08 | Yes, with one exception. `Opportunity.getTitle()` is read while building the `Receipt` but is not drawn as its own message (09 Message Index) |
| Every operation in 08 is used by a sequence diagram | Not fully. `Opportunity.isOpen()` is reserved until OI1 is resolved, and `RequestRepository.findByStudent()` supports checking the recorded request but is not called in UC01 |
| BR01 is applied in one place only | Yes. Only `Request.confirm()` sets `READY_FOR_DECISION` or `AWAITING_EVIDENCE` |
| The minimal guarantee holds on every path | Yes. `save()` appears only in OSD-04, and OSD-05 discards the request without touching the repository |
| Every named error has a Gherkin scenario | No. None of the errors in 10 section 6 are covered by Gherkin. This is recorded as a limitation in the [design evaluation](12-design-evaluation.md) |
| Names match across 05 - 10 | Yes. `startRequest(opportunity)`, `findByReference`, OSD-01 - OSD-05 and the class names are the same in every file |
