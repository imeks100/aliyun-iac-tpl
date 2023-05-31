output "vpc_id" {
  description = "The VPC id"
  value       = alicloud_vpc.vpc.*.id
}

output "vpc_name" {
  description = "The VPC name"
  value       = alicloud_vpc.vpc.*.vpc_name
}

output "vpc_cidr_block" {
  description = "The VPC cidr block"
  value       = alicloud_vpc.vpc.*.cidr_block
}

output "vpc_tags" {
  description = "The VPC tags"
  value       = concat(alicloud_vpc.vpc.*.tags, [{}])[0]
}

output "vswitch_ids" {
  description = "List of vswitch ids"
  value       = alicloud_vswitch.vswitches.*.id
}

output "vswitch_names" {
  description = "List of vswitch names"
  value       = alicloud_vswitch.vswitches.*.name
}

output "vswitch_cidr_blocks" {
  description = "The vswitch cidr block"
  value       = alicloud_vswitch.vswitches.*.cidr_block
}

output "vswitch_tags" {
  description = "List of vswitch tags."
  value       = alicloud_vswitch.vswitches.*.tags
}
