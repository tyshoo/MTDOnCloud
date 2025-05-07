resource "aws_securityhub_account" "this" {}

resource "aws_config_config_rule" "ecr_immutable" {
  name = "${var.environment}-ecr-immutable"
  source {
    owner             = "AWS"
    source_identifier = "ECR_IMAGE_TAG_MUTABILITY_CHECK"
  }
}

resource "aws_config_configuration_aggregator" "agg" {
  name = "${var.environment}-agg"
  account_aggregation_source {
    account_ids = [data.aws_caller_identity.current.account_id]
    all_regions = true
  }
}

data "aws_caller_identity" "current" {}
