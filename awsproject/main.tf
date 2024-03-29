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

data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_vpc" "default" {
      default = true
}

data "aws_subnet" "subnet" {
  vpc_id = "${data.aws_vpc.default.id}"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
}

data "aws_security_group" "group_name" {
  name = "${var.group_name}"
  vpc_id = "${data.aws_vpc.default.id}"  # Generated
}

resource "aws_instance" "aws_server" {
  ami = "${var.aws_server_ami}"
#  key_name = "${aws_key_pair.auth.id}"
  key_name = "${var.aws_key_pair_name}"  # Generated
  instance_type = "${var.aws_server_aws_instance_type}"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  subnet_id  = "${data.aws_subnet.subnet.id}"
  vpc_security_group_ids = ["${data.aws_security_group.group_name.id}"]
  associate_public_ip_address = "true"
  tags {
    Name = "${var.aws_server_name}"
  }
}

# resource "tls_private_key" "ssh" {
#     algorithm = "RSA"
# }

# resource "aws_key_pair" "auth" {
#    key_name = "${var.aws_key_pair_name}"
#    public_key = "${tls_private_key.ssh.public_key_openssh}"
# }

