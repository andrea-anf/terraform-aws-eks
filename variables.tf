variable "region" {
  type        = string
  default     = "eu-west-1"
} 

variable "tenant" {
  type        = string
  description = "Account Name or unique account unique id e.g., apps or management or aws007."
  default     = "mytestt"
}

variable "environment" {
  type        = string
  default     = "teste"
  description = "Environment area, e.g. prod or preprod."
}

variable "zone" {
  type        = string
  description = "zone, e.g. dev or qa or load or ops etc..."
  default     = "testz"
}


# VPC

variable "vpc_id" {
  type        = string
  description = "VPC ID - leave empty in order to create a new one on the fly."
  default     = ""
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR - required to create a new VPC"
  default     = "10.8.0.0/16"
}

variable "enable_nat_gateway" {
  type        = bool
  description = "Boolean to enable nat gateway."
  default     = true
}

variable "create_igw" {
  type        = bool
  description = "Boolean to enable internet gateway."
  default     = true
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Boolean to enable dns hostnames."
  default     = true
}

variable "single_nat_gateway" {
  type        = bool
  description = "Boolean to enable single nat gateway."
  default     = true
}



# SUBNETS (IDs are required only whene using an existing VPC. Cidr blocks here are useful only for outputs purpose)


variable "private_subnet_ids" {
  type        = list(string)
  description = "private subnets ids"
  default     = []
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "public subnets ids"
  default     = []
}

variable "private_subnet_cidr_blocks" {
  type        = list(string)
  description = "private subnets cidr blocks"
  default     = []
}

variable "public_subnet_cidr_blocks" {
  type        = list(string)
  description = "public subnets cidr blocks"
  default     = []
}


# EKS CLUSTER

variable "cluster_version" {
  type        = string
  description = "Cluster version"
  default     = "1.21"
} 

variable "managed_node_groups" {
  type        = any
  description = "managed node group configuration"
  default     = {
     t3_L= {
      node_group_name = "test-nodegroup"
      instance_types = ["t3.large"]
      min_size = "1"
      max_size = "4"
      desired_size = "1"
      max_unavailable = "1"
    }
  }
} 


