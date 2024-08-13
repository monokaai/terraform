resource "aws_subnet" "subnet" {
  vpc_id = aws_vpc.vpc.id
  count  = length(local.subnet)

  cidr_block        = values(local.subnet)[count.index].cidr_block
  availability_zone = values(local.subnet)[count.index].availability_zone
  tags              = values(local.subnet)[count.index].tags
}
