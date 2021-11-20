provider "aws" {
  profile = "default"
  region  = "us-east-1"
}
# This is to launch and EC2 Instance
resource "aws_instance" "webserver01" { 
    ami = "ami-087c17d1fe0178315" 
    instance_type = "t2.micro"
}
# This is to create an S3 Bucket
resource "aws_s3_bucket" "mys3bucket"
    bucket = "zawscloud01"
    acl = "private"

    tags = {
      Name = "zawscloud2021"
      Env = "Dev"
    }
}
#This is to create a simple custom vpc, no subnets yet
resource "aws_vpc" "mysamplevpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true

    tags = {
      Name = "my-test-vpc"
      Env = "Dev"
    }
}
