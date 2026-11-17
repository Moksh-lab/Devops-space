variable "aws_region" {
  description = "AWS Region jahan resources banenge"
  type        = string
  default     = "ap-southeast-2" # Sydney (aapka configured region)
}

variable "instance_type" {
  description = "EC2 Instance type (Free tier eligible)"
  type        = string
  default     = "t3.micro"
}

variable "project_name" {
  description = "Project ka naam tagging ke liye"
  type        = string
  default     = "devpulse-cloud"
}