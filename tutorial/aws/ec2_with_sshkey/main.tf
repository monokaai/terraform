terraform {
  backend "s3" {
    bucket = "tfstate-management-mono"
    key    = "terraform.tfstate"
    region = "ap-northeast-1"
    # dynamodb_table = "ddb-tsstate"
  }
}

variable "access_key" {
  type    = string
  default = "XXXXXXXXXXXXXXXXXXX"
}

variable "secret_key" {
  type    = string
  default = "YYYYYYYYYYYYYYYYYYY"
}

variable "region" {
  type    = string
  default = "ap-northeast-1"
}

variable "host_ip" {
  type    = string
  default = "XXX.XXX.XXX.XXX"
}


provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}
