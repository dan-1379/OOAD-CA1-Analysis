# 10 – Design Structure and Shared Interfaces

## 1. Purpose

This file shows the layered structure of the UC01 `Submit Placement Request` design and the shared interfaces, types and conventions that connect its parts. It is needed because [SSD-01](./05-system-sequence-diagrams.md) shows an external call to Academic Records (`getRequiredEvidence(programme)`) and leaves the parameter types open ([05](./05-system-sequence-diagrams.md#notes-and-assumptions) note 6, [06](./06-operation-contracts.md#notes-and-assumptions) note 8). This file turns external dependencies into interfaces, so the design does not rely on how the academic records system works. The operation contracts (06), design class diagram (08) and object-interaction sequence diagrams (09) use the names and conventions defined here.

## 2. Package / layer view

Source: `diagrams/package-view-uc01.puml`

Package view

| Layer / package    | Responsibility                                                       | Contains (classes from 08)                                                    | May depend on                   | Must not depend on                        |
| ------------------ | -------------------------------------------------------------------- | ----------------------------------------------------------------------------- | ------------------------------- | ----------------------------------------- |
| Presentation       | Show screens and take student's input                                | Nothing designed, no UI in CA2 scope                                          | Application                     | Domain, Ports, Infrastructure             |
| Application        | Coordinate work and receive five system operations from the SSD.     | The controller. See [07](./07-crc-responsibility-model.md)                    | Domain, Ports                   | Presentation, Infrastructure              |
| Domain             | Hold business data and enforce BR01.                                 | Classes:<br>`Request`, `Student`, `Programme`, `Opportunity`, `RequestStatus` | None                            | All other Layers                          |
| Ports / Interfaces | Describe what the design needs from the outside, without saying how. | `ProgrammeEvidencePort`(IF-01) and Request Store (IF-02, once agreed).        | Domain                          | Application, Presentation, Infrastructure |
| Infrastructure     | Connect to real outside systems                                      | Academic Records adapter and request store implementation                     | Ports (Implements them), Domain | Application, Presentation                 |

### 2.1 Dependency rules - GRASP (General Responsibility Assignment Software Patterns)

- **Dependencies point inwards.** The Domain layer depends on no other layer, so BR01 is enforced in the same way regardless of where evidence requirements come from or how requests are stored (Low Coupling, Layers pattern).
- **Presentation only speaks to the Application layer.** The five system operations from the SSD arrive at one controller, so the screens contain no business rules (GRASP Controller, Model–View Separation).
- **The Application layer uses ports, never infrastructure.** The controller asks `ProgrammeEvidencePort` for requirements without knowing it is Academic Records. If the college changes systems, only the adapter changes (Protected Variations).
- **Infrastructure implements ports, and nothing depends on infrastructure.** The Academic Records adapter and the store implementation can be swapped without touching the domain or the controller (Indirection).

<br>

## 3. Shared types

| Type            | Kind (enum / value object / identifier) | Values or fields | Rule it supports | Used in     |
| --------------- | --------------------------------------- | ---------------- | ---------------- | ----------- |
| `RequestStatus` | enum                                    |                  | BR01             | COx, OSD-04 |
|                 |                                         |                  |                  |             |

<br>

## 4. Interface catalogue

### IF-01 – `<EvidenceRequirementsProvider>`

| Field                    | Content     |
| ------------------------ | ----------- |
| Purpose                  |             |
| Used by (class from 08)  |             |
| Realised by              |             |
| Why an interface (GRASP) |             |
| Appears in               | OSD-04, COx |

|Operation|Input|Output|Errors|
|---|---|---|---|
|||||

### IF-02 – `<PlacementRequestStore>`

|Field|Content|
|---|---|
|Purpose||
|Used by (class from 08)||
|Realised by||
|Why an interface (GRASP)||
|Appears in|OSD-04, CO-xx|

|Operation|Input|Output|Errors|
|---|---|---|---|
|||||

<br>

## 5. Input, output and result types

### 5.1 Inputs and outputs per system operation

| System operation (from 05)      | Input | Output / result | Contract |
| ------------------------------- | ----- | --------------- | -------- |
| `startRequest(opportunity)`     |       |                 | CO1      |
| `enterPreferences(preferences)` |       |                 | CO2      |
| `addEvidence(evidenceItem)`     |       |                 | CO3      |
| `confirmRequest()`              |       |                 | CO4      |
| `cancelRequest()`               |       |                 | CO5      |

### 5.2 Result convention

<!-- How an operation reports success vs a controlled failure, e.g. a result object with outcome + reason vs throwing exceptions. State the choice and why (DR-010). --> <br>

## 6. Error conventions

| Error                  | Meaning | Raised by (operation) | Rule / extension  | Gherkin |
| ---------------------- | ------- | --------------------- | ----------------- | ------- |
| `OPPORTUNITY_NOT_OPEN` |         |                       | UC01 precondition |         |


<br>

## 7. Decisions and rejected alternatives

|DR|Decision|Rejected alternative|Reason|
|---|---|---|---|
|DR-010||||

<br>

## 8. Assumptions and limitations

<!-- Feeds the design evaluation. e.g. evidence requirements come from outside the system (A3, A5); store is abstract because persistence is out of scope for CA2. -->