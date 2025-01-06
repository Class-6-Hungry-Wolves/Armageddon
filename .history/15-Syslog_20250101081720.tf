
variable syslog_server_instance_name {
  description = "Name of the EC2 instance used for the syslog server."
  default     = "Syslog-Server"
}

variable "region" {
  description = "Region where the syslog server will be deployed."
  default     = "ap-northeast-1"
}

variable "syslog_server_port" {
  description = "The port used by the syslog server."
  default     = 2048
}

variable "protocol" {
  description = "The protocol used by the syslog server."
  default     = "tcp"
}

variable "cidr_block_list" {
  description = "This is a list of allowed CIDR blocks"
  type        = set(string)
  default     = ["10.81.0.0/16", "10.82.0.0/16", "10.83.0.0/16", "10.84.0.0/16", "10.85.0.0/16", "10.86.0.0/16"]
}

variable "account_id" {
  description = "ID of account in which resources are created."
  type        = string
  default     = "428425685125"
}

provider "aws" {
  # Default region where syslog server is created.
  region = var.region
  profile = "t"

  # Define allowed account IDs.
  allowed_account_ids = [var.account_id]
}

resource "aws_instance" "syslog_server" {
  ami                    = "ami-023ff3d4ab11b2525"
  instance_type          = "t2.micro"
  key_name               = "Key-Tokyo"
  vpc_security_group_ids = ["${aws_security_group.syslog_server.id}"]
  user_data              = ("${data.template_file.syslog_server_user_data.rendered}")

  tags = {
    Name = "${var.syslog_server_instance_name}"
  }
}

resource "aws_security_group" "syslog_server" {
  name = "${var.syslog_server_instance_name}"

  # Egress: not open to the world
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "${var.protocol}"
    cidr_blocks = var.cidr_block_list
  }

  # Ingress connection to the syslog server
  ingress {
    from_port = "${var.syslog_server_port}"
    to_port   = "${var.syslog_server_port}"
    protocol  = "${var.protocol}"

    # allowed incoming HTTP requests from listed IP.
    cidr_blocks = var.cidr_block_list
  }

  # SSH support
  ingress {
    from_port = "22"
    to_port   = "22"
    protocol  = "${var.protocol}"

    # allowed incoming HTTP requests from listed IP.
    cidr_blocks = var.cidr_block_list
  }
}

data "template_file" "syslog_server_user_data" {
  template = "${file("${path.module}/16-syslog_server_user_data.sh")}"

  vars = {
    port = "${var.syslog_server_port}"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "image-type"
    values = ["machine"]
  }

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }
}

output syslog_server_instance_id {
  value = "${aws_instance.syslog_server.id}"
}