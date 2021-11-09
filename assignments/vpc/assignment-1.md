## VPC - Assignment #1
Use Terraform to provision a highly available and secure AWS environment for grandpa's whiskey website.

### Build these in AWS using Terraform

✅ VPC which includes 
- private and public subnets (each in at least 2 AZs)
- Internet Gateway
- NAT Gateway
- Proper routes

✅ 2 web server
- These should be accessible to public users
- Each instance should have nginx installed on it and have the welcome page changed that say "Welcome to Grandpa's Whiskey"

✅ Load balance between your web servers, and health check you nginx application

✅ 2 DB servers 
- These should be private and not accessible to public users 
> Note: There is no need to install a real DB just verify that the server is not accessable from the internet even when the SG ports are open

✅ Make sure all components have egress access to the internet

[Next: **Start Assignment 2** ➡️](assignment-2.md)

