output "vpc_private_subnet_cidr" {
  value = var.vpc_id != "" ? var.private_subnet_cidr_blocks : module.aws_vpc[0].private_subnets_cidr_blocks
}

output "vpc_public_subnet_cidr" {
  value = var.vpc_id != "" ? var.public_subnet_cidr_blocks : module.aws_vpc[0].public_subnets_cidr_blocks
}

output "vpc_cidr" {
  value = var.vpc_id != "" ? var.vpc_cidr : module.aws_vpc[0].vpc_cidr_block
}

output "eks_cluster_id" {
  value = module.eks_blueprints.eks_cluster_id
}

output "azs" {
  value = module.aws_vpc[0].azs
}

output "eks_cluster_certificate_authority_data" {
  value = module.eks_blueprints.eks_cluster_certificate_authority_data
}

output "eks_cluster_endpoint" {
  value = module.eks_blueprints.eks_cluster_endpoint
}

output "eks_cluster_name" {
  value = module.eks_blueprints.eks_cluster_id
}

output "cluster_identity_oidc_issuer" {
  value = module.eks_blueprints.eks_oidc_issuer_url
}

output "cluster_identity_oidc_issuer_arn" {
  value = module.eks_blueprints.eks_oidc_provider_arn
}

output "managed_node_group_iam_instance_profile_id" {
  value = module.eks_blueprints.managed_node_group_iam_instance_profile_id
}

output "worker_node_security_group_id" {
  value = module.eks_blueprints.worker_node_security_group_id
}

# Managed Node group name
output "eks_managed_nodegroups" {
  value = module.eks_blueprints.managed_node_groups
}

# Managed Node group id
output "eks_managed_nodegroup_ids" {
  value = module.eks_blueprints.managed_node_groups_id
}

# Managed Node group id
output "eks_managed_nodegroup_arns" {
  value = module.eks_blueprints.managed_node_group_arn
}

# Managed Node group role name
output "eks_managed_nodegroup_role_name" {
  value = module.eks_blueprints.managed_node_group_iam_role_names
}

# Managed Node group status
output "eks_managed_nodegroup_status" {
  value = module.eks_blueprints.managed_node_groups_status
}




output "configure_kubectl" {
  description = "Configure kubectl: make sure you're logged in with the correct AWS profile and run the following command to update your kubeconfig"
  value       = module.eks_blueprints.configure_kubectl
}

# Region used for Terratest
output "region" {
  value       = var.region
  description = "AWS region"
}
