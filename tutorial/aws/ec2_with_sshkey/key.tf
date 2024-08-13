resource "aws_key_pair" "key" {
  key_name   = local.key.key_name
  public_key = local.key.public_key
}
