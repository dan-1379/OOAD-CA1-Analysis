# Definition of Done

This is the shared checklist every CA2 artefact and change must meet before it is treated as finished. A backlog item is only moved to **Done** on the board when every applicable item below is true. The checklist applies to all four members and to every file in the [design dossier](README.md#design-dossier).

<br>

## 1. Every Artefact

| # | Criterion |
| :--- | :--- |
| DoD-01 | The file has a header table naming its **owner**, its **reviewer** (a member who did not write it) and what it **feeds into**. |
| DoD-02 | The file has a **Purpose** section stating what it is for and which earlier artefacts it builds on. |
| DoD-03 | Identifiers follow the CA1 and are never renumbered (FR, NFR, BR, A, Q, US, UC, SC, RC, PA, EX, CL, DR). |
| DoD-04 | Every requirement, rule, use case step, contract or Gherkin scenario it uses is referenced by its ID, so it can be traced in both directions. |
| DoD-05 | Names of classes, methods, types, statuses and errors match the design class diagram (08) and the architecture and integration contract (10). |
| DoD-06 | Any open question it depends on is either resolved, covered by a recorded working assumption, or listed under **Notes and Assumptions**. |
| DoD-07 | No placeholders remain (`TBD`, `[Add …]`, `pending`, `To be agreed`, empty table cells). |
| DoD-08 | All relative links work and all images display when viewed on GitHub. |
| DoD-09 | Spelling and grammar have been checked and all tables display properly. |
| DoD-10 | Sources used are cited in the text and listed in [Text References](references/Text-References.md). |

<br>

## 2. Diagrams

| # | Criterion |
| :--- | :--- |
| DoD-11 | The PlantUML `.puml` source is committed in `diagrams/`, alongside its exported `.png`. |
| DoD-12 | The `.png` was exported from the current version of the `.puml` (re-exported after every change). |
| DoD-13 | The diagram is embedded in its artefact file, with a link to its source. |
| DoD-14 | Every element in the diagram matches the text of its artefact and the related artefacts (for example, every message in a sequence diagram is a method in the design class diagram). |

<br>

## 3. Design Consistency

| # | Criterion |
| :--- | :--- |
| DoD-15 | Every system event in the SSD (05) has one operation contract (06) and one object-interaction sequence diagram (09). |
| DoD-16 | Every contract postcondition is made true by a named object in the CRC model (07) and a message in 09. |
| DoD-17 | Every class with a CRC card (07) appears on the design class diagram (08). |
| DoD-18 | BR01 is applied in exactly one place and the UC01 minimal guarantee holds on every path. |
| DoD-19 | Each Gherkin scenario (SC01–SC05) can be traced to a path in the SSD and sequence diagrams. |

<br>

## 4. Decisions and AI Use

| # | Criterion |
| :--- | :--- |
| DoD-20 | Any change to the shared baseline (01–04) or shared design (07, 08, 10) has a decision record in the [decision log](decisions/decision-log.md), with a status and the members who agreed it. |
| DoD-21 | Any AI use in producing the artefact is recorded in the [AI log](references/AI-Log.md) by the member who used it, stating what was suggested and what was kept. |
| DoD-22 | AI output has been checked against the CA1 analysis and the other dossier files before being committed. |

<br>

## 5. Review and Merge

| # | Criterion |
| :--- | :--- |
| DoD-23 | The work was done on its own short-lived branch, linked to its issue. |
| DoD-24 | A pull request was opened using the PR template, with `Closes #<issue>`. |
| DoD-25 | The PR was reviewed and approved by one member who did not write it and any review comments were resolved. |
| DoD-26 | The PR was merged into `main`, and the matching card was moved to **Done** on the board. |

<br>

## Changes to This Definition

The Definition of Done can only be changed by group agreement, recorded in the decision log.
