<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.72 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.4.1 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.10 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.72 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws_vpc"></a> [aws\_vpc](#module\_aws\_vpc) | terraform-aws-modules/vpc/aws | ~> 3.0 |
| <a name="module_eks_blueprints"></a> [eks\_blueprints](#module\_eks\_blueprints) | git@github.com:aws-ia/terraform-aws-eks-blueprints.git | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | Cluster version | `string` | `"1.21"` | no |
| <a name="input_create_igw"></a> [create\_igw](#input\_create\_igw) | Boolean to enable internet gateway. | `bool` | `true` | no |
| <a name="input_desired_size"></a> [desired\_size](#input\_desired\_size) | desired number of running instances in the node group | `string` | `"2"` | no |
| <a name="input_enable_agones"></a> [enable\_agones](#input\_enable\_agones) | n/a | `bool` | `false` | no |
| <a name="input_enable_amazon_eks_aws_ebs_csi_driver"></a> [enable\_amazon\_eks\_aws\_ebs\_csi\_driver](#input\_enable\_amazon\_eks\_aws\_ebs\_csi\_driver) | n/a | `bool` | `false` | no |
| <a name="input_enable_amazon_eks_coredns"></a> [enable\_amazon\_eks\_coredns](#input\_enable\_amazon\_eks\_coredns) | n/a | `bool` | `false` | no |
| <a name="input_enable_amazon_eks_kube_proxy"></a> [enable\_amazon\_eks\_kube\_proxy](#input\_enable\_amazon\_eks\_kube\_proxy) | n/a | `bool` | `false` | no |
| <a name="input_enable_amazon_eks_vpc_cni"></a> [enable\_amazon\_eks\_vpc\_cni](#input\_enable\_amazon\_eks\_vpc\_cni) | n/a | `bool` | `false` | no |
| <a name="input_enable_argocd"></a> [enable\_argocd](#input\_enable\_argocd) | n/a | `bool` | `false` | no |
| <a name="input_enable_aws_for_fluentbit"></a> [enable\_aws\_for\_fluentbit](#input\_enable\_aws\_for\_fluentbit) | n/a | `bool` | `false` | no |
| <a name="input_enable_aws_load_balancer_controller"></a> [enable\_aws\_load\_balancer\_controller](#input\_enable\_aws\_load\_balancer\_controller) | n/a | `bool` | `false` | no |
| <a name="input_enable_aws_node_termination_handler"></a> [enable\_aws\_node\_termination\_handler](#input\_enable\_aws\_node\_termination\_handler) | n/a | `bool` | `false` | no |
| <a name="input_enable_cluster_autoscaler"></a> [enable\_cluster\_autoscaler](#input\_enable\_cluster\_autoscaler) | n/a | `bool` | `false` | no |
| <a name="input_enable_dns_hostnames"></a> [enable\_dns\_hostnames](#input\_enable\_dns\_hostnames) | Boolean to enable dns hostnames. | `bool` | `true` | no |
| <a name="input_enable_fargate_fluentbit"></a> [enable\_fargate\_fluentbit](#input\_enable\_fargate\_fluentbit) | n/a | `bool` | `false` | no |
| <a name="input_enable_ingress_nginx"></a> [enable\_ingress\_nginx](#input\_enable\_ingress\_nginx) | n/a | `bool` | `false` | no |
| <a name="input_enable_keda"></a> [enable\_keda](#input\_enable\_keda) | n/a | `bool` | `false` | no |
| <a name="input_enable_metrics_server"></a> [enable\_metrics\_server](#input\_enable\_metrics\_server) | n/a | `bool` | `false` | no |
| <a name="input_enable_nat_gateway"></a> [enable\_nat\_gateway](#input\_enable\_nat\_gateway) | Boolean to enable nat gateway. | `bool` | `true` | no |
| <a name="input_enable_prometheus"></a> [enable\_prometheus](#input\_enable\_prometheus) | n/a | `bool` | `false` | no |
| <a name="input_enable_spark_k8s_operator"></a> [enable\_spark\_k8s\_operator](#input\_enable\_spark\_k8s\_operator) | n/a | `bool` | `false` | no |
| <a name="input_enable_traefik"></a> [enable\_traefik](#input\_enable\_traefik) | n/a | `bool` | `false` | no |
| <a name="input_enable_vpa"></a> [enable\_vpa](#input\_enable\_vpa) | n/a | `bool` | `false` | no |
| <a name="input_enable_yunikorn"></a> [enable\_yunikorn](#input\_enable\_yunikorn) | n/a | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment area, e.g. prod or preprod. | `string` | `""` | no |
| <a name="input_instance_types"></a> [instance\_types](#input\_instance\_types) | List of instance type to use in eks node group. t3.large or more is recommended | `list(string)` | `[]` | no |
| <a name="input_managed_node_groups"></a> [managed\_node\_groups](#input\_managed\_node\_groups) | managed node group configuration | `any` | `{}` | no |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | maximum number of running instances in the node group | `string` | `"2"` | no |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | minimum number of running instances in the node group. Minimum of 2 is recommended | `string` | `"2"` | no |
| <a name="input_node_group_name"></a> [node\_group\_name](#input\_node\_group\_name) | eks managed node group name | `string` | `""` | no |
| <a name="input_private_subnet_cidr_blocks"></a> [private\_subnet\_cidr\_blocks](#input\_private\_subnet\_cidr\_blocks) | private subnets cidr blocks | `list(string)` | `[]` | no |
| <a name="input_private_subnet_ids"></a> [private\_subnet\_ids](#input\_private\_subnet\_ids) | private subnets ids | `list(string)` | `[]` | no |
| <a name="input_public_subnet_cidr_blocks"></a> [public\_subnet\_cidr\_blocks](#input\_public\_subnet\_cidr\_blocks) | public subnets cidr blocks | `list(string)` | `[]` | no |
| <a name="input_public_subnet_ids"></a> [public\_subnet\_ids](#input\_public\_subnet\_ids) | public subnets ids | `list(string)` | `[]` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `""` | no |
| <a name="input_single_nat_gateway"></a> [single\_nat\_gateway](#input\_single\_nat\_gateway) | Boolean to enable single nat gateway. | `bool` | `true` | no |
| <a name="input_tenant"></a> [tenant](#input\_tenant) | Account Name or unique account unique id e.g., apps or management or aws007. | `string` | `""` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | VPC CIDR - required to create a new VPC | `string` | `""` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID - leave empty in order to create a new one on the fly. | `string` | `""` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | zone, e.g. dev or qa or load or ops etc... | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azs"></a> [azs](#output\_azs) | n/a |
| <a name="output_cluster_identity_oidc_issuer"></a> [cluster\_identity\_oidc\_issuer](#output\_cluster\_identity\_oidc\_issuer) | n/a |
| <a name="output_cluster_identity_oidc_issuer_arn"></a> [cluster\_identity\_oidc\_issuer\_arn](#output\_cluster\_identity\_oidc\_issuer\_arn) | n/a |
| <a name="output_configure_kubectl"></a> [configure\_kubectl](#output\_configure\_kubectl) | Configure kubectl: make sure you're logged in with the correct AWS profile and run the following command to update your kubeconfig |
| <a name="output_eks_cluster_certificate_authority_data"></a> [eks\_cluster\_certificate\_authority\_data](#output\_eks\_cluster\_certificate\_authority\_data) | n/a |
| <a name="output_eks_cluster_endpoint"></a> [eks\_cluster\_endpoint](#output\_eks\_cluster\_endpoint) | n/a |
| <a name="output_eks_cluster_id"></a> [eks\_cluster\_id](#output\_eks\_cluster\_id) | n/a |
| <a name="output_eks_cluster_name"></a> [eks\_cluster\_name](#output\_eks\_cluster\_name) | n/a |
| <a name="output_eks_managed_nodegroup_arns"></a> [eks\_managed\_nodegroup\_arns](#output\_eks\_managed\_nodegroup\_arns) | Managed Node group id |
| <a name="output_eks_managed_nodegroup_ids"></a> [eks\_managed\_nodegroup\_ids](#output\_eks\_managed\_nodegroup\_ids) | Managed Node group id |
| <a name="output_eks_managed_nodegroup_role_name"></a> [eks\_managed\_nodegroup\_role\_name](#output\_eks\_managed\_nodegroup\_role\_name) | Managed Node group role name |
| <a name="output_eks_managed_nodegroup_status"></a> [eks\_managed\_nodegroup\_status](#output\_eks\_managed\_nodegroup\_status) | Managed Node group status |
| <a name="output_eks_managed_nodegroups"></a> [eks\_managed\_nodegroups](#output\_eks\_managed\_nodegroups) | Managed Node group name |
| <a name="output_managed_node_group_iam_instance_profile_id"></a> [managed\_node\_group\_iam\_instance\_profile\_id](#output\_managed\_node\_group\_iam\_instance\_profile\_id) | n/a |
| <a name="output_region"></a> [region](#output\_region) | AWS region |
| <a name="output_vpc_cidr"></a> [vpc\_cidr](#output\_vpc\_cidr) | n/a |
| <a name="output_vpc_private_subnet_cidr"></a> [vpc\_private\_subnet\_cidr](#output\_vpc\_private\_subnet\_cidr) | n/a |
| <a name="output_vpc_public_subnet_cidr"></a> [vpc\_public\_subnet\_cidr](#output\_vpc\_public\_subnet\_cidr) | n/a |
| <a name="output_worker_node_security_group_id"></a> [worker\_node\_security\_group\_id](#output\_worker\_node\_security\_group\_id) | n/a |
<!-- END_TF_DOCS -->