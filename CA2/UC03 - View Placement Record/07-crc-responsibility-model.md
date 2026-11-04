# 07 – CRC / Responsibility Model

| Field | Value |
|---|---|
| Artefact ID | CA2-07 |
| Owner | |
| Reviewer | |
| Version / status | v0.1 – Draft |
| Last updated | YYYY-MM-DD |
| Inputs from | [06 Contracts](06-operation-contracts.md), [03 Domain model](03-revised-analysis-baseline.md) |
| Feeds into | [08 Design classes](08-design-class-diagram.md), [09 Interactions](09-object-interaction-sequence-diagrams.md) |
| Brief reference | CA2 §7 |

> **Quality check (CA2 §7):** Behaviour is distributed coherently; no unjustified God controller.

## 1. Controller choice

| System operation(s) | Controller | Type (façade / use-case controller) | Rationale |
|---|---|---|---|
| | | | |

## 2. CRC cards

### \<ClassName\>

| Responsibilities | Collaborators |
|---|---|
| *Knowing:* | |
| | |
| *Doing:* | |
| | |

### \<ClassName\>

| Responsibilities | Collaborators |
|---|---|
| *Knowing:* | |
| | |
| *Doing:* | |
| | |

### \<ClassName\>

| Responsibilities | Collaborators |
|---|---|
| *Knowing:* | |
| | |
| *Doing:* | |
| | |

## 3. Responsibility assignment rationale (GRASP)

Principles: Information Expert · Creator · Controller · Low Coupling · High Cohesion · Polymorphism · Pure Fabrication · Indirection · Protected Variations

| Responsibility | Assigned to | GRASP principle(s) | Alternative considered | Why rejected | Linked CO |
|---|---|---|---|---|---|
| | | | | | |

## 4. Coupling and cohesion review

| Class | Number of collaborators | Concern | Action taken |
|---|---|---|---|
| | | | |

## 5. God-controller check

- Does any controller contain domain logic that belongs to an expert class?
- Does any class own more than one cohesive area of responsibility?
- Findings and actions:
