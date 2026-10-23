<!-- TOC --><a name="stakeholders-and-requirements"></a>
# STAKEHOLDERS AND REQUIREMENTS
FOR THE FULL WORKINGS OF THIS SECTION, PLEASE SEE [`01_Stakeholders_And_Requirements/`](../decisions/Worked-Business-Problem/01_Stakeholders_And_Requirements.md)

<!-- TOC start (generated with https://github.com/derlin/bitdowntoc) -->

- [STAKEHOLDERS AND REQUIREMENTS](#stakeholders-and-requirements)
- [Organisation](#organisation)
- [Present Processes](#present-processes)
- [Problems \& Consequences](#problems--consequences)
- [Business Problem Statement](#business-problem-statement)
- [Desired Outcomes](#desired-outcomes)
- [Known Evidence and Uncertainty](#known-evidence-and-uncertainty)

<!-- TOC end -->

<br>

<!-- TOC --><a name="organisation"></a>
# Organisation

The Kerry College Placement Office coordinates student work placements across academic programmes, managing the overall placement including opportunities, applications, decisions, agreements, supervisor allocations, and progress reviews *(P1S1, P1S2)*. Currently, placement records and operational communications are fragmented across separate files, email threads, informal notes, messages, and spreadsheets *(P1S2, P4S1)*. Requests also arrive through multiple channels and may be incomplete when received by staff *(P2S3)*.

<br>
<br>

<!-- TOC --><a name="present-processes"></a>
# Present Processes

| Ref | Evidence from the scenario | What the evidence tells you
| :-- | :------------------------- | :-------------------------- |
| **P1S2** | Opportunities, applications, decisions, agreements, supervisor allocation and progress reviews are recorded in separate files and email threads. | Placement information is spread across several records and channels, with no single place showing a placement's full position.|
| **P2S1** | Students express preferences and provide evidence required by their programme. | Requests begin with the student, who supplies both their placement preferences and supporting evidence. Assuming each programme sets its own evidence requirements, what a complete request looks like may differ between students *(A5)*.
| **P2S2** | An opportunity may be advertised while dates, duties or approval remain provisional | Advertised opportunities are not always final, meaning dates, duties or approval may still change after students have expressed interest or applied. |
| **P2S3** | Requests arrive through several channels and may be incomplete. | Requests come in through multiple channels rather than a single route, and they are not always complete when staff receive them.
| **P2S5** | Priorities and exceptions are not applied consistently. | Decisions are not made consistently, meaning students in similar situations may have their applications treated differently, possibly because there are no clear guidelines.
| **P2S6** | Another person or organisation may assist with a request. | Requests are not always handled by the student alone. Staff may sometimes be dealing with third parties acting on behalf of the student.
| **P2S7** | Staff are uncertain what authority is required before detailed information or decisions can be shared. | Staff have no clear basis for deciding who can receive detailed information or decisions, particularly when a third party is involved. This may mean each case is handled differently, possibly due to the absence of specified guidelines.
| **P3S1** | Matching considers programme outcomes, student interests, employer requirements, location, capacity and potential conflicts. | A single match has to satisfy academic, student, employer, and practical conditions at the same time so matching is more complex than pairing a student with an open vacancy.|
| **P3S2** | Employer selection and academic approval are separate decisions. | A placement depends on the agreement from two separate parties: the employer selects the student, and the college approves the placement.|
| **P3S3** | Capacity depends on a combination of people, places, resources, and timing. | Capacity is not only a count of available places, but several conditions which must be in place for a placement to proceed.|
| **P3S4** | A visible vacancy does not necessarily mean that every requirement is satisfied. | An open place does not confirm that a placement can proceed, as other requirements may still be unmet.|
|**P3S5** | Provisional allocations sometimes remain in place while essential information is still missing. | Some allocations are held without being confirmed or released, and these can decrease the amount of places that may be needed by other students.|
| **P3S6** | Changes can affect several linked arrangements. |Placement arrangements are connected, so a change to one may have a knock on effect on others.|
| **P4S1** | Staff record progress, decisions and outstanding actions using notes, messages, and spreadsheets. | Progress is tracked in informal, separate records, rather than a singular shared record.|
| **P4S2** |  Different teams use status terms differently, making it difficult to identify what is awaiting action and who is responsible. | Teams do not share a common meaning for each status, so next steps and ownership are often unclear.|
| **P4S3** | A planned activity may be changed, partially completed, paused, or withdrawn. | Activities do not always proceed as planned, so an activity may be in several states other than completed or not started.
| **P4S5** | Reviews may generate new actions, revised arrangements, and escalation. | A review is not always the end. It may lead to further work, changed arrangements, or escalation.
| **P5S4** | Connectivity may be unreliable during off-site work. | Some work takes place off-site, where staff may not always have a reliable connection.|
| **P6S3** | Administrator: Provisional arrangements can block capacity long after the original request has stalled. | Some allocations are held without being confirmed or released, and these can decrease the amount of places that may be needed by other students. |

<br>
<br>

<!-- TOC --><a name="problems-consequences"></a>
# Problems & Consequences

| PR ID | Ref | Observation or Symptom | Underlying Problem | Likely Consequence |
| :-- | :-- | :-- | :-- | :-- |
| **PR1** | P1S2, P4S1 | Placement information and progress are recorded in separate files, email threads, notes, and spreadsheets. | No single shared record of a placement. | Duplicated or conflicting information, time consuming searching across records.| 
|**PR2** | P2S3 (P2S1) | Requests arrive through several channels and may be incomplete. | No single intake route. | Requests may be delayed or lost, and students may miss opportunities.|
| **PR3** | P2S5 | Priorities and exceptions are applied inconsistently | There are no agreed, documented rules for prioritising and granting exceptions. | Students in similar situations are treated differently, leading to potential complaints, appeals, and reputational risk. |
| **PR4** | P2S7 (P2S6) | Staff are unsure what authority is needed before sharing information or decisions. | There are no defined authorisation rules, especially for third parties acting on behalf of the student. | Information may be disclosed without proper authority, or a legitimate party may be refused, causing a delay. |
| **PR5** | P3S5, P6S3 | Provisional allocations stay in place while essential information is missing, long after the request stalls. | Provisional allocations have no time limit, review or release rule. | Capacity may be blocked, meaning other students may miss places and the available supply may be overstated. |
| **PR6** | P2S2, P3S4 | Opportunities are advertised, while still provisional and a visible vacancy does not mean all requirements are met. | The system does not distinguish advertised, confirmed and proceeding opportunities, or track the outstanding requirements. | Students may apply or are matched to placements that change or cannot go ahead, so the effort is wasted and rematching is needed. |
| **PR7** | P4S2 (P4S3) | Teams use status terms differently, so it's unclear what's awaiting action and who owns it. | There are no shared status definitions or assigned ownership, and no states for paused, partial, or withdrawn work. | Actions may be missed, delays may go unnoticed, and accountability may be unclear.|
| **PR8** | P3S6 | Changes to one arrangement affect other linked arrangements. | Dependencies between arrangements are not recorded. | Knock-on effects may be missed, causing clashes or broken arrangements. |
| **PR9** | P5S4 | Connectivity is unreliable off-site. | Staff cannot record or access information offline. | Updates may be delayed or lost, and data may need to be re-entered later. |
| **PR10** | P3S2, P1S2 | Employer selection and academic approval are separate decisions, recorded in separate files and email threads. | There is no single place showing both decisions together, or whether a placement is able to proceed. | A placement may proceed with only one decision, or be delayed while staff check whether both decisions have been made. |

<br>
<br>

<!-- TOC --><a name="business-problem-statement"></a>
# Business Problem Statement

Kerry College Placement Office currently manages student placement opportunities, applications, decisions, agreements, supervisor allocations, and progress reviews across separate files, email threads, notes, messages, and spreadsheets **(P1S2, P4S1)**. Due to placement information being spread across several records with no single shared record showing a placement's full position **(P1S2, P4S1)**, records may become duplicated or conflicting, and staff may waste time searching across records. 

Placement requests arrive through multiple channels rather than a single route and are not always complete when received **(P2S3)**. This may cause processing delays or result in requests being lost. This means that students could miss out on opportunities. Furthermore, decisions on priorities and exceptions are not made consistently **(P2S5)**, which means students in similar situations may have their applications treated differently. When third parties assist with a request **(P2S6)**, staff have no clear basis for deciding who can receive detailed information or decisions **(P2S7)**. This creates risks of improper data sharing or delaying legitimate helpers.

Matching and capacity management are affected by provisional information. Advertised opportunities are not always final **(P2S2)**, so a visible vacancy does not confirm that a placement can proceed **(P3S4)**. Additionally, provisional allocations are sometimes held without being confirmed or released **(P3S5)**. As the administrator notes, these provisional arrangements can block capacity long after an original request has stalled **(P6S3)**, which can reduce the number of places available to other students **(P3S5)**. As placement arrangements are connected, a change to one may have a domino effect on others **(P3S6)** and could potentially disrupt other planned placements.

Teams also do not share a common meaning for each status, making next steps and ownership unclear **(P4S2)**. This may lead to outstanding actions being missed or delayed. Off-site staff may also lack a reliable connection **(P5S4)**, which can delay record updates and require details to be re-entered later.

These issues increase operational difficulties, placing an extra burden on staff, causing unnecessary delays in processing, creating uncertainty around capacity, and risking an inconsistent experience for students seeking placements.

<br>
<br>

<!-- TOC --><a name="desired-outcomes"></a>
# Desired Outcomes

Based on stakeholder requirements, the desired outcomes for the placement focus on operational clarity, equality, and record integrity:

- **Outcome-Based Matching:** Placement vacancies are recognised as valid matches only when all academic, employer, student, and practical requirements are satisfied (P6S1).
- **Transparent Status Tracking:** Service users can clearly determine the current status of their request and know precisely what information or action is pending (P6S2).
- **Capacity Release:** Incomplete or stalled provisional arrangements are reviewed or released after defined thresholds (Q4) to prevent capacity from being blocked indefinitely (P6S3).
- **Role-Appropriate Information Sharing:** External partners receive only the placement information necessary for their specific role (P6S4).
- **Auditability and Decision Traceability:** New review information and progress notes can be added continuously without overwriting or erasing the historical basis of earlier decisions (P6S5).
- **Consistent Status and Outcome Reporting:** Delays, withdrawals, and incomplete outcomes are recorded using agreed, consistent categories across all teams (P6S6).

<br>
<br>

<!-- TOC --><a name="known-evidence-and-uncertainty"></a>
# Known Evidence and Uncertainty

The scenario confirms the existence of fragmented tracking, multi-channel intake, and inconsistent status usage across teams (P1S2, P2S3, P4S2, P4S1). However, several operations remain unconfirmed and are managed under working assumptions or open issues:

**Programme Evidence Requirements (Q1, A5):** The exact evidence items required before a request is deemed ready for decision are assumed to vary by programme (A5) and require stakeholder confirmation.

**Priority and Exception Rules (Q2):** Explicit criteria for ranking priority applications or granting exception waivers are not yet formally documented.

**Third-Party Authorisation (Q3, A8):** The verification required before sharing placement details with third parties acting on behalf of a student remain to be defined by the data-protection role (A8, SH11).

**Operational Rules and Parameters:** Further open questions regarding capacity release thresholds, supervisor definitions, and matching mechanics are tracked under Q4 through Q10.