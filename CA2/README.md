# OOAD CA2 – Object-Oriented Design
 
**Module:** SAAD71000 Systems Analysis and Design · Munster Technological University, Kerry
**Scenario:** Scenario 28 – Student Work-Placement Coordination Service (Kerry College Placement Office)
**Selected:** 9 November 2026 · Approved by Andrew Shields ([DR-002](decisions/decision-log.md))
 
<br>

## Product Goal
 
> *Draft – to be agreed by the group.*
>
> Give the Kerry College Placement Office one reliable, shared view of every placement request and placement, so students know what their request is waiting on, staff apply the same rules every time, and earlier decisions are never lost.
 
The Product Goal states the value the service is meant to deliver. The work towards it is ordered in the Product Backlog.
 
<br>

## Team
 
| Member | Scenario analysed in CA1 | CA3 slice |
| :--- | :--- | :--- |
| Daniel Courtney | 28 – Student Work-Placement Coordination Service | *To be agreed in the [implementation catalogue](04-prioritised-implementation-catalogue.md)* |
| Eoin Mannix | 02 – Kerry Mobile Library Support Service | *To be agreed* |
| Isabelle Lynch | 05 – Rural Health Appointment Transport Service | *To be agreed* |
| Bartlomiej Jedrzejowski | 03 – Volunteer Transport Coordination Service | *To be agreed* |
 
<br>

## Where to Find Things
 
| Area | Link |
| :--- | :--- |
| Project board | *[Add Trello board link]* |
| Product Backlog | *[Add Product Backlog]* |
| Definition of Done | [definition-of-done.md](definition-of-done.md) |
| Decision log | [decisions/decision-log.md](decisions/decision-log.md) |
| Iteration records (goals, reviews, retrospectives) | [records/](records/) |
| AI declaration and shared AI log | [references/AI-Log.md](references/AI-Log.md) |
| Text references | [references/Text-References.md](references/Text-References.md) |
| CA1 analysis (Scenario 28) | [CA1/](../CA1/) |
 
<br>

## Design Dossier
 
The dossier is read in order. Files 01–04 and the shared design files apply to the whole group. Files inside each use case folder are owned by one member.
 
| # | Artefact | Scope | File |
| :--- | :--- | :--- | :--- |
| 01 | Scenario suitability matrix | Group | [01-scenario-suitability-matrix.md](01-scenario-suitability-matrix.md) |
| 02 | Reconciliation and expansion record | Group | [02-reconciliation-and-expansion-record.md](02-reconciliation-and-expansion-record.md) |
| 03 | Revised analysis baseline | Group | [03-revised-analysis-baseline.md](03-revised-analysis-baseline.md) |
| 04 | Prioritised implementation catalogue | Group | [04-prioritised-implementation-catalogue.md](04-prioritised-implementation-catalogue.md) |
| 05 | System sequence diagram | Per use case | `use-cases/<use case>/05-system-sequence-diagram.md` |
| 06 | Operation contracts | Per use case | `use-cases/<use case>/06-operation-contracts.md` |
| 07 | CRC and responsibility model | Group | [07-crc-responsibility-model.md](07-crc-responsibility-model.md) |
| 08 | Design class diagram | Group | [08-design-class-diagram.md](08-design-class-diagram.md) |
| 09 | Object-interaction sequence diagram | Per use case | `use-cases/<use case>/09-object-interaction-sequence-diagram.md` |
| 10 | Architecture and integration contract | Group | [10-architecture-and-integration-contract.md](10-architecture-and-integration-contract.md) |
| 11 | CA3 slice specification | Per use case | `use-cases/<use case>/11-ca3-slice-specification.md` |
| 12 | Technology decision record | Group | [12-technology-decision-record.md](12-technology-decision-record.md) |
| 13 | Project and contribution evidence | Group, plus one statement per member | [13-project-and-contribution-evidence.md](13-project-and-contribution-evidence.md) |
 
<br>

## Repository Structure
 
```
CA2/
├── README.md                       this file
├── definition-of-done.md
├── 01–13                           group design files
├── use-cases/
│   └── UCxx-<name>/                one folder per selected use case
├── features/                       Gherkin .feature files
├── diagrams/                       PlantUML .puml sources and exported .png files
├── decisions/                      decision log
├── records/                        iteration goals, reviews and retrospectives
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