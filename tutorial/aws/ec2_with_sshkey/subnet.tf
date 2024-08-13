resource "aws_subnet" "subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = local.subnet.cidr_block
  availability_zone = local.subnet.availability_zone

  tags = local.subnet.tags
}
