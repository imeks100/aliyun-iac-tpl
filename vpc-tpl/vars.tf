# VPC variables
variable "create" {
  description = "Whether to create vpc. If false, you can specify an existing vpc by setting 'vpc_id'."
  type        = bool
  default     = true
}

variable "vpc_id" {
  description = "The vpc id used to launch several vswitches. If set, the 'create' will be ignored."
  type        = string
  default     = ""
}

variable "vpc_name" {
  description = "The vpc name used to launch a new vpc."
  type        = string
  default     = "TF-VPC"
}

variable "vpc_description" {
  description = "The vpc description used to launch a new vpc."
  type        = string
  default     = "A new VPC created by Terrafrom module terraform-alicloud-vpc"
}

variable "vpc_cidr" {
  description = "The cidr block used to launch a new vpc."
  type        = string
  default     = "172.16.0.0/12"
}

variable "resource_group_id" {
  description = "The Id of resource group which the instance belongs."
  type        = string
  default     = ""
}

variable "vpc_name_regex" {
  description = "(Deprecated) It has been deprecated from 1.5.0."
  type        = string
  default     = ""
}

variable "vpc_tags" {
  description = "The tags used to launch a new vpc. Before 1.5.0, it used to retrieve existing VPC."
  type        = map(string)
  default     = {}
}

# VSwitch variables
variable "vswitch_cidrs" {
  description = "List of cidr blocks used to launch several new vswitches. If not set, there is no new vswitches will be created."
  type        = list(string)
  default     = []
}

variable "availability_zones" {
  description = "List available zones to launch several VSwitches."
  type        = list(string)
  default     = []
}

variable "vswitch_name" {
  description = "The vswitch name prefix used to launch several new vswitches."
  default     = "TF-VSwitch"
}

variable "use_num_suffix" {
  description = "Always append numerical suffix(like 001, 002 and so on) to vswitch name, even if the length of `vswitch_cidrs` is 1"
  type        = bool
  default     = false
}

variable "vswitch_description" {
  description = "The vswitch description used to launch several new vswitch."
  type        = string
  default     = "New VSwitch created by Terrafrom module terraform-alicloud-vpc."
}

variable "vswitch_tags" {
  description = "The tags used to launch serveral vswitches."
  type        = map(string)
  default     = {}
}

locals {
  # Whether to create other resources in which the vpc
  create_sub_resources = var.vpc_id != "" || var.create ? true : false
 }
 
