resource "aws_key_pair" "mykey" {
  key_name   = "devops-demo-key"
  public_key = file("~/.ssh/id_rsa.pub")   
}

resource "aws_instance" "web" {
  ami                    = "ami-03b7a7ce915b46b75"
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.allow_ssh_web.id]
  key_name               = aws_key_pair.mykey.key_name

  tags = {
    Name = "DevOps-Demo-EC2"
  }

  # Install Nginx on boot
  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install nginx -y
              systemctl enable nginx
              systemctl start nginx
              echo "<h1>Hello from Terraform EC2! Deployed on Ubuntu</h1>" > /var/www/html/index.html
              EOF
}