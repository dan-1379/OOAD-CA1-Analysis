# 10 – Architecture and Integration Contract

| Field | Value |
|---|---|
| Artefact ID | CA2-10 |
| Owner | |
| Reviewer | |
| Version / status | v0.1 – Draft |
| Last updated | YYYY-MM-DD |
| Inputs from | [08 Design classes](08-design-class-diagram.md), [12 Technology](12-technology-decision-record.md) |
| Feeds into | [11 Slice specifications](11-ca3-slice-specifications.md) |
| Brief reference | CA2 §6, §7, §9 |

> **Quality check (CA2 §7):** Another student can consume a contract without internal knowledge.

## 1. Architecture overview

- Architectural style (e.g. layered, ports and adapters):
- Summary:

Source: `diagrams/architecture.puml`

![Architecture](diagrams/architecture.png)

## 2. Packages / modules

| Package / module | Responsibility | Owner | May depend on | Must not depend on |
|---|---|---|---|---|
| | | | | |

## 3. Shared types

| Type | Kind (value object / enum / identifier) | Fields | Validation | Owner |
|---|---|---|---|---|
| | | | | |

## 4. Public interfaces (ports)

### IF-01 – \<InterfaceName\>

| Field | Content |
|---|---|
| Purpose | |
| Provider (slice) | |
| Consumers | |
| Fake / in-memory implementation | |

| Operation | Input | Output / result type | Errors | Related CO |
|---|---|---|---|---|
| | | | | |

### IF-02 – \<InterfaceName\>

| Field | Content |
|---|---|
| Purpose | |
| Provider (slice) | |
| Consumers | |
| Fake / in-memory implementation | |

| Operation | Input | Output / result type | Errors | Related CO |
|---|---|---|---|---|
| | | | | |

## 5. Input / output DTOs and result types

| Type | Fields | Used by |
|---|---|---|
| | | |

## 6. Error conventions

- Result types vs exceptions:
- How validation failures are reported:

| Error code | Meaning | Raised when | Related BR |
|---|---|---|---|
| | | | |

## 7. Persistence boundary

- Repository interfaces:
- In-memory implementations for CA3:
- Out of scope:

## 8. Build and code conventions

- Naming:
- Folder / namespace structure:
- Test naming:
- Branching and pull-request rules:

## 9. Baseline and change control

- CA2 baseline tag: `ca2-baseline`
- Post-baseline change process: issue → pull request → review by consumers → decision record

| Version | Date | Change | Approved by | DR |
|---|---|---|---|---|
| 1.0 | | Initial baseline | | |
