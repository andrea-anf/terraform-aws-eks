

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
  source = "git::https://github.com/andrea-anf/terraform-aws-eks.git"

  tenant      = var.tenant
  environment = var.environment
  zone        = var.zone
  enable_irsa = true
  # EKS Cluster VPC and Subnet mandatory config
  vpc_id             = var.vpc_id == "" ? module.aws_vpc[0].vpc_id : var.vpc_id
  private_subnet_ids = var.vpc_id == "" ? module.aws_vpc[0].private_subnets : var.private_subnet_ids

  # EKS CONTROL PLANE VARIABLES
  cluster_version = var.cluster_version
  # Allow Ingress rule for Worker node groups from Cluster Sec group for Karpenter
  node_security_group_additional_rules = {
    ingress_nodes_karpenter_port = {
      description                   = "Cluster API to Nodegroup for Karpenter"
      protocol                      = "tcp"
      from_port                     = 8443
      to_port                       = 8443
      type                          = "ingress"
      source_cluster_security_group = true
    }
  }

  managed_node_groups = var.managed_node_groups

}
