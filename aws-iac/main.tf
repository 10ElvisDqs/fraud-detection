terraform {
  backend "s3" {
    bucket = "elvis-mlops-terraform-state-us-east-1"
    key    = "infrastructure/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_public_key
  secret_key = var.aws_secret_key
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_key_pair" "appserver_key" {
  key_name   = "appserver-dev-key"
  public_key = var.ssh_public_key 
}

resource "aws_security_group" "appserver_sg" {
  name        = "appserver-dev"
  description = "Seguridad: SSH y HTTP"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "sg-appserver-dev"
    Environment = "dev"
    Owner       = "elvis"
  }
}

resource "aws_instance" "app_server" {
  ami                         = var.aws_ami_id
  instance_type               = var.aws_instance_type
  key_name                    = aws_key_pair.appserver_key.key_name
  vpc_security_group_ids      = [aws_security_group.appserver_sg.id]
  associate_public_ip_address = true

  tags = {
    Name        = "appserver-dev"
    Environment = "dev"
    Owner       = "elvis"
  }
}
