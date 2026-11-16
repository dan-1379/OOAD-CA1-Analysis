# Decision Log

This log records every significant group decision for CA2: what was decided, why, who agreed it, and where the decision is applied. A decision that changes the shared baseline is recorded here before or with the pull request that makes the change.

> [!NOTE]
> **Status values:**
> - **Proposed:** raised but not yet agreed
> - **Accepted:** agreed by the group (and approved, where approval is needed)
> - **Superseded:** replaced by a later decision (see the linked record)
> - **Rejected:** considered and not adopted

<br>

| ID | Decision | Date | Status | Summary of rationale | Agreed by | Link |
| --- | --- | --- | --- | --- | --- | --- |
| DR-001 | Select Scenario 28 – Student Work-Placement Coordination Service for CA2 | November 9th, 2026 | Accepted | Scenarios 05 and 28 were effectively tied in the suitability matrix. The group chose 28 for its stronger testability and more even slice sizes. | Dan, Eoin, Isabelle, Bart | [Suitability matrix](../01-scenario-suitability-matrix.md#recommendation) |
| DR-002 | Lecturer approval of Scenario 28 and expansion brief | November 9th, 2026 | Accepted | Scenario 28 approved as presented. No expansion items were issued, so the CA1 analysis is reconciled without lecturer-added rules, actors or use cases. | Andrew Shields | [Suitability matrix](../01-scenario-suitability-matrix.md#final-approval) |
| DR-003 | Design one use case (UC01 Submit Placement Request) in depth in CA2 | [date agreed] | Accepted | Lecturer advised one use case in greater detail rather than a larger, less detailed design. UC01 meets all five catalogue criteria and is the entry point for every placement. How UC01 is divided into one CA3 slice per member is being confirmed with the lecturer (see DR-007). | Dan, Eoin, Isabelle, Bart | [Implementation catalogue](../04-prioritised-implementation-catalogue.md#selected-use-case) |
| DR-004 | Working assumption for Q3: the authority required when another person acts for a student | November 15th, 2026 | Proposed | Needed only if UC05 is taken forward, so that BR03 has a testable rule. Not needed for UC01. Recorded as A10 once agreed. | | [Reconciliation record](../02-reconciliation-and-expansion-record.md#group-expansions) (EX01) |
| DR-005 | Working assumption for Q4: when a provisional placement counts as stalled | November 15th, 2026 | Proposed | Needed only if UC08 is taken forward, so that BR08 has a testable threshold. Not needed for UC01. Recorded as A11 once agreed. | | [Reconciliation record](../02-reconciliation-and-expansion-record.md#group-expansions) (EX02) |
| DR-006 | Adopt the reconciliation record (02) and revised analysis baseline (03) as the CA2 baseline | November 15th, 2026 | Proposed | The Scenario 28 CA1 was reviewed item by item (RC01–RC17), practices from the other three CA1s were adopted where they strengthened it (PA01–PA06), and the group added five expansion items (EX01–EX05). Every change is listed in the 03 change log (CL01–CL33). | | [Revised baseline](../03-revised-analysis-baseline.md) |