resource "aws_instance" "instance" {
  ami                         = local.instance.ami
  instance_type               = local.instance.instance_type
  subnet_id                   = aws_subnet.subnet.id
  associate_public_ip_address = local.instance.associate_public_ip_address
  key_name                    = aws_key_pair.key.key_name

  vpc_security_group_ids = [
    aws_security_group.sg.id,
  ]

  tags = local.instance.tags
}
