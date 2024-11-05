resource "aws_security_group" "ec2_sg" {
  name = "ec2_security_group"
  description = "Allow SSH and Internet connection"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress rule to allow HTTP outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  
  }
}

resource "aws_instance" "test_lambda_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  security_groups = [ aws_security_group.ec2_sg.name ]
  key_name = "test_lambda"

  tags = {
    Name = "Test Lambda Instance"
  }
}

# Output the instance ID
output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.test_lambda_instance.id
}

# Output the public IP address
output "public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.test_lambda_instance.public_ip
}
