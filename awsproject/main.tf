#####################################################################
##
##      Created 9/25/19 by bob. for awsproject
##
#####################################################################

## REFERENCE {"default-vpc":{"type": "aws_reference_network"}}

terraform {
  required_version = "> 0.8.0"
}

provider "aws" {
}


data "aws_subnet" "subnet" {
  id = "${var.vpc_id}"
  availability_zone = "$var.availability_zone)"
}

data "aws_security_group" "group_name" {
  name = "${var.group_name}"
  vpc_id = "${var.vpc_id}"  # Generated
}

resource "aws_instance" "aws_server" {
  ami = "${var.aws_server_ami}"
  key_name = "${aws_key_pair.auth.id}"
  instance_type = "${var.aws_server_aws_instance_type}"
  availability_zone = "${var.availability_zone}"
  subnet_id  = "${data.aws_subnet.subnet.id}"
  vpc_security_group_ids = ["${data.aws_security_group.group_name.id}"]
  tags {
    Name = "${var.aws_server_name}"
  }
}

resource "tls_private_key" "ssh" {
    algorithm = "RSA"
}

resource "aws_key_pair" "auth" {
    key_name = "${var.aws_key_pair_name}"
    public_key = "${tls_private_key.ssh.public_key_openssh}"
}