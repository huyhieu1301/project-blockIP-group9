output "web_server_private_ip" {
  value = aws_instance.web_server.private_ip
  description = "The private IP of the web server EC2 instance"
}

output "alb_dns_name" {
  value = aws_lb.app_lb.dns_name
  description = "The DNS name of the Application Load Balancer"
}
