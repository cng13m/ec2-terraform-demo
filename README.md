# AWS EC2 + VPC + Nginx – 100% Terraform (IaC)

Deployed a complete AWS environment from scratch using Terraform:

- Custom VPC + public subnet  
- Internet Gateway + route tables  
- Security Group (SSH from my IP + HTTP/HTTPS open)  
- Ubuntu 22.04 t3.micro (Free Tier)  
- Auto-installed Nginx on boot  
- Public DNS enabled  

Live demo: http://<your-public-ip>  
Deployed in **eu-central-1** (Frankfurt)

```bash
terraform apply -var="my_ip=$(curl -s ifconfig.me)"