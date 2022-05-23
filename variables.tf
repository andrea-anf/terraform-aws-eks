variable "region" {
  type        = string
  default     = ""
} 

variable "tenant" {
  type        = string
  description = "Account Name or unique account unique id e.g., apps or management or aws007."
  default     = ""
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment area, e.g. prod or preprod."
}

variable "zone" {
  type        = string
  description = "zone, e.g. dev or qa or load or ops etc..."
  default     = ""
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
  default     = ""
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
  default     = {}
} 

variable "node_group_name" {
  type        = string
  description = "eks managed node group name"
  default     = ""
} 

variable "instance_types" {
  type        = list(string)
  description = "List of instance type to use in eks node group. t3.large or more is recommended"
  default     = []
} 

variable "min_size" {
  type        = string
  description = "minimum number of running instances in the node group. Minimum of 2 is recommended"
  default     = "2"
} 

variable "max_size" {
  type        = string
  description = "maximum number of running instances in the node group"
  default     = "2"
} 

variable "desired_size" {
  type        = string
  description = "desired number of running instances in the node group"
  default     = "2"
} 
