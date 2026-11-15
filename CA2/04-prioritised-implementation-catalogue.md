# 04 - Prioritised Implementation Catalogue

## Purpose

This catalogue ranks the twelve Scenario 28 use cases against agreed criteria and records which use case is taken forward into detailed design and CA3. The group has chosen to design one use case in depth, **UC01 Submit Placement Request**, with every member contributing to its design. The selection, and how CA3 slices are divided between members, is recorded in [DR-003](decisions/decision-log.md).

<br>

## Selection Criteria

Each candidate use case was assessed against the following criteria:

| # | Criterion | Source |
| :--- | :--- | :--- |
| **CR-1** | Receives a system event or input, applies at least one business rule, changes state and produces an observable outcome (vertical) | Brief section 8 |
| **CR-2** | Has enough behaviour (alternatives, failures, rules) to give every member meaningful design work | Brief section 2 (scope), CA3 slice specifications |
| **CR-3** | Can be built and tested independently, with dependencies replaced by interfaces, fakes and fixtures | Brief sections 8–9 |
| **CR-4** | Is not blocked by an unanswered question, or has a working assumption recorded | [Reconciliation record](02-reconciliation-and-expansion-record.md#open-questions-carried-forward) |
| **CR-5** | Delivers clear business value against a recorded problem | [Revised baseline](03-revised-analysis-baseline.md) (PR1–PR10) |

<br>

## Candidate Use Cases

| Use Case | Requirement | MoSCoW | Problem addressed (business value) | Rules | Changes state? | Blocked by | Meets criteria? |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **UC01 Submit Placement Request** | FR01 | Must | PR2 – requests arrive incomplete through several channels | BR01 | Yes | — (Q1 covered by A5) | Yes – CR-1 to CR-5 |
| **UC02 View Request Status** | FR02 | Must | PR2, PR7 – students don't know what their request is waiting on | — | No (read-only) | — | No – fails CR-1 (RC09) |
| **UC03 View Placement Record** | FR03 | Must | PR1 – records spread across separate files | — | No (read-only) | — | No – fails CR-1 (RC09) |
| **UC04 Apply Priority Rules** | FR04 | Deferred | PR3 – priorities applied inconsistently | BR02 | Yes | Q2 | No – fails CR-4, deferred (RC03) |
| **UC05 Verify Third-Party Permission** | FR05 | Must | PR4 – unclear authority before sharing information | BR03, NFR02 | Yes | Q3 → DR-004 | Partly – CR-4 needs DR-004 |
| **UC06 Record Selection Decision** | FR06 | Must | PR10 – employer and academic decisions kept separately | BR05, BR07 | Yes | — | Yes |
| **UC07 Record Academic Approval** | FR07 | Must | PR10 – employer and academic decisions kept separately | BR05, BR06, BR07 | Yes | Q5, Q9 (partly) | Partly – CR-4 |
| **UC08 Release Stalled Provisional Placement** | FR08 | Must | PR5 – stalled provisional placements block capacity | BR08, BR06 | Yes | Q4 → DR-005 | Partly – CR-4 needs DR-005 |
| **UC09 View Provisional Opportunities** | FR09 | Could | PR6 – provisional places counted as confirmed capacity | — | No (read-only) | — | No – fails CR-1 (RC09) |
| **UC10 Set Action Status** | FR10 | Must | PR7 – status terms used inconsistently, ownership unclear | BR07 | Yes | — | Yes |
| **UC11 Evaluate Change Dependencies** | FR11 | Should | PR8 – knock-on effects of changes not visible | — | No (read-only) | — | No – fails CR-1 (RC09) |
| **UC12 Record Off-Site Progress Updates** | FR12 | Must | PR9 – off-site updates lost or re-entered | NFR03, CS2 | Yes | — | Yes |

<br>

## Selected Use Case

| Priority | Use Case | Why selected |
| :--- | :--- | :--- |
| 1 | UC01 Submit Placement Request | Meets all five criteria. It is the entry point for every placement (no request, no placement), addresses PR2, and is the best-prepared use case from the CA1: a detailed use case with an alternative path (4a) and two exceptions (4b, 5a), five Gherkin scenarios (SC01–SC05) including a boundary outline, and an existing SSD. Its only open question (Q1) is covered by working assumption A5. |

<br>

## Member Contributions and CA3 Slices

The brief requires one independently owned, vertical CA3 slice per member. This table records how the group divides UC01 so that each member's slice can be built, tested and demonstrated on its own.

| Member | Design contribution in CA2 | CA3 slice |
| :--- | :--- | :--- |
| Daniel Courtney | | |
| Eoin Mannix | | |
| Isabelle Lynch | | |
| Bartlomiej Jedrzejowski | | |

<br>

## Dependencies and Independence

| Dependency | Needed for | Independent fallback |
| :--- | :--- | :--- |
| Programme evidence requirements (external academic records, A3) | BR01 check in UC01 | `ProgrammeEvidencePort` interface with a fake adapter returning a fixed evidence list per programme (PA05) |
| Student and opportunity data | Recording a request against S1 and OP7 | In-memory repositories seeded with fixtures (matching the Gherkin Background) |
| Request storage | Saving the request and its status | Repository interface with an in-memory implementation |

<br>

## Implementation Order

The order in which the UC01 design is produced, so each artefact builds on the one before it.

    1. Detailed use case and Gherkin for UC01 (already in place, revised for CA2).
   
    2. System sequence diagram and operation contracts for each UC01 system operation.
   
    3. CRC / responsibility model and design class diagram.
   
    4. Object-interaction sequence diagrams for the main success scenario and the 4a, 4b and 5a paths.
   
    5. Architecture and integration contract, then the CA3 slice specifications.

<br>

## Use Cases Not Selected

| Use Case | Reason |
| :--- | :--- |
| UC02, UC03, UC09, UC11 | Read-only, so they fail CR-1 (RC09) |
| UC04 | Deferred until the priority rules are agreed (Q2, RC03) |
| UC05, UC08 | Depend on working assumptions not yet agreed (DR-004, DR-005) |
| UC07 | Partly affected by open questions Q5 and Q9 |
| UC06, UC10, UC12 | Meet the criteria, but were not selected because the group chose to design one use case in depth, and UC01 is the entry point for every placement |

<br>

## Comparability Check

*To be completed once member contributions are agreed:* how the work on UC01 is divided so that each member's CA3 slice is similar in size, with its own rules, state changes and failure handling.