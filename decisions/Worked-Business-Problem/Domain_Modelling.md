# DOMAIN MODELLING

<br>
<br>

# Reference Table

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

<br>
<br>

# Task 1: Select Essential Attributes

| Concept | Candidate Attributes | Keep / Remove | Reason |
| :--- | :--- | :--- | :--- |
| **Student** | Preferences |  |  |
|  | Student Interests |
|  | Location |
|  | Detailed Information |
|  | Personal or Commercially Sensitive Information |
| **Programme** | Programme Outcomes |  |  |
| **Opportunity** | Advertised |  |  |
|  | Dates |
|  | Timing |
|  | Duties |
|  | Provisional |
|  | Employer Requirements |
|  | Location |
|  | Places |
|  | Capacity |
| **Employer** | *(none)* |  |  |
| **Agreement** | *(none)* |  |  |
| **Request** | Preferences |  |  |
|  | Student Interests |
|  | Evidence |
|  | Incomplete |
|  | Initial Expression of Interest |
|  | Request Awaiting Evidence |
|  | Request Ready for a Decision |
|  | Essential Information |
|  | Status Terms |
|  | Awaiting Action |
|  | Unallocated Requests |
|  | Incomplete Records |
|  | Waiting |
|  | Stalled |
|  | Information Required |
|  | Ready for Decision |
| **Staff** | Teams |  |  |
|  | Role |
| **Decision** | Basis |  |  |
| **Conflict** | *(none)* |  |  |
| **Operational Change** | *(none)* |  |  |
| **Placement** | Supervisor Allocation |  |  |
|  | Dates |
|  | Timing |
|  | Provisional |
|  | Location |
|  | Places |
|  | Resources |
|  | Progress |
|  | Incomplete |
|  | Essential Information |
|  | Incomplete Records |
|  | Detailed Information |
|  | Personal or Commercially Sensitive Information |
|  | Status Terms |
|  | Responsible |
|  | Changed |
|  | Partially Completed |
|  | Paused |
|  | Withdrawn |
|  | Waiting |
|  | Stalled |
|  | Consistent Reasons |
|  | Delay |
|  | Withdrawal |
|  | Incomplete Outcomes |
| **Action** | Status Terms |  |  |
|  | Awaiting Action |
|  | Responsible |
|  | Changed |
|  | Partially Completed |
|  | Paused |
|  | Withdrawn |
|  | New Information |
|  | Consistent Reasons |
|  | Delay |
|  | Withdrawal |
|  | Incomplete Outcomes |
| **Review** | New Information |  |  |
| **Match** | Important Requirements |  |  |
|  | Satisfied |

<br>
<br>

# Task 2: Identify and Name Associations

| Class A | Association Name or Sentence | Class B | Evidence | Keep? | 
| :--- | :--- | :--- | :--- | :--- |


<br>
<br>

# Task 3: Assign and Justify Multiplicities

| Association | Multiplicity at Class A | Multiplicity at Class B | Reading from Both Ends | Evidence / Rule | 
| :--- | :--- | :--- | :--- | :--- |

<br>
<br>

# Task 4: Validate Transactions and Historical Records

| Information to Retain | Best Owning Concept | Why |
| :--- | :--- | :--- |


<br>
<br>

# Task 5: Draw the First Complete Domain Model

## PlantUML Starting Template
```plantuml
@startuml 
left to right direction 
hide methods 
skinparam classAttributeIconSize 0 
 
class Student { 
  studentNumber 
} 
 
class StudentOrganisation { 
  organisationName 
} 
 
class Activity { 
  activityCode 
  title 
  capacity 
  status 
} 
 
class ActivitySession { 
  sessionDate 
  startTime 
} 
 
class Registration { 
  requestDate 
  status 
} 
 
class WaitingListEntry { 
  requestDate 
  status 
} 
 
class AttendanceRecord { 
  attendanceStatus 
} 
 
class Room { 
  roomNumber 
} 
 
StudentOrganisation "1" -- "0..*" Activity : organises 
Activity "1" -- "1..*" ActivitySession : comprises 
Student "1" -- "0..*" Registration : submits 
Activity "1" -- "0..*" Registration : receives 
Student "1" -- "0..*" WaitingListEntry : joins 
Activity "1" -- "0..*" WaitingListEntry : has 
Registration "1" -- "0..*" AttendanceRecord : has 
ActivitySession "1" -- "0..*" AttendanceRecord : records 
Room "1" -- "0..*" ActivitySession : hosts 
@enduml 
```