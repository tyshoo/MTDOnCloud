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
*-to be appended-*

![MTDOnCloud Architecture](architecture.png)

*(C4 Container view: Mobile SDK → API GW → Ingest Lambda → SQS → Processor Lambda → DynamoDB & SNS)*


## Prerequisites
- AWS CLI or IAM role with ECR, ECS, VPC, Config, SecurityHub, CloudWatch & Billing access  
- Terraform ≥ 1.4  
- GitHub secrets: `AWS_ACCOUNT_ID`, `AWS_ROLE_ARN`

## Deploy
```bash
git clone https://github.com/tyshoo/MTDOnCloud
cd infra
terraform init
terraform apply -auto-approve
```
# Get the ALB endpoint & dashboard:
```bash
terraform output alb_endpoint
terraform output cost_dashboard
```
Health: curl http://<alb_endpoint>/health
Security Hub: AWS Console → Security Hub
Logs/Traces: AWS Console → CloudWatch Logs & X‑Ray
Cost: AWS Console → CloudWatch Dashboards → <dashboard_name>

## Clean Up
```bash
cd infra
terraform destroy -auto-approve
```
