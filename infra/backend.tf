# 8 May 25 bucket, key, dynamodb_table to be edited
terraform {
  backend "s3" {
    bucket          = "*placeholder-for-state-bucket*"
    key             = "*mtdOnCloudPOC/terraform.tfstate*"
    region          = "ap-southeast-1"
    dynamodb_table  = "*terraform-locks*"
    encrypt         = "true"

  }
}
