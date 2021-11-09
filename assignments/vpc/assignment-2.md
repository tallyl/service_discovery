## VPC - Assignment #2
Use Terraform to improve your grandpa's whiskey website running on AWS infastructure.

### Create reuseable terraform code

✅ Rebuild your current VPC environment as a Terraform module with proper folder structure

### Allow for terraform team collaboration
✅ Move the current state of your environment to remote state in S3

### Upgrade your application infrastructure

✅ Add the hostname to the webpage so it will be shown as part of the welcome page

✅ Configure a load balancer with stickiness of: 1 min

✅ Upload web server access logs to S3 every hour
> Hint: EC2 IAM roles

🦸🏻‍♀️ Optional: Make sure to log the original IP address in the webserver access logs

### Improve your infrastructure code

✅ If you still didn't do so, separate your security groups and route tables from their  [rules](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule).

> You can read about the full comparison between the approaches and when you should use each of them [here](http://cavaliercoder.com/blog/inline-vs-discrete-security-groups-in-terraform.html)

### Improve your infrastructure code

✅ If you still didn't do so, separate your security groups and route tables from their  [rules](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule).

> You can read about the full comparison between the approaches and when you should use each of them [here](http://cavaliercoder.com/blog/inline-vs-discrete-security-groups-in-terraform.html)

✅ If you still didn't do so, If you still didn't do so, make your LB from the previous HW be application-typed not classic.

> On August 11, 2016, AWS introduced its new Application Load Balancer (ALB).
ALB provides more advanced technology and options (such as advanced monitoring). When it comes to HTTP load balancing, ALB is recommended over CLB.
Click [here](https://www.sumologic.com/insight/aws-elastic-load-balancers-classic-vs-application/) for a detailed comparison between the types.

# 🏁 That's it your'e done! 🏁 

![](https://media.giphy.com/media/XQf2LxzdXBt8yo6NcA/giphy.gif?cid=ecf05e471nbd7bt9z4koegszds81rttwgnaw3cn1xj7k4lzy&rid=giphy.gif&ct=g)

