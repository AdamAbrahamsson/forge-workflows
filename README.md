# forge-workflows

Terraform-managed Azure infrastructure for the Forge project: an AKS cluster and a PostgreSQL database for n8n.

## What’s in this repo

- **`phase-3-aks/`** — Terraform module that provisions:
  - **Resource group** — `adam-azure-cluster` in North Europe
  - **AKS cluster** — `forge-cluster` (Kubernetes 1.32, single node pool, Cilium networking)
  - **PostgreSQL Flexible Server** — `psql-n8n-forge` with an `n8n` database for workflow automation

- **`mise.toml`** — Tool versions (Terraform) via [mise](https://mise.jdx.dev/).

## Prerequisites

- [Terraform](https://www.terraform.io/) (≥ 1.0). Using `mise`: run `mise install` in the repo root.
- An Azure subscription and credentials (e.g. `az login`).

## Using the Terraform

1. Go into the module:
   ```bash
   cd phase-3-aks
   ```
2. Create a `terraform.tfvars` file with your values (do not commit real secrets):
   ```hcl
   subscription_id      = "your-azure-subscription-id"
   administrator_login  = "your-db-username"
   db_password          = "your-db-password"
   ```
3. Init and apply:
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

After apply, Terraform outputs `db_host`, `db_name`, and `db_user` for connecting to the n8n database.

## Variables

| Variable             | Description                |
|----------------------|----------------------------|
| `subscription_id`    | Azure subscription ID      |
| `db_password`        | PostgreSQL admin password  |
| `administrator_login`| PostgreSQL admin username  |

Keep secrets in `terraform.tfvars` (or env/CLI) and ensure `*.tfvars` stays in `.gitignore`.
