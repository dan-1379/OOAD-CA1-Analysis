# OOAD CA2 – Object-Oriented Design
 
**Module:** SAAD71000 Systems Analysis and Design · Munster Technological University, Kerry
**Scenario:** Scenario 28 – Student Work-Placement Coordination Service (Kerry College Placement Office)
**Selected:** 9 November 2026 · Approved by Andrew Shields ([DR-002](decisions/decision-log.md))
 
<br>

## Product Goal
 
> Give the Kerry College Placement Office one reliable, shared view of every placement request and placement, so students know what their request is waiting on, staff apply the same rules every time, and earlier decisions are never lost.
 
The Product Goal states the value the service is meant to deliver. The work towards it is ordered in the Product Backlog.
 
<br>

## Team
 
| Member | Scenario analysed in CA1 | CA2 files owned |
| :--- | :--- | :--- |
| Daniel Courtney | 28 – Student Work-Placement Coordination Service | 01-04 |
| Eoin Mannix | 02 – Kerry Mobile Library Support Service | 08, 09 |
| Isabelle Lynch | 05 – Rural Health Appointment Transport Service | 05, 06, 07 |
| Bartlomiej Jedrzejowski | 03 – Volunteer Transport Coordination Service | 10 |
 
<br>

## Where to Find Things
 
| Area | Link |
| :--- | :--- |
| Definition of Done | [definition-of-done.md](definition-of-done.md) |
| Decision log | [decisions/decision-log.md](decisions/decision-log.md) |
| AI declaration and shared AI log | [references/AI-Log.md](references/AI-Log.md) |
| Text references | [references/Text-References.md](references/Text-References.md) |
| CA1 analysis (Scenario 28) | [CA1/](../CA1/) |
 
<br>

## Design Dossier
 
The dossier is read in order. Files 01–04 and the shared design files apply to the whole group. Files 05, 06 and 09 cover UC01 only and are kept at the CA2 root (DR-009).
 
| # | Artefact | Scope | File |
| :--- | :--- | :--- | :--- |
| 01 | Scenario suitability matrix | Group | [01-scenario-suitability-matrix.md](01-scenario-suitability-matrix.md) |
| 02 | Reconciliation and expansion record | Group | [02-reconciliation-and-expansion-record.md](02-reconciliation-and-expansion-record.md) |
| 03 | Revised analysis baseline | Group | [03-revised-analysis-baseline.md](03-revised-analysis-baseline.md) |
| 04 | Prioritised implementation catalogue | Group | [04-prioritised-implementation-catalogue.md](04-prioritised-implementation-catalogue.md) |
| 05 | System sequence diagram | UC01 | [05-system-sequence-diagrams.md](05-system-sequence-diagrams.md) |
| 06 | Operation contracts | UC01 | [06-operation-contracts.md](06-operation-contracts.md) |
| 07 | CRC and responsibility model | Group | [07-crc-responsibility-model.md](07-crc-responsibility-model.md) |
| 08 | Design class diagram | Group | [08-design-class-diagram.md](08-design-class-diagram.md) |
| 09 | Object-interaction sequence diagrams | UC01 | [09-object-interaction-sequence-diagrams.md](09-object-interaction-sequence-diagrams.md) |
| 10 | Architecture and integration contract | Group | [10-architecture-and-integration-contract.md](10-architecture-and-integration-contract.md) |
 
<br>

## Repository Structure
 
```
CA2/
├── README.md                       this file
├── definition-of-done.md
├── 01–10                           design dossier files
├── use-cases/                      UC01 detailed use case
├── features/                       Gherkin .feature files
├── diagrams/                       PlantUML .puml sources and exported .png files
├── decisions/                      decision log
└── references/                     scenario briefs, scenario summaries, AI log, text references
```
 
<br>

## Working Conventions
 
- **Identifiers** follow the CA1 and are never renumbered: FR, NFR, BR, A, Q, US, UC and SC. Reconciliation items use RC, PA, EX and CL. Decisions use DR.
- **Backlog items** are GitHub Issues, labelled `story`, `design-task`, `spike`, `defect` or `enabler`, and mirrored on the board.
- **Branches:** one short-lived branch per issue, for example `feature/12-uc01-ssd`.
- **Pull requests:** every significant change goes through a PR that links its issue (`Closes #12`), uses the PR template, and is approved by one member who did not write it. `main` is protected.
- **Diagrams:** the `.puml` source is committed alongside its exported `.png`.
- **Decisions** that change the shared baseline are recorded in the decision log before or with the PR that makes the change.
- **AI use** is recorded in the shared AI log. Any AI-supported change to the shared design goes through a decision record and a reviewed PR.