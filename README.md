# MTDOnCloud

## Overview
This repository contains a zero-cost, serverless Mobile Threat Defense (MTD)-Lite ingestion pipeline PoC built with Terraform for AWS. It demonstrates an end-to-end multi-tenant ingestion workflow using always-free-tier AWS services.

Key features:
- **Scalable Ingestion**: API Gateway → Lambda (ingest) → SQS decoupling → Lambda (processor)
- **Event Store & Notification**: DynamoDB for storage, SNS for fan-out
- **Serverless**: No VPC or NAT required; all components run in the default AWS network
- **Multi-Tenant Ready**: Scoped tables/topics per environment/workspace
- **Observability**: CloudWatch Logs, Metrics, and optional X-Ray tracing

## Architecture Diagram
![MTDOnCloud Architecture](docs/architecture.png)

*(C4 Container view: Mobile SDK → API GW → Ingest Lambda → SQS → Processor Lambda → DynamoDB & SNS)*

## Prerequisites
- **Terraform v1.5+**
- **AWS CLI** configured with an IAM user having AdministratorAccess
- **Python 3.9+** (for Lambda packaging)
- **Make** or equivalent shell to zip Lambdas

## Repository Layout
- **modules/api**: API Gateway & ingest Lambda module
- **modules/queue**: SQS queue & processor Lambda module
- **modules/store**: DynamoDB table & SNS topic module
- **modules/iam**: Centralized IAM roles and policies
- **docs/**: Architecture artifacts (diagrams, whitepapers)

## How to Deploy
1. **Clone the repo**
   ```bash
   git clone https://github.com/tyshoo/MTDOnCloud.git
   cd MTDOnCloud

## 2. Deploy (Free-Tier mode)
By default this PoC **does not** create any custom VPC or NAT‐GW, so you incur **zero networking charges**.

1. `terraform init`
2. `terraform apply -var-file=dev.tfvars`

Note: To demo in-VPC behavior subsequently, set `use_vpc = true` in your tfvars. **Please be aware that subnets + NAT (or VPC endpoints) WILL INCUR AWS costs**.
