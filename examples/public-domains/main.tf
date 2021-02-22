# -------------------------------------------------------------------------------------------------
# AWS Settings
# -------------------------------------------------------------------------------------------------
provider "aws" {
  region = "eu-central-1"
}

# -------------------------------------------------------------------------------------------------
# Modules Settings
# -------------------------------------------------------------------------------------------------
module "aws_route53zone" {
  source = "../.."

  delegation_sets = []

  public_root_zones = [
    {
      name           = "example.com",
      delegation_set = null,
      tags           = null,
    },
    {
      name           = "example.org",
      delegation_set = null,
      tags           = null,
    },
  ]

  comment = "Managed by Terraform"

  tags = {
    Environment = "example"
    Owner       = "terraform"
  }
}
