# HUG Lagos/Ibadan Terraform Challenge — Week Two

## Project 2 – Build Reusable Infrastructure with Modules

**Objective:** Refactor Week One infrastructure into reusable Terraform modules.

### Learning outcomes
- Terraform Modules
- Project Structure
- Reusability
- Variables
- Outputs

### Requirements — create modules for
- VPC
- Networking (subnets, route tables, internet gateway)
- Security Groups
- Compute (Instance)
- Other resources applicable

### Deliverables
- Modular Terraform code
- Configure remote backend; Terraform state stored in remote backend
- Terraform code (GitHub link)
- README with deployment instructions
- Screenshot of the webpage
- Screenshot of cloud console showing compute instance running
- LinkedIn post (thought process; tag HUG Lagos and HUG Ibadan)

### Source to refactor (Week One)
Week One stack to modularize:
- Custom VPC
- Public subnet
- Internet Gateway
- Route table (+ public internet route + association)
- Security group: SSH (22) + HTTP (80)
- EC2 in public subnet
- user_data: install Nginx; HTML with full name + `HUG Lagos/Ibadan Terraform Challenge`

### Notes / constraints (from our Week One process)
- Teach/implement from official HashiCorp + AWS provider docs
- Keep modules focused; root module wires them together
- Remote backend required (typically S3; optional DynamoDB lock — follow current HashiCorp AWS backend docs)
- Do not invent Week One features we didn’t build (no ALB/RDS unless added)
- Screenshots + LinkedIn are deliverables after apply works

### Week One reference path
`/Users/oluwabamiseomolaso/coding_projects/hug-terraform-challenge`

---

## Plan mode prompt (paste when ready)

```text
Plan HUG Lagos/Ibadan Terraform Challenge Week Two.

Context:
- Week One repo at /Users/oluwabamiseomolaso/coding_projects/hug-terraform-challenge has working flat Terraform (VPC, public subnet, IGW, route table + association, SG 22/80, EC2 + Nginx user_data, outputs).
- Week Two brief is in HUG-Week-Two-Brief.md (Project 2: refactor into reusable modules + remote backend).

Goals for the plan (do not implement yet — plan only):
1. Propose a clean module layout matching the brief:
   - modules for VPC, Networking (subnets/RT/IGW), Security Groups, Compute
   - root module that calls them with variables/outputs
2. Map each Week One resource to a module (what moves where; what inputs/outputs each module needs).
3. Plan remote state backend (S3 or current HashiCorp-recommended AWS approach): bootstrap order, what is created manually vs Terraform, state migration from local if needed.
4. Plan GitHub repo, README sections, and screenshot/LinkedIn deliverable checklist.
5. Call out risks (state migration, breaking user_data, module interfaces) and a step-by-step build order so I implement incrementally.
6. Teach-oriented: prefer official Terraform module + AWS backend docs patterns; no unnecessary extras beyond the brief.

Constraints:
- Refactor Week One behavior (same web server outcome), don’t redesign into a new architecture.
- Teach/don’t write full code unless I explicitly ask; explain line by line when reviewing.
- Output: a clear phased plan I can approve before any coding.
```
