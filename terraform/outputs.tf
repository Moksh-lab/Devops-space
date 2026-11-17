output "server_public_ip" {
  description = "Aapke naye AWS EC2 Server ka Public IP address"
  value       = aws_instance.devpulse_server.public_ip
}

output "app_url" {
  description = "App ka direct web link"
  value       = "http://${aws_instance.devpulse_server.public_ip}:8000"
}