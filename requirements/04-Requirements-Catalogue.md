<!-- TOC --><a name="requirements-catalogue"></a>
# REQUIREMENTS CATALOGUE

<!-- TOC start (generated with https://github.com/derlin/bitdowntoc) -->

- [REQUIREMENTS CATALOGUE](#requirements-catalogue)
- [Prioritisation Rationale](#prioritisation-rationale)
- [Functional Requirements](#functional-requirements)
- [Non-Functional Requirements](#non-functional-requirements)

<!-- TOC end -->

<br>

<!-- TOC --><a name="functional-requirements"></a>
# Prioritisation Rationale

The requirements allocation reflects the operational needs of the Student Work Placement Coordination Service run by the Kerry College Placement Office. The high proportion of *Must* requirements (nine of twelve functional requirements and all four non-functional requirements) is driven directly by the core problems found during analysis. Without:

- A single shared record (PR1, driving FR03), 
- Controlled student intake (*PR2, driving FR01 and FR02)*, 
- Dual academic and employer decision tracking *(PR10, driving FR06 and FR07)*, 
- Strict permission checks to prevent improper disclosure *(PR4, driving FR05 and NFR01/NFR02)*, 
- Capacity release *(PR5, driving FR08)*, 
- Clear status and ownership *(PR7, driving FR10)*, 
- Reliable off-site progress updates *(PR9 and CS2, driving FR12 and NFR03)*, 
- Preserved decision history *(BR06, driving NFR04)*, 

the service cannot function properly.

*FR04* (priority rules) and *FR11* (dependency display) are classed as Should. *FR04* is classed as Should because the specific priority criteria have not yet been agreed *(Q2)*, meaning the requirement cannot be fully specified for this release. 

*FR11* is also classed as Should because what actually links placement arrangements together remains an unresolved question *(US11 Q1)*. *FR09* (viewing provisional placement opportunities) is classed as Could because staff can manage provisional numbers without a dedicated view. 

<br>
<br>

# Functional Requirements

| ID | Functional Requirement | MoSCoW | Source / Rationale | Problem | Verification |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **FR01** | The system shall allow a student to submit placement preferences and programme evidence. | Must | Student (SH1), IS2 | PR2 | Gherkin scenarios SC01–SC05 |
| **FR02** | The system shall allow a student to view the current status of their placement request. | Must | Student (SH1), IS2 | PR2, PR7 | Acceptance testing of US02 AC1–AC6 |
| **FR03** | The system shall maintain a single shared record for each placement. | Must | Placement Staff (SH2), IS1 | PR1 | Demonstration of single placement record across all status transitions |
| **FR04** | The system shall allow placement staff to apply agreed priority rules for student placement applications. | Should | Placement Staff (SH2), IS3 | PR3 | Acceptance testing of rule application once priority criteria are agreed (Q2) |
| **FR05** | The system shall allow placement staff to verify third-party authorisation permissions before disclosing placement information. | Must | Placement Staff (SH2), Third-Party Representative (SH3), IS4 | PR4 | Inspection of permissions records before disclosure |
| **FR06** | The system shall allow employers to record selection decisions for student applicants. | Must | Employer (SH4), IS5 | PR10 | Acceptance testing of employer selection decision recording |
| **FR07** | The system shall allow placement staff to record college academic approval decisions for placements. | Must | Placement Staff (SH2), IS5 | PR10 | Acceptance testing of college approval decision recording |
| **FR08** | The system shall allow the administrator to release stalled provisional allocations. | Must | Administrator (SH9), IS6 | PR5 | Acceptance testing of capacity release upon reaching threshold (Q4) |
| **FR09** | The system shall allow the placement coordinator to view provisional placement opportunities. | Could | Placement Coordinator (SH5), IS6 | PR6 | Demonstration that provisional opportunities are identified separately from confirmed ones |
| **FR10** | The system shall allow placement staff to set an activity status from the agreed set of standardised values. | Must | Placement Staff (SH2), IS8 | PR7 | Inspection of status selection against the agreed status vocabulary |
| **FR11** | The system shall display dependencies between connected placement arrangements. | Should | Employer (SH4), Placement Coordinator (SH5), IS7 | PR8 | Demonstration that linked arrangements are shown before a change is made |
| **FR12** | The system shall allow off-site staff to record progress updates when connectivity is unreliable. | Must | Placement Staff (SH2), IS9 | PR9 | Acceptance test: updates recorded off-site appear in the shared record once connectivity returns |

<br>
<br>

<!-- TOC --><a name="non-functional-requirements"></a>
# Non-Functional Requirements

| ID | Ref | Quality Category | MoSCoW | Measurable Requirement | Source / Rationale | Verification
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **NFR01** | P5S2, P5S3 | Privacy | Must | The system shall ensure that external partners and funders can access only placement data permitted by their role, with no restricted details visible. | Protects sensitive information. | Access test per role: 0 restricted fields visible to partner and funder roles |
| **NFR02** | P2S7 | Security | Must | The system shall prevent student data from being disclosed to a third party unless the required authorisation permissions are recorded, with every access attempt without the required permissions refused. | Prevents wrongful disclosure. | Test that every disclosure attempt without recorded permission is refused |
| **NFR03** | P5S4 | Reliability | Must | The system shall ensure that 100% of updates recorded by off-site staff without a reliable connection reach the shared record once the connection returns, with no lost updates. | Prevents lost or re-entered updates. | Test that all off-site updates reach the shared record after reconnection, with none lost |
| **NFR04** | P6S5 | Integrity | Must | The system shall preserve the history and basis of earlier decisions so that none can be overwritten when new information is added. | Preserves the record of earlier decisions. | Inspection that each revised decision retains the earlier decision and its basis. |