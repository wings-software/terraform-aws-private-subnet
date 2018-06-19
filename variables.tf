variable "vpc_id" {
  description = "VPC ID as assigned by AWS"
  type        = "string"
}

variable "subnet_cidr" {
  default     = "10.0.2.0/24"
  description = "CIDR Mask of private ip address space for subnet"
  type        = "string"
}

variable "public_subnet_id" {
  description = "Public Subnet Id. Used for creating Nat Gateway"
  type        = "string"
}

variable "availability_zone" {
  type        = "string"
  description = "Availability zone where subnet will reside"
}

variable "private_subnet_egress_cidr_block" {
  default     = "0.0.0.0/0"
  description = "block of addresses that are whitelisted for outbound traffic"
  type        = "string"
}

variable "resource_tags" {
  description = "Optional map of tags to set on resources, defaults to empty map."
  type        = "map"
  default     = {}
}

variable "network_name" {
  description = "All ec2 instances that are spun up in this subnet should be associated through having a common purpose. This is a name that specifies that purpose"
  type        = "string"
}
