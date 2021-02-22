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

  # Add private zones.
  # NOTE: They are always attached to the default vpc of the current region
  private_root_zones = [
    {
      name     = "private.loc",
      vpc_ids  = [],
      tags     = null,
    },
    {
      name     = "private.local",
      vpc_ids  = [{"id": "vpc-xxxxxxxxxx", "region": "eu-central-1"}],
      tags     = null,
    },
  ]

  comment = "Managed by Terraform"

  tags = {
    Environment = "example"
    Owner       = "terraform"
  }
}
