provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0a628e1e89aaedf80"
  instance_type = "t2.micro"

  security_groups = [aws_security_group.allow_port_5000.name]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install -y docker.io
              sudo systemctl start docker
              sudo systemctl enable docker
              sudo docker run -d -p 5000:5000 gkabanashvili/fb:latest
              EOF

  tags = {
    Name = "fb-flask"
  }
}

resource "aws_security_group" "allow_port_5000" {
  name        = "allow-port-5000"
  description = "Allow inbound access on port 5000"

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow access from any IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "public_ip" {
  value = aws_instance.example.public_ip
}
