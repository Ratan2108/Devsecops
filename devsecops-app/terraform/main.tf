provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "devsecops" {
  ami                    = "ami-0c02fb55956c7d316"  # Amazon Linux 2 AMI
  instance_type          = "t2.micro"
  associate_public_ip_address = true

  tags = {
    Name = "devsecops-instance"
  }

  # 🔐 Least privilege security group (optional)
  vpc_security_group_ids = [aws_security_group.devsecops_sg.id]
}

resource "aws_security_group" "devsecops_sg" {
  name        = "devsecops_sg"
  description = "Allow SSH and app traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["YOUR_IP/32"] # Replace with your own IP!
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
