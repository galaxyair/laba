provider "aws" {
  access_key = var.public
  secret_key = var.secret
  region     = var.region_aws_id
}


resource "aws_instance" "instance_second" {
  ami                    = var.ami
  instance_type          = var.instance_size
  key_name               = "MonsterEnergy"
  user_data              = "./script.sh"
  vpc_security_group_ids = [aws_security_group.instance_sg.id]
}

resource "aws_security_group" "instance_sg" {
  dynamic "ingress" {
    for_each      = ["22", "80", "443"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

