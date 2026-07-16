terraform {
  backend "s3" {
    bucket         = "akansha-tf-state"
    key            = "network/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}