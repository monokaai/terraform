locals {
  owner = "tutorial"

  vpc = {
    cidr_block           = "192.168.0.0/16"
    enable_dns_hostnames = true
    tags = {
      Name = "${local.owner}-vpc"
    }
  }

  subnet = {
    subnet1 = {
      cidr_block        = "192.168.1.0/24"
      availability_zone = "ap-northeast-1a"

      tags = {
        Name = "${local.owner}-public-subnet-1"
      }
    }

    subnet2 = {
      cidr_block        = "192.168.2.0/24"
      availability_zone = "ap-northeast-1c"

      tags = {
        Name = "${local.owner}-public-subnet-2"
      }
    }

    subnet3 = {
      cidr_block        = "192.168.3.0/24"
      availability_zone = "ap-northeast-1d"

      tags = {
        Name = "${local.owner}-public-subnet-3"
      }
    }
  }
}
