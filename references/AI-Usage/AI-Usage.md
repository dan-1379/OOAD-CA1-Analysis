# AI Usage

## Business Problem Statement - Step 2: Separate Symptoms, Problems, and Consequences

**PROMPT**
<br>
[Attached SAAD71000_CA1_Scenario_28_Student_Work_Placement_Coordination_Service 
1.pdf] can you convert this to markdown, keeping the colors if possible

**RESPONSE**
Here’s the scenario as Markdown. The colours come straight from the PDF:

Navy (#17365D) for the title and the “How to use” and “Important” labels
Teal (#008A84) for the section headings and the scenario ID line
Light blue and light green backgrounds for the two callout boxes

Standard Markdown has no colour syntax, so I used inline HTML styles. These display in VS Code preview, Obsidian and Typora. GitHub strips them and shows plain formatted text instead, but nothing breaks.

<!-- Colours taken from the original PDF: Title / labels (navy) #17365D Section headings (teal) #008A84 Body text (slate) #243447 "How to use" box #EAF2F8 "Important" box #E8F5F3 Inline HTML styles render in VS Code, Obsidian, Typora etc. GitHub strips them and shows plain text. -->

<sub><span style="color:
#243447">SAAD71000 | CA1 Scenario 28</span></sub>

<span style="color:
#17365D">CA1 Scenario 28: Student Work-Placement Coordination Service</span>

<span style="color:
#008A84">Scenario CA1-28-SWPCS | Kerry College Placement Office</span>

<div style="background:#EAF2F8; padding:12px 16px; border-radius:4px; color:#243447"> <strong style="color:#17365D">How to use this scenario</strong> This document provides the case evidence for your assigned CA1 analysis. Complete the work and submission described in the main CA1 specification. Where evidence is incomplete or inconsistent, identify the uncertainty rather than inventing a confirmed policy. </div>
<span style="color:
#008A84">Organisation and current service</span>

Kerry College Placement Office coordinates work-placement opportunities for students across several programmes.

Opportunities, applications, employer decisions, agreements, supervisor allocation and progress reviews are recorded in separate files and email threads.

<span style="color:
#008A84">Requests, eligibility and preparation</span>

Students express preferences and provide evidence required by their programme. An opportunity may be advertised while dates, duties or approval remain provisional.

Requests arrive through several channels and may be incomplete. Staff need to distinguish an initial expression of interest, a request awaiting evidence and a request ready for a decision. Priorities and exceptions are not applied consistently.

Another person or organisation may assist with a request. Staff are uncertain what authority is required before detailed information or decisions can be shared.

<span style="color:
#008A84">Allocation and coordination</span>

Matching considers programme outcomes, student interests, employer requirements, location, capacity and potential conflicts. Employer selection and academic approval are separate decisions.

Capacity depends on a combination of people, places, resources and timing. A visible vacancy does not necessarily mean that every requirement is satisfied. Provisional allocations sometimes remain in place while essential information is still missing.

Changes can affect several linked arrangements. Staff need to preserve the current confirmed position while retaining evidence of earlier decisions and versions.

<span style="color:
#008A84">Progress, review and exceptions</span>

Staff record progress, decisions and outstanding actions using notes, messages and spreadsheets. Different teams use status terms differently, making it difficult to identify what is awaiting action and who is responsible.

A planned activity may be changed, partially completed, paused or withdrawn. Staff need to distinguish an operational change from a formal decision and avoid treating silence as approval.

Reviews may generate new actions, revised arrangements or escalation. Earlier evidence should not be overwritten when circumstances change.

<span style="color:
#008A84">Information, reporting and scope</span>

The coordinator needs information about unallocated requests, provisional arrangements, capacity conflicts, overdue actions and incomplete records. External partners should receive only the information required for their role.

Summary reporting is needed for management and funders without exposing unnecessary personal or commercially sensitive information. Connectivity may be unreliable during off-site work.

The initial scope covers service coordination and records. Specialist professional systems, financial accounting and unrelated public website functions are outside scope.

<span style="color:
#008A84">Stakeholder evidence</span>
Coordinator: “A vacancy is not a match unless all of the important requirements are satisfied.”
Service user: “I need to know whether I am waiting for information, a decision or an outside organisation.”
Administrator: “Provisional arrangements can block capacity long after the original request has stalled.”
Partner representative: “I need the information required for my role, not the complete case history.”
Reviewer: “New information should be added without erasing the basis of the earlier decision.”
Manager: “We need consistent reasons for delay, withdrawal and incomplete outcomes.”
<span style="color:
#008A84">Unresolved matters</span>

The scenario does not confirm every policy or decision. Clarification may be required about:

what information is required before a request is ready for decision;
how eligibility, priority and exceptions should be applied;
what authority is required when another person acts for the requester;
when provisional allocations should expire or become confirmed;
who may approve changes, substitutions or withdrawal;
how versions, reviews and outstanding actions should be related;
which information may be shared with staff, partners and funders.
<div style="background:#E8F5F3; padding:12px 16px; border-radius:4px; color:#243447"> <strong style="color:#17365D">Important</strong> Use scenario evidence, state temporary assumptions clearly, and identify questions or risks where stakeholder confirmation is required. </div>

<br>
<br>

## Business Problem Statement - Step 2: Separate Symptoms, Problems, and Consequences

**PROMPT**
Step 2: Separate Symptoms, Problems, and Consequences
for this step under the headings:

| Observation or Symptom | Underlying Problem | Likely Consequence
do i go through my annotations and pick out the current problems i have highlighted

**RESPONSE**
Close. Work from your Step 1 table rather than the annotations, because Step 1 has already pulled out the current-situation facts. Step 2 builds on it.

1. Pick out the symptoms. Go through Step 1 and keep only the rows where something visibly goes wrong. Leave out neutral process facts that just describe how things work. Those were background for Step 1, but they aren’t symptoms. You’ll likely end up with about 8–10 rows.

2. Group the symptoms by cause. For each symptom, ask “why does this happen?” Symptoms with the same answer go together. For example, if two symptoms both happen because there’s no single shared record, they’re one underlying problem. Aim for about 4–6 groups.

3. Name the underlying problem for each group. This is the “why”, in business terms with no technology.

4. Write the likely consequence. This is the “so what” for the organisation or the people affected. It’s where your inferences and held-back points finally go. Use the stakeholder quotes as support here.

<br>
<br>

# Finding the Objects, Step 3: Readability Key
**PROMPT** Is there a way to make a coloured key in Markdown — green for keep, orange for merge, orange yellow for convert, red for remove, and blue for requires clarification.

**RESPONSE**
> [!NOTE]
> For readability, the following key is used for decisions in the tables:
> - 🟢 Keep
> - 🟠 Merge
> - 🟡 Convert
> - 🔴 Remove
> - 🔵 Requires Clarification

<br>
<br>

# Finding the Objects, Final Step: Grouping Converted Words
**PROMPT** based on the reference table i am using, can you extract the attributes that i have said are attributes of each of the below and make the list accordingly

based on the reference table i am using, can you extract the attributes that i have said are attributes of each of the below and make the list accordingly

| Candidate | Decision | Final Term or Destination | Justification |
| :--- | :---: | :--- | :--- |
| Supervisor allocation | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of Placement | Assignment linking a supervisor to a placement, converted to an attribute of `Placement` as there is typically one supervisor per placement *(A9, Q8)* |
| Preferences | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Student` / `Request`. | Student choices and personal interests. Converted to an attribute used when matching. |
| Evidence | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Request` | Documentation supplied by students, converted to an attribute tracking requirements. |
| Advertised | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Opportunity` | Status value indicating opportunity visibility. |
| Dates | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Opportunity` / `Placement` | Timeline associated with opportunities of placements. |
| Duties | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Opportunity` | Descriptive attribute detailing opportunity responsibilities. |
| Provisional | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Opportunity` / `Placement` | Descriptive status value indicating terms or holds. |
| Incomplete | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Request` / `Placement` | Status value indicating missing details / evidence. |
| Initial Expression of Interest | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Request` | Status of a request before required evidence is supplied. |
| Request Awaiting Evidence | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Request` | Request status indicating required evidence is missing. |
| Request Ready for a Decision | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Request` | Requests status indicating required evidence is submitted *(BR01)*. |
| Detailed Information | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Student` / `Placement` | Information restricted by role *(CS3, NFR01)*. |
| Programme Outcomes | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Programme` | Academic learning goals used as matching criteria. |
| Student Interests | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Student` / `Request` | Student choices used during matching, converted to an attribute associated with student requests. |
| Employer Requirements | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Opportunity` | Criteria specified by employrs for open positions. |
| Location | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Opportunity` / `Placement` / `Student` | Physical location deatail, converted to an attribute. |
| Capacity | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of Opportunity | Calculated count of available places based on operational factors. |
| Places | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Opportunity` / `Placement` | Physical location, converted to an attribute associated with placement locations. |
| Resources | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Placement` | Operational facilities required to determine placement capacity. |
| Timing | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Opportunity` / `Placement` | Schedule attribute, merged into date attribute associated with opportunities and placements. |
| Satisfied | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Match` | State condition indicating all matching requirements are fulfilled *(BR04)*. |
| Essential Information | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Request` / `Placement` | Required details missing from an allocation. |
| Linked Arrangements | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Relationship between Placements | Association / relationship between placements rather than a class. |
| Progress | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Placement` | Descriptive tracking status and operational activity details. |
| Teams | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of Staff | Team a staff member belongs to. |
| Status Terms | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Request` / `Placement` / `Action` | Descriptive status values indicating current state. |
| Awaiting Action | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Request` / `Action` | State condition indicating an outstanding task requires attention. |
| Responsible | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Action` / `Placement` | Task ownership assignment. |
| Changed | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Action` / `Placement` | Status values describing state changes. |
| Partially Completed | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Action` / `Placement` | Status values describing state changes. |
| Paused | 🟡 $\color{goldenrod}{\textsf{Convert}}$ |Attribute of `Action` / `Placement` | Status values describing state changes. |
| Withdrawn | 🟡 $\color{goldenrod}{\textsf{Convert}}$ |Attribute of `Action` / `Placement` | Status values describing state changes. |
| Unallocated Requests | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Request` | Status stage representing an unassigned student request. |
| Incomplete Records | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Request` / `Placement` | Status value indicating missing details. |
| Role | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of Staff | Functional position defining access *(NFR01, CS3)*. |
| Personal or Commercially Sensitive Information | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Student` / `Placement` | Specific information restricted by role *(CS3, NFR01)*. |
| Important Requirements | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Match` | Critera for a match *(BR04)*. |
| Satisfied | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Match` | State condition indicating requirements are met *(BR04).* |
| Waiting | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Request` / `Placement` | Status stage representing progress or waiting condition. |
| Capacity | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of Opportunity | Duplicate, see Capacity *(P3S1)* |
| Stalled | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Request` / `Placement` | Status value indicating stopped progression. |
| New Information | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Review` / `Action` | Notes or details added during reviews. |
| Basis | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Decision` | Reasoning supporting an earlier decision. |
| Consistent Reasons | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Action` / `Placement` |  List of agreed reasons for tracking delays and widthdrawals. |
| Delay | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Action` / `Placement` | Reason category for tracking operational delays. |
| Withdrawal | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Action` / `Placement` | Reason category and status value. |
| Incomplete Outcomes | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Action` / `Placement` | Reason category for tracking incomplete records. |
| Information Required | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Request` | Details needed before a request moves to a decision state *(Q1, BR01)*. |
| Ready for Decision | 🟡 $\color{goldenrod}{\textsf{Convert}}$ | Attribute of `Request` | Request status stage indicating required details are complete *(Q1, BR01)*. |

```markdown
> [!NOTE]
> **Student:**
> 
> **Programme:**
> 
> **Opportunity:**
> 
> **Employer:**
> 
> **Agreement:**
> 
> **Request:**
> 
> **Staff:**
> 
> **Decision:**
> 
> **Conflict:**
> 
> **Operational Change:**
> 
> **Placement:**
> 
> **Action:**
> 
> **Review:**
> 
> **Match:**
```

**RESPONSE**

Here’s every Convert row from your reference table, sorted by the concept it belongs to. Repeats (Satisfied, Capacity) are listed once.

> [!NOTE]
> **Student:** Preferences, Student Interests, Location, Detailed Information, Personal or Commercially Sensitive Information
>
> **Programme:** Programme Outcomes
>
> **Opportunity:** Advertised, Dates, Timing, Duties, Provisional, Employer Requirements, Location, Places, Capacity
>
> **Employer:** *(none)*
>
> **Agreement:** *(none)*
>
> **Request:** Preferences, Student Interests, Evidence, Incomplete, Initial Expression of Interest, Request Awaiting Evidence, Request Ready for a Decision, Essential Information, Status Terms, Awaiting Action, Unallocated Requests, Incomplete Records, Waiting, Stalled, Information Required, Ready for Decision
>
> **Staff:** Teams, Role
>
> **Decision:** Basis
>
> **Conflict:** *(none)*
>
> **Operational Change:** *(none)*
>
> **Placement:** Supervisor Allocation, Dates, Timing, Provisional, Location, Places, Resources, Progress, Incomplete, Essential Information, Incomplete Records, Detailed Information, Personal or Commercially Sensitive Information, Status Terms, Responsible, Changed, Partially Completed, Paused, Withdrawn, Waiting, Stalled, Consistent Reasons, Delay, Withdrawal, Incomplete Outcomes
>
> **Action:** Status Terms, Awaiting Action, Responsible, Changed, Partially Completed, Paused, Withdrawn, New Information, Consistent Reasons, Delay, Withdrawal, Incomplete Outcomes
>
> **Review:** New Information
>
> **Match:** Important Requirements, Satisfied
>
> **Relationship between Placements:** Linked Arrangements *(association, Session 6)*


Three things this shows up, which are worth knowing before the domain model:

Four concepts have no attributes: Employer, Agreement, Conflict and Operational Change. That’s allowed, since the domain model adds attributes. But expect to add at least one or two from your evidence then, e.g. a Conflict’s reason or an Operational Change’s link to what it changed.

Many of these are status values, not separate attributes. Changed, Partially Completed, Paused, Withdrawn, Incomplete, Stalled, Waiting and the request stages are all values of one status attribute. In the domain model, Request, Placement and Action would each have a single status, not ten fields. Similarly, Delay, Withdrawal and Incomplete Outcomes are values of one reason.

Placement and Request share a lot: Incomplete, Essential Information, Incomplete Records, Waiting, Stalled. When you draw the model, decide which concept each one really belongs to. Placing it on both usually means the attribute hasn’t been pinned down yet.

<br>
<br>

# Finding the Objects, Final Step: Grouping Merged Words
**PROMPT**

Based on this reference table, can you please put together the candidates i combined into a singular word

```markdown
| Candidate | Decision | Final Term or Destination | Justification |
| :--- | :---: | :--- | :--- |
| Work-placement opportunities | 🟠 $\color{orange}{\textsf{Merge}}$ | Opportunity | Stakeholder wording for work-placement openings. Merged into `Opportunity` to maintain a single, agreed term. |
| Applications | 🟠 $\color{orange}{\textsf{Merge}}$ | Request | Alternative term for student submissions, merged into `Request` as *(FR01, FR02, US01, UC01)* use the term request. |
| Employer decisions | 🟠 $\color{orange}{\textsf{Merge}}$ | Decision | Selection outcome recorded by employers merged into `Decision`, distinguished by decision type *(BR05)* |
| Progress reviews | 🟠 $\color{orange}{\textsf{Merge}}$ | Review | Review activity, capturing new information without erasing history. Merged into `Review` |
| Employer Selection | 🟠 $\color{orange}{\textsf{Merge}}$ | Decision | Employer selection outcome, merged into the core `Decision` class, distinguished by decision type *(BR05, BR06)* |
| Academic Approval | 🟠 $\color{orange}{\textsf{Merge}}$ | Decision | College approval outcome, merged into core `Decision` class distinguished by decision type *(BR05, BR06)* |
| Visible Vacancy | 🟠 $\color{orange}{\textsf{Merge}}$ | Opportunity | Stakeholder term for open placement positions, merged into `Opportunity` to maintain a single agreed term. |
| Provisional Allocations | 🟠 $\color{orange}{\textsf{Merge}}$ | Placement | Capacity hold, merged into core `Placement` class *(BR08, Q4)*. |
| Current Confirmed Position | 🟠 $\color{orange}{\textsf{Merge}}$ | Placement | Active agreed placement, merged into core `Placement` class *(BR06)*. |
| Earlier Decisions and Versions | 🟠 $\color{orange}{\textsf{Merge}}$ | Decision | Historical decision records, merged into `Decision` version history handling *(BR06, NFR04)*. |
| Planned Activity | 🟠 $\color{orange}{\textsf{Merge}}$ | Action | Work component within a placement, merged into core `Action` class. |
| Formal Decision | 🟠 $\color{orange}{\textsf{Merge}}$ | Decision | Recorded outcome, merged into `Decision` *(BR07)*. |
| New Actions | 🟠 $\color{orange}{\textsf{Merge}}$ | Action | Tasks created as review outcomes, merged into `Action` class |
| Revised Arrangements | 🟠 $\color{orange}{\textsf{Merge}}$ | Operational Change | Updated placement conditions resulting from reviews. |
| Earlier Evidence | 🟠 $\color{orange}{\textsf{Merge}}$ | Decision | Evidence of earlier decisions and versions, merged into `Decison` version history alongside earlier decisions *(BR06, NFR04)*. |
| Coordinator | 🟠 $\color{orange}{\textsf{Merge}}$ | Staff | Staff role tracking unallocated requests and capacity (SH5), merged into `Staff`. |
| Provisional Arrangements | 🟠 $\color{orange}{\textsf{Merge}}$ | Placement | Capacity, merged into core `Placement` state. |
| Capacity Conflicts | 🟠 $\color{orange}{\textsf{Merge}}$ | Conflict | Overlapping placement demands. |
| Overdue Actions | 🟠 $\color{orange}{\textsf{Merge}}$ | Action | Overdue tasks. |
| Vacancy | 🟠 $\color{orange}{\textsf{Merge}}$ | Opportunity | Coordinator term for open placement positions, merged into `Opportunity` to maintain a single agreed term. |
| Service User | 🟠 $\color{orange}{\textsf{Merge}}$ | Student | Stakeholder term for requester, merged into `Student` *(A6)* |
| Administrator | 🟠 $\color{orange}{\textsf{Merge}}$ | Staff | Primary actor monitoring provisional allocations *(SH9)*|
| Original Request | 🟠 $\color{orange}{\textsf{Merge}}$ | Request | Administrator term for student submission. |
| Earlier Decision | 🟠 $\color{orange}{\textsf{Merge}}$ | Decision | Reviewers term referenced during reviews, merged into `Decision` for version history. |
| Versions | 🟠 $\color{orange}{\textsf{Merge}}$ | Decision | Historical revisions linked to placement records, merged into `Decision` version history *(FR03, BR06)* |
```

**RESPONSE**
Here’s every Merge row from that table, grouped by the term it merged into:

```markdown
> [!NOTE]
> **Opportunity:** Work-placement Opportunities, Visible Vacancy, Vacancy
>
> **Request:** Applications, Original Request
>
> **Student:** Service User
>
> **Decision:** Employer Decisions, Employer Selection, Academic Approval, Formal Decision, Earlier Decision, Earlier Decisions and Versions, Earlier Evidence, Versions
>
> **Placement:** Provisional Allocations, Provisional Arrangements, Current Confirmed Position
>
> **Action:** Planned Activity, New Actions, Overdue Actions
>
> **Review:** Progress Reviews
>
> **Operational Change:** Revised Arrangements
>
> **Conflict:** Capacity Conflicts
>
> **Staff:** Coordinator, Administrator
```

That’s 25 rows in total, merged into 10 concepts.

<br>
<br>

# Finding the Objects, Final Step: Removed Words Bullet Points
**PROMPT**
can you also take my combined table of removed words, and put them into bullet points. for the ones that are duplicates, can you have them only occur once and say (Duplicate) after them. please put them into bullet points 

| Candidate | Decision | Final Term or Destination | Justification |
| :--- | :---: | :--- | :--- |
| Kerry College Placement Office | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Names the overarching organisation and defines the business and system boundary. Not a domain object. |
| Coordinates | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Functional verb describing business process activities rather than a domain entity. |
| Recorded | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Functional verb indicating history preservation rules rather than a standalone concept. |
| Files | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Informal tracking mechanism used in manual processes. |
| Email threads | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Informal communication channel causing fragmented tracking. |
| Students | 🔴 $\color{red}{\textsf{Remove}}$ | Student | Duplicate entry, see `Student` *(P1S1)* |
| Express | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Functional verb describing student submission behaviour. |
| Provide | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Functional verb describing student submission actions. |
| Programme | 🔴 $\color{red}{\textsf{Remove}}$ | Programme | Duplicate entry, see `Programme` *(P1S1)* |
| Opportunity | 🔴 $\color{red}{\textsf{Remove}}$ | Opportunity | Duplicate entry, see `Opportunity` *(P1S1)* |
| Arrive | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Functional verb describing incoming request submissions. |
| Several Channels | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Current process detail, the service provides one intake route *(PR2)*. |
| Distinguish | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Verb describing the difference between an operational change and a formal decison *(BR07)*. |
| Applied | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Functional verb describing rule application. |
| Another Person or Organisation | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Offstage stakeholder assisting students, not directly interacting with the system boundary. |
| Assist | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Functional verb describing action. |
| Shared | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Action describing information disclosure by role *(CS3)*. |
| Matching | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Core business process evaluated by the system. Evaluation logic rather than a domain class. |
| Considers | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Functional verb describing matching evaluation. |
| Separate Decisions | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Statement describing independent decision outcomes *(BR05)* |
| Depends on | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Functional verb describing capacity depenency. |
| People | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | General category covering roles (Supervisor, Student, Staff), does not require another identity. |
| Remain | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Functional verb describing state duration. |
| Missing | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Functional verb describing missing information. |
| Affect | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Functional verb describing knock-on effect. |
| Staff | 🔴 $\color{red}{\textsf{Remove}}$ | Staff | Duplicate, see `Staff` *(P2S4)* |
| Preserve | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Verb indicating history preservation. |
| Retaining Evidence | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Operation, history kept in `Decision` *(BR06)* |
| Staff | 🔴 $\color{red}{\textsf{Remove}}$ | Staff | Duplicate, see `Staff` *(P2S4)* |
| Record | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Functional verb indicating history preservation. |
| Decisions | 🔴 $\color{red}{\textsf{Remove}}$ | Decision | Duplicate, see `Decisions` *(P2S7)* |
| Notes | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Informal recording method targeted for replacement *(PR1)* |
| Messages | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Informal communication method targeted for replacement *(PR1)* |
| Spreadsheets | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Informal tracking method targeted for replacement *(PR1)* |
| Distinguish | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Verb describing distinguishing the difference between operational changes and formal decisons *(BR07)*. |
| Operational Change | 🔴 $\color{red}{\textsf{Remove}}$ | Operational Change | Duplicate, see `Changes` *(P3S6)* |
| Silence | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Business rule, silence must not be treated as approval *(BR07)*. |
| Approval | 🔴 $\color{red}{\textsf{Remove}}$ | Approval | Duplicate, see *(P2S2)* |
| Generate | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Functional verb indicating creation of action items. |
| Escalation | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Review outcome event referring a matter for further action. |
| Overwritten | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Verb indicating deletion or overwriting. |
| Circumstances Change | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Operational event triggering updates. |
| Needs | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Functional verb expressing stakeholder requirements. |
| Information | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Broad domain concept, too general to be a class. |
| External Partners | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Offstage stakeholder *(SH6)* classified as out of scope in task 2. |
| Receive | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Functional verb describing information access. |
| Summary Reporting | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Generated from existing records. |
| Needed | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Functional verb describing stakeholder requirements. |
| Management | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Offstage stakeholder *(SH7)* does not interact directly with the system. |
| Funders | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Offstage stakeholder *(SH8)* does not interact directly with the system. |
| Exposing | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Functional verb describing disclosure. |
| Unnecessary | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Descriptive term describing redundant details. |
| Connectivity | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Condition handled as a quality requirement *(NFR03, CS2)* |
| Unreliable | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Describes connection state, part of system quality *(NFR03, CS2)* |
| Off-site work | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Enviornment context affecting record updates. |
| Initial Scope | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Defines initial release deliverables. |
| Service Coordination | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Names the scope boundary, not a domain concep. |
| Specialist Professional Systems | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Excluded external system. |
| Financial Accounting | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Excluded external system. |
| Unrelated Public Website Functions | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Excluded external system. |
| Outside Scope | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Excluded external system. |
| Coordinator | 🔴 $\color{red}{\textsf{Remove}}$ | Staff | Duplicate entry, see `Coordinator` *(P5S1)* |
| Need | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Duplicate, see Needs *(P5S1)* |
| Know | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Functional verb describing user awareness. |
| Information | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Duplicate, see `Information` *(P5S1)* |
| Decision | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Duplicate, see `Decisions` *(P2S7)* |
| Outside Organisation | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Offstage stakeholder, does not interact with the system boundary. |
| Provisional Arrangements | 🔴 $\color{red}{\textsf{Remove}}$ | Placement | Duplicate, see `Provisional Arrangements` *(P5S1)* |
| Block | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Verb indicating unreleased provisional allocations. |
| Partner Representative | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Offstage stakeholder *(SH6)*, does not interact directly within the system boundary. |
| Required | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Functional verb describing necessity. |
| Role | 🔴 $\color{red}{\textsf{Remove}}$ | Role | Duplicate, see `Role` *(P5S2)*. |
| Complete Case History | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Derived output generated from existing records. |
| Reviewer | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Offstage stakeholder, does not interact directly with the system boundary. |
| Added | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Functional verb describing addition of notes. |
| Erasing | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Verb indicating deletion or overwriting. |
| Manager | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Offstage stakeholder, does not interact directly with the system boundary. |
| Need | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Duplicate, see `Needs` *(P5S1)* |
| Policy or Decision | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Section heading, general concept covering rules and approvals. |
| Clarification Required | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Section heading highlighting open questions. |
| Priority | 🔴 $\color{red}{\textsf{Remove}}$ | Priority | Duplicate, see `Priorities` *(P2S5)*. |
| Exceptions | 🔴 $\color{red}{\textsf{Remove}}$ | Exception | Duplicate, see `Exceptions` *(P2S5)* |
| Applied | 🔴 $\color{red}{\textsf{Remove}}$ | Applied | Duplicate, see `Applied` *(P2S5)* |
| Authority Required | 🔴 $\color{red}{\textsf{Remove}}$ | Authority | Duplicate, see `Authority` *(P2S7)* |
| Acts for Requester | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Offstage relationship *(SH3)*, does not interact with the system boundary. |
| Provisional Allocations | 🔴 $\color{red}{\textsf{Remove}}$ | Placement | Duplicate, see `Provisional Allocations` *(P3S5)* |
| Expire | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | State transition event where a provisional allocation releases *(Q4, BR08)* |
| Become Confirmed | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | State transition event where a provisional allocation becomes confirmed *(Q4, BR08)* |
| Approve Changes | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Authorisation approving modifications *(Q5)* |
| Withdrawal | 🔴 $\color{red}{\textsf{Remove}}$ | Attribute of `Request` / `Placement` | Duplicate, see `Withdrawal` *(P6S6)*. |
| Reviews | 🔴 $\color{red}{\textsf{Remove}}$ | Review | Duplicate, see `Reviews` *(P4S5)* |
| Outstanding Actions | 🔴 $\color{red}{\textsf{Remove}}$ | Action | Duplicate, see `Outstanding Actions` *(P4S1)* |
| Related | 🔴 $\color{red}{\textsf{Remove}}$ | Out of Scope | Association linking versions, reviews, and actions *(Q6)* |
| Shared | 🔴 $\color{red}{\textsf{Remove}}$ | Shared | Duplicate, see `Shared` *(P2S7)* |
| Staff | 🔴 $\color{red}{\textsf{Remove}}$ | Staff | Duplicate, see `Staff` *(P2S4)* |
| Partners |🔴 $\color{red}{\textsf{Remove}}$ | Partners | Duplicate, see `External Partners` *(P5S2)* |
| Funders | 🔴 $\color{red}{\textsf{Remove}}$ | Funders | Duplicate, see `Funders` *(P5S3)* |

<br>

**RESPONSE**

Here’s every Remove row as a bullet, in the order they first appear. Two rules are applied:

(Duplicate): the row only says “Duplicate, see…”. The term is actually decided elsewhere, so it’s listed once with the tag.
Genuine removals that appear twice (Distinguish, Applied, Shared, Information, Funders) are listed once, with no tag, because their decision really is Remove.

```markdown
- Kerry College Placement Office
- Coordinates
- Recorded
- Files
- Email Threads
- Students (Duplicate)
- Express
- Provide
- Programme (Duplicate)
- Opportunity (Duplicate)
- Arrive
- Several Channels
- Distinguish
- Applied
- Another Person or Organisation
- Assist
- Shared
- Matching
- Considers
- Separate Decisions
- Depends on
- People
- Remain
- Missing
- Affect
- Staff (Duplicate)
- Preserve
- Retaining Evidence
- Record
- Decisions (Duplicate)
- Notes
- Messages
- Spreadsheets
- Operational Change (Duplicate)
- Silence
- Approval (Duplicate)
- Generate
- Escalation
- Overwritten
- Circumstances Change
- Needs
- Information
- External Partners
- Receive
- Summary Reporting
- Needed
- Management
- Funders
- Exposing
- Unnecessary
- Connectivity
- Unreliable
- Off-site Work
- Initial Scope
- Service Coordination
- Specialist Professional Systems
- Financial Accounting
- Unrelated Public Website Functions
- Outside Scope
- Coordinator (Duplicate)
- Need (Duplicate)
- Know
- Decision (Duplicate)
- Outside Organisation
- Provisional Arrangements (Duplicate)
- Block
- Partner Representative
- Required
- Role (Duplicate)
- Complete Case History
- Reviewer
- Added
- Erasing
- Manager
- Policy or Decision
- Clarification Required
- Priority (Duplicate)
- Exceptions (Duplicate)
- Authority Required (Duplicate)
- Acts for Requester
- Provisional Allocations (Duplicate)
- Expire
- Become Confirmed
- Approve Changes
- Withdrawal (Duplicate)
- Reviews (Duplicate)
- Outstanding Actions (Duplicate)
- Related
- Partners (Duplicate)
```

That’s 89 bullets from your 97 rows: 71 genuine removals and 18 duplicates.

The (Duplicate) items aren’t really “removed”, because they were kept, merged or converted at their first appearance. For the final list, you might prefer to leave them out of the Removed heading entirely, or give them their own small sub-heading (“Duplicate entries”). Then the Removed list only shows terms you actually rejected.


# Project Referencing Linking
Additionally, I want to be forthcoming in my usage of AI to assist me in associated statements I write with earlier evidence. This can be seen throught the entire project with the references beside statements or justifications e.g. *(FR01)*. These statements were written by me, with a lot of the referencing links being assisted with Claude.

The reason I did this was due to a considerably large body of earlier evidence I would have had to otherwise review to extract any references to confirm my statements. Due to time constraints and other projects, I decided this the best course of action as it allowed me to trace statements to evidence that would otherwise have taken considerably longer to locate.

For this project, I pasted the entirety of my files into Claude. I subsequently would write the tables and content, and would utilise AI to assist me in referencing content in these files.