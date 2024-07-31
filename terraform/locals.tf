locals {
  owners               = "hr"
  environment          = "dev"
  resource_name_prefix = "${local.owners}-${local.environment}"
  
  common_tags = {
    environment = local.environment
    owner       = local.owners
    # Add other common tags here
  }
}
