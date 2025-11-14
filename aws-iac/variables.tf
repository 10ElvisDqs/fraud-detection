variable "aws_region" {
  description = ""
  type = string
  default = "us-east-1" 
}

variable "aws_ami_id" {
  description = ""
  type = string
  default = "ami-0ecb62995f68bb549"
}

variable "aws_instance_type" {
  description = ""
  type = string
  default = "t2.micro"
}

variable "aws_public_key" {
  description = "pulic_key"
  type = string
  default = ""
}

variable "aws_secret_key" {
  description = "secret_key"
  type = string
  default = ""
}

variable "ssh_public_key" {
  description = "Clave ssh pública para el servicio1"
  type = string

}



