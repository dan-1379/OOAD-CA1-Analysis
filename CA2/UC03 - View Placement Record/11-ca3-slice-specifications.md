# 11 – CA3 Slice Specifications

| Field | Value |
|---|---|
| Artefact ID | CA2-11 |
| Owner | |
| Reviewer | |
| Version / status | v0.1 – Draft |
| Last updated | YYYY-MM-DD |
| Inputs from | [04 Catalogue](04-prioritised-implementation-catalogue.md), [09 Interactions](09-object-interaction-sequence-diagrams.md), [10 Contracts](10-architecture-and-integration-contract.md) |
| Brief reference | CA2 §7, §8, §9 |

> **Non-negotiable (CA2 §8):** No student's completion or grade may depend on another student finishing a component.
>
> **Quality check (CA2 §7):** Slices are vertical, comparable and independently operable.

## 1. Slice overview

| Slice ID | Owner | Use case(s) | Capability | Approved (date) |
|---|---|---|---|---|
| SL-01 | | | | |
| SL-02 | | | | |
| SL-03 | | | | |
| SL-04 | | | | |

---

## SL-01 – \<capability\>

**Owner:**

| Field | Content |
|---|---|
| Use case(s) | |
| Triggering event / input | |
| Responsibilities (application and domain logic) | |
| Observable output | |
| Business rules enforced | BR-xx |
| Interfaces provided | IF-xx |
| Interfaces consumed | IF-xx |
| Package / module boundary | |
| Entry point | |

### Dependencies and stand-ins

| Dependency | Contract | Fake / stub / in-memory replacement | Fixed clock / fixtures |
|---|---|---|---|
| | | | |

### Fixtures and seed data

### Test plan

| Test type | What it verifies | Linked BR / SC |
|---|---|---|
| Unit | | |
| Unit | | |
| Executable Gherkin | | SC-xx |

### Demonstration route

Runner / endpoint / UI path / automated acceptance scenario:

### Fallback plan

### Independence checklist (CA2 §9)

- [ ] Stable public interface for every cross-slice dependency
- [ ] Fake, stub or in-memory implementation for unavailable dependencies
- [ ] Independent fixtures and seed data
- [ ] Separate package / module boundary and documented entry point
- [ ] Standalone demonstration path
- [ ] No mandatory dependency on another private branch
- [ ] Built on the tagged shared baseline
- [ ] Integration attempted only after own tests pass

---

## SL-02 – \<capability\>

**Owner:**

| Field | Content |
|---|---|
| Use case(s) | |
| Triggering event / input | |
| Responsibilities (application and domain logic) | |
| Observable output | |
| Business rules enforced | BR-xx |
| Interfaces provided | IF-xx |
| Interfaces consumed | IF-xx |
| Package / module boundary | |
| Entry point | |

### Dependencies and stand-ins

| Dependency | Contract | Fake / stub / in-memory replacement | Fixed clock / fixtures |
|---|---|---|---|
| | | | |

### Fixtures and seed data

### Test plan

| Test type | What it verifies | Linked BR / SC |
|---|---|---|
| Unit | | |
| Executable Gherkin | | SC-xx |

### Demonstration route

### Fallback plan

### Independence checklist (CA2 §9)

- [ ] Stable public interface for every cross-slice dependency
- [ ] Fake, stub or in-memory implementation for unavailable dependencies
- [ ] Independent fixtures and seed data
- [ ] Separate package / module boundary and documented entry point
- [ ] Standalone demonstration path
- [ ] No mandatory dependency on another private branch
- [ ] Built on the tagged shared baseline
- [ ] Integration attempted only after own tests pass

---

*(Copy the SL block for each remaining member.)*

## 2. Comparability review

| Slice | Domain-logic complexity | Rules enforced | Interfaces | Test scope | Balanced? |
|---|---|---|---|---|---|
| SL-01 | | | | | |
| SL-02 | | | | | |
| SL-03 | | | | | |
| SL-04 | | | | | |
