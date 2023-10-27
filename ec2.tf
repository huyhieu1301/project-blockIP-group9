resource "aws_instance" "web_server" {
  ami             = var.ami_id
  instance_type   = var.instance_type

  vpc_security_group_ids = [aws_security_group.allow_ec2.id]
  subnet_id              = aws_subnet.private_subnet.id
  key_name               = "test"

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y nginx
              sudo service nginx start
              
              echo '<!DOCTYPE html>
              <html>
              <head>
                  <title>Group 9</title>
              </head>
              <body>
                  <h1>Hi guys, we are group 9, our group contains 5 persons. They are:</h1>
                  <ul>
                      <li>Hoang Huy Hieu</li>
                      <li>Duong Ngo Nhat Minh</li>
                      <li>Tran Kha Bang</li>
                      <li>Nguyen Huu Thang</li>
                      <li>Nguyen Minh Duy</li>
                  </ul>
              </body>
              </html>' | sudo tee /usr/share/nginx/html/index.html
              EOF

  tags = {
    Name = "web_server"
  }
}

resource "aws_lb_target_group_attachment" "attach_ec2" {
  target_group_arn = aws_lb_target_group.front_end.arn
  target_id        = aws_instance.web_server.id
  port             = 80
}
