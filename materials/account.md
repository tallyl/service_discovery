# AWS Account

## Create Account
Please create a new AWS personal account. If you already have one available from work/personal that you can use feel free to use that.
> Important note: If you already had a personal account that was created more than a year ago you probably already lost your [free tier](https://aws.amazon.com/free/?all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc) privileges. please create a new account with a new email address to get the free tier privileges on this new account. 

You can use [these](https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/) instructions to open a new account.

## Create Admin Account
Create AWS admin account and apply MFA on it
You can read more information about this [here](https://docs.aws.amazon.com/IAM/latest/UserGuide/getting-started_create-admin-group.html)


## AWS Account access and authorizations
There are three ways to authorize AWS cli/api from a remote host:
- Credential file
- Enviroment variables
- IAM EC2 Roles

Required actions:
- Install and configure AWS CLI on your workstation/server using this [manual](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)
- Configure the proper authorization to access your AWS account
> Note: It is better practice to use an EC2 instance with an IAM EC2 role as your workstation. You can read about how to configure an IAM EC2 roles [here](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-roles-for-amazon-ec2.html)
- Test AWS CLI running the following command
```
aws s3 ls
```