# Default VPC use kar rahe hain
data "aws_vpc" "default" {
  default = true
}

# Firewall (Security Group)
resource "aws_security_group" "devpulse_sg" {
  name        = "${var.project_name}-sg"
  description = "Allow inbound traffic for SSH, Web, and DevPulse App"
  vpc_id      = data.aws_vpc.default.id

  # SSH access (Port 22)
  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP Web traffic (Port 80)
  ingress {
    description = "HTTP Access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # DevPulse App Port (Port 8000)
  ingress {
    description = "DevPulse App Access"
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound rule (Server internet se packages download kar sake)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "${var.project_name}-sg"
    Project = var.project_name
  }
}