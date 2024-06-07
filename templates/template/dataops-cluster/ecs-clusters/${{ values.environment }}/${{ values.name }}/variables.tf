variable "region" {
  description = "value of the region to launch the instance."
  default     = "us-east-1"
}

variable "profile" {
  description = "value of the profile to launch the instance."
  default     = "default"
}

variable "instance_type" {
  description = "value of the instance type to launch the instance."
  default = "${{ values.instance }}"
}

variable "name_prefix" {
  description = "value of the name prefix to launch the instance."
  default = "${{ values.name }}-${{ values.environment }}"
}

variable "desired_count" {
  description = "value of the desired count to launch the instance."
  default     = 1
}

variable "vpc_id" {
  description = "value of the vpc id to launch the instance."
  type        = string
  default     = "vpc-a2d9e3c5"
}

variable "subnet_ids" {
  description = "value of the subnet ids to launch the instance."
  type        = list(string)
  default     = ["subnet-0663da4f", "subnet-827fb1af"]
}

variable "security_group_id" {
  description = "value of the security group id to launch the instance."
  type        = string
  default     = "sg-03735bd2181fcde36"
}

variable "availability_zones" {
  description = "value of the availability zones to launch the instance."
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]

}

variable "iam_instance_profile" {
  description = "value of the iam instance profile to launch the instance."
  default     = "ecsInstanceRole"
}

variable "key_name" {
  description = "value of the key name to launch the instance."
  default     = "stg-cluster"
}

variable "volume_size" {
  description = "value of the volume size to launch the instance."
  default     = 30
}