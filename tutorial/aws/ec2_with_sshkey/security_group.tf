resource "aws_security_group" "sg" {
  name        = local.security_group.name
  description = local.security_group.description
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = local.security_group.ingress.description
    from_port   = local.security_group.ingress.from_port
    to_port     = local.security_group.ingress.to_port
    protocol    = local.security_group.ingress.protocol
    cidr_blocks = local.security_group.ingress.cidr_blocks
  }

  egress {
    from_port   = local.security_group.egress.from_port
    to_port     = local.security_group.egress.to_port
    protocol    = local.security_group.egress.protocol
    cidr_blocks = local.security_group.egress.cidr_blocks
  }

  tags = local.security_group.tags
}
