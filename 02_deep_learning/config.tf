provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-07728e9e2742b0662"
  instance_type = "p2.xlarge"
}

