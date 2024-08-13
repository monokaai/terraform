resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = local.route_table.route.cidr_block
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = local.route_table.tags
}
