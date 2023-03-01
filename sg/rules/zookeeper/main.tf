module "sg" {
  source                  = "../../"
  region                  = var.region
  profile                 = var.profile
  shared_credentials_file = var.shared_credentials_file
  skip_region_validation  = var.skip_region_validation
  create                  = var.create
  vpc_id                  = var.vpc_id
  name                    = var.name
  description             = var.description
  existing_group_id       = var.existing_group_id
  tags                    = var.tags
  security_group_type     = var.security_group_type


  ##########
  # Ingress
  ##########
  # Rules by names - open for default CIDR
  ingress_rules = sort(compact(distinct(concat(var.auto_ingress_rules, var.ingress_rules, [""]))))

  # A priority is used when setting `ingress_rules`.
  priority_for_ingress_rules = var.priority_for_ingress_rules

  # Open to IPv4 cidr blocks with a cidr block list
  ingress_with_cidr_blocks = var.ingress_with_cidr_blocks

  # Open for security group id
  ingress_with_source_security_group_id = var.ingress_with_source_security_group_id

  # Open to IPv4 cidr blocks and ports with a cidr block port list
  ingress_with_cidr_blocks_and_ports = var.ingress_with_cidr_blocks_and_ports

  # The ingress port list
  ingress_ports = var.ingress_with_ports

  # The IPv4 CIDR ranges list to use on ingress cidrs rules.
  ingress_cidr_blocks = var.ingress_cidr_blocks

  # A default ingress priority.
  default_ingress_priority = var.default_ingress_priority

  #########
  # Egress
  #########
  # Rules by names - open for default CIDR
  egress_rules = sort(compact(distinct(concat(var.auto_egress_rules, var.egress_rules, [""]))))

  # A priority is used when setting `egress_rules`.
  priority_for_egress_rules = var.priority_for_egress_rules

  # Open to IPv4 cidr blocks with a cidr block list
  egress_with_cidr_blocks = var.egress_with_cidr_blocks

  # Open for security group id
  egress_with_source_security_group_id = var.egress_with_source_security_group_id

  # Open to IPv4 cidr blocks and ports with a cidr block port list
  egress_with_cidr_blocks_and_ports = var.egress_with_cidr_blocks_and_ports

  # The ingress port list
  egress_ports = var.egress_with_ports

  # The IPv4 CIDR ranges list to use on egress cidrs rules.
  egress_cidr_blocks = var.egress_cidr_blocks

  # A default egress priority.
  default_egress_priority = var.default_egress_priority
}
