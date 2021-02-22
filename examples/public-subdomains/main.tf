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
      delegation_set = "root-zones",
      tags           = null,
    },
    {
      name           = "example.org",
      delegation_set = null,
      tags           = null,
    },
  ]

  # If delegation set is null, it will use AWS defaults.
  # Specify your own nameserver or use an empty list to use AWS defaults.
  public_delegated_secondary_zones = [
    {
      name           = "internal.example.org",
      parent         = "example.org",
      ns_ttl         = 30,
      ns_list        = [],
      delegation_set = null,
      tags           = null,
    },
    {
      name           = "private.example.org",
      parent         = "example.org",
      ns_ttl         = 30,
      ns_list        = ["1.1.1.1", "2.2.2.2", "3.3.3.3", "4.4.4.4"],
      delegation_set = null,
      tags           = null,
    },
  ]
}
