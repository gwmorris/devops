
provider "aws" {
  region  = local.region
  profile = "ttb"
}

locals {
  project       = "gary-demo"
  region        = "us-east-1"
  base_ami      = "ami-0323c3dd2da7fb37d"
  center        = "HSG"
  owner_contact = "gary.morris@salientcrgt.com"
  common_tags = {
    Center  = local.center
    Project = local.project
  }
}

module "network_1" {
  source       = "./modules/network"
  region       = local.region
  project      = "${local.project}"
  cidr_block   = "10.20.0.0/16"
  cidr_block_a = "10.20.1.0/24"
  cidr_block_b = "10.20.2.0/24"
  cidr_block_c = "10.20.3.0/24"
}

module "keypair" {
  source = "./modules/dynkeys"
  path   = "${path.root}/keys"
  name   = "fdatest"
}

output "key_file" {
  value = module.keypair.private_key_filepath
}

output "tools_vpc" {
  value = module.network_1.vpc
}

# output "master_password" {
#   value = var.pass
# }

output "project_name" {
  value = local.project
}
