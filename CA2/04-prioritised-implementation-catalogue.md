# 04 - Prioritised Implementation Catalogue

Target use cases, priorities, business value, dependencies and
implementation rationale.

## Purpose

This catalogue ranks the Scenario 28 use cases and selects those taken forward into design and CA3. Each selected use case becomes one member's independently owned CA3 slice. The selection is recorded in [DR-003](decisions/decision-log.md).

<br>

## Selection Criteria

A use case is suitable as a CA3 slice if it:

| # | Criterion | Source |
| :--- | :--- | :--- |
| **SC-1** | Receives a system event or input, applies at least one business rule, changes state and produces an observable outcome (vertical) | Brief section 8 |
|**SC-2** | Can be built, tested and demonstrated without another member's slice, using interfaces, fakes and fixtures | Brief sections 8–9 |
| **SC-3** | Is similar in size and difficulty to the other selected slices (comparable) | Brief, CA3 slice specifications |
| **SC-4** | Is not blocked by an unanswered question, or has a working assumption recorded | Reconciliation record |
| **SC-5** | Delivers clear business value against a recorded problem | Revised baseline (PR1–PR10) |

<br>

## Candidate Use Cases

| Use Case | Requirement | MoSCoW | Problem addressed (business value) | Rules | Changes state? | Blocked by | Suitable as slice? |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |

<br>

## Selected Use Cases

| Priority | Use Case | Owner | Why selected | Slice size |
| :--- | :--- | :--- | :--- | :--- |

<br>

## Slice Summary

One row per selected use case: the shape of each member's CA3 slice. Full detail is in each slice specification (file 11).

| Use Case | Owner | Event or input | Rule(s) applied | State changed | Observable outcome |
| :--- | :--- | :--- | :--- | :--- | :--- |

<br>

## Dependencies and Independence

| Slice | Depends on | Provided by | Independent fallback |
| :--- | :--- | :--- | :--- |

<br>

## Implementation Order

The order in which the shared design and slices are worked on, and why (e.g. the use case whose output others consume first).

    1.

    2.

    3.

    4.

<br>

## Use Cases Not Selected

| Use Case | Reason |
| :--- | :--- |

<br>

## Comparability Check