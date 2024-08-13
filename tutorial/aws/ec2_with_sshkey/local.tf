locals {
  owner             = "tutorial"
  availability_zone = "ap-northeast-1a"

  vpc = {
    cidr_block           = "192.168.0.0/16"
    enable_dns_hostnames = true
    tags = {
      Name = "${local.owner}-vpc"
    }
  }

  internet_gateway = {
    tags = {
      Name = "${local.owner}-igw"
    }
  }

  subnet = {
    cidr_block        = "192.168.1.0/24"
    availability_zone = local.availability_zone
    tags = {
      Name = "${local.owner}-public-subnet"
    }
  }

  route_table = {
    route = {
      cidr_block = "0.0.0.0/0"
    }

    tags = {
      Name = "${local.owner}-route-table"
    }
  }

  security_group = {
    name        = "${local.owner}-security-group"
    description = "Allow SSH inbound traffic"

    ingress = {
      description = "SSH from"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = [
        "${var.host_ip}/32",
      ]
    }

    egress = {
      from_port = 0
      to_port   = 0
      protocol  = "-1"
      cidr_blocks = [
        "0.0.0.0/0",
      ]
    }

    tags = {
      Name = "${local.owner}-security-group"
    }
  }

  key = {
    key_name   = "${local.owner}-key"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDRV2lxoPcHoJLeoXbtl1WdX9+FeLYH6kqftdt+CDF9v7CJJdvMR7vbli6woHJg5BooIvJUhhWAV9K/7F2VmDBvlZmPJL+aFqsliNKM7Zn/oWUKQP41QAs6DtzVeUxIcZbG5RsPE3NdCwHEvW9D1HihAuCEB0mD+S91zHSngFXP1/XjSHwFMPFTCawY9v8FHM7s92fDDAuYPh9ltxxukVveJE1wJems9NSp+ZMHbEkKuw52QuBZ7Z57ROEaVJ8tdXr26jOOvAMQVEy2JskQTevqa09Q4meEsOgt7m3LMrbBf/B6fDnqwWGCjkx0QfCYsKyO/3R9FQ3eIB/kwkNaW9g9KMo0r5kw5//KopSML7j/VHvJ1sYQrLU5H+70J1nCsA1RC/aoMqC9HKofQxA7f+cWK6aqkGOvX/U0XFnSHG4I/1P/S9qV4SsuB7dpaoD3bloUXEmzvHUT3Ktg5AiM7FzA/ockNLM5R3SFbPyymm8XQgw6vdBy3aQBWjye21IqtiT7y2nhwJe0wg4YTGXZ2gQldIz7bRHZMQK+xaKHgCuDXnby+MiTQpWxIAywCU9mu/Ew8Giq7PAqPGs8675iJ7mUgroNXnagQ6ZAFZeKP0BW30o/qECgT4ASnt+LFpShhmusObMEILkU7kMnvN/pGW/OxCKt4B9ixqwPUlE/qc/CPQ== monokaai@monokaai-2.local"
  }

  instance = {
    ami                         = "ami-02a2700d37baeef8b"
    instance_type               = "t2.micro"
    associate_public_ip_address = true

    tags = {
      Name = "${local.owner}-instance"
    }
  }
}
