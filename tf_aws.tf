variable "accessKey" {
  type        = "string"
  description = "AWS access key id"
  default = "missing"
}

variable "secretKey" {
  type        = "string"
  description = "AWS access secret key"
  default = "missing"
}

provider "aws" {
  access_key = "${var.accessKey}"
  secret_key = "${var.secretKey}"
  region     = "us-east-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0c62b7d8130ee640c"
  instance_type = "t2.micro"
}
