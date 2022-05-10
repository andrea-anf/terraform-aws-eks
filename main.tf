

data "aws_availability_zones" "available" {}

locals {    

  vpc_name     = join("-", [var.tenant, var.environment, var.zone, "vpc"])
  azs          = slice(data.aws_availability_zones.available.names, 0, 3)
  cluster_name = join("-", [var.tenant, var.environment, var.zone, "eks"])
}

module "aws_vpc" {
  count = var.vpc_id == "" ? 1 : 0
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.0"

  cidr = var.vpc_cidr
  name = local.vpc_name
  azs  = local.azs

  public_subnets  = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 8, k)]
  private_subnets = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 8, k + 10)]

  enable_nat_gateway   = var.enable_nat_gateway
  create_igw           = var.create_igw
  enable_dns_hostnames = var.enable_dns_hostnames
  single_nat_gateway   = var.single_nat_gateway

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }
}


module "eks_blueprints" {
  source = "git@github.com:aws-ia/terraform-aws-eks-blueprints.git"

  tenant      = var.tenant
  environment = var.environment
  zone        = var.zone

  # EKS Cluster VPC and Subnet mandatory config
  vpc_id             = var.vpc_id == "" ? module.aws_vpc[0].vpc_id : var.vpc_id
  private_subnet_ids = var.vpc_id == "" ? module.aws_vpc[0].private_subnets : var.private_subnet_ids

  # EKS CONTROL PLANE VARIABLES
  cluster_version = var.cluster_version

  # EKS MANAGED NODE GROUPS
  managed_node_groups = {
    mg_4 = {
      node_group_name = var.node_group_name
      instance_types  = var.instance_types
      min_size        = var.min_size
      subnet_ids      = var.vpc_id != "" ? var.private_subnet_ids : module.aws_vpc[0].private_subnets
    }
  }
}
