# 03 – Revised Analysis Baseline

| Field | Value |
|---|---|
| Artefact ID | CA2-03 |
| Owner | |
| Reviewer | |
| Version / status | v0.1 – Draft |
| Last updated | YYYY-MM-DD |
| Inputs from | [02 Reconciliation](02-reconciliation-and-expansion-record.md) |
| Feeds into | [04](04-prioritised-implementation-catalogue.md), [05](05-system-sequence-diagrams.md), [06](06-operation-contracts.md) |
| Brief reference | CA2 §4.1, §7 |

> **Quality check (CA2 §7):** Identifiers and terminology remain consistent across all artefacts.

## 0. Identifier conventions

| Prefix | Meaning |
|---|---|
| PG | Product Goal |
| SH / SG | Stakeholder / Stakeholder goal |
| FR / NFR | Functional / Non-functional requirement |
| BR | Business rule |
| A / C / R / Q | Assumption / Constraint / Risk / Question |
| UC | Use case |
| SC | Gherkin scenario |
| SSD | System sequence diagram |
| CO | Operation contract |
| OSD | Object-interaction sequence diagram |
| IF | Public interface / port |
| SL | CA3 slice |
| DR | Decision record |
| PBI | Product Backlog item |

## 1. Product Goal

> Describe intended value and outcome, not a feature list (CA2 §4.1).

**PG-01:**

## 2. Purpose and scope

### 2.1 Purpose

### 2.2 In scope

| ID | Function |
|---|---|
| | |

### 2.3 Out of scope

| Item | Reason |
|---|---|
| | |

### 2.4 Dependencies

## 3. Stakeholders and actors

### 3.1 Stakeholder catalogue

| SH ID | Stakeholder | Type (Direct / Indirect / External) | Goals (SG) | Concerns | Influence |
|---|---|---|---|---|---|
| | | | | | |

### 3.2 Actors

| Actor | Role (Primary / Supporting / Offstage) | Crosses system boundary? | Notes |
|---|---|---|---|
| | | | |

### 3.3 Actor-goal table

| Actor | Goal | Use case |
|---|---|---|
| | | |

## 4. Requirements

### 4.1 Functional requirements

| FR ID | Requirement | Source / rationale | MoSCoW | Verification | Change from CA1 |
|---|---|---|---|---|---|
| | | | | | |

### 4.2 Non-functional requirements

| NFR ID | Quality | Measurable criterion | Source | MoSCoW | Verification |
|---|---|---|---|---|---|
| | | | | | |

## 5. Business rules

| BR ID | Rule | Source / evidence | Status (Confirmed / Assumed) | Related FR |
|---|---|---|---|---|
| | | | | |

## 6. Assumptions, constraints, risks and questions

### 6.1 Assumptions

| A ID | Assumption | Why needed | Confirm with |
|---|---|---|---|
| | | | |

### 6.2 Constraints

| C ID | Constraint | Source |
|---|---|---|
| | | |

### 6.3 Risks

| R ID | Risk | Likelihood | Impact | Mitigation |
|---|---|---|---|---|
| | | | | |

### 6.4 Open questions

| Q ID | Question | Why it matters | Owner |
|---|---|---|---|
| | | | |

## 7. Use cases

### 7.1 Use-case diagram

Source: `diagrams/use-case-model.puml`

![Use-case model](diagrams/use-case-model.png)

### 7.2 Use-case catalogue

| UC ID | Name | Primary actor | Goal | Priority | Related FR |
|---|---|---|---|---|---|
| | | | | | |

### 7.3 Detailed use cases

#### UC-xx – \<name\>

| Field | Content |
|---|---|
| Primary actor | |
| Supporting actors | |
| Stakeholders and interests | |
| Preconditions | |
| Trigger | |
| Postconditions (success guarantee) | |
| Related FR / BR / SC | |

**Main success scenario**

1.
2.
3.

**Alternative flows**

- 2a.

**Exceptions**

- \*a.

## 8. Gherkin acceptance examples

Feature files are kept in `features/`.

| SC ID | Feature file | Scenario | Type (Success / Alternative / Failure / Boundary) | UC | FR / BR |
|---|---|---|---|---|---|
| | | | | | |

## 9. Refined domain model

### 9.1 Diagram

Source: `diagrams/domain-model.puml`

![Domain model](diagrams/domain-model.png)

### 9.2 Changes from CA1 domain model

| Change | Reason | DR |
|---|---|---|
| | | |

### 9.3 Glossary

| Term | Definition | Synonyms to avoid | Model element |
|---|---|---|---|
| | | | |

## 10. Traceability matrix

| SG | FR / NFR | BR | UC | SC | Domain concept | SSD / CO |
|---|---|---|---|---|---|---|
| | | | | | | |
