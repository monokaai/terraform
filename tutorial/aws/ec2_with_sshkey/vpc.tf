resource "aws_vpc" "vpc" {
  cidr_block           = local.vpc.cidr_block
  enable_dns_hostnames = local.vpc.enable_dns_hostnames

  tags = local.vpc.tags
}
