# session1 setup
during the session we will run a consule server and play with consul, for that we will need to servers 
1. server
2. client

we have created a small terraform that will start these two instances
make sure terraform runs smoothly on your serup

cd to terraform directory
run terraform init
terraform apply

terraform will do the following
1. create a pem key that will be used for these servers
2. create and start two servers
3. add tags to the servers
4. create the security policies
5. the two servers names will be output
6. a pem file will be created


please loging to the servers using this command:
ssh -i ./opsschool_consul.pem ubuntu@${EC2_INSTANCE_NAME}

please upload the answer from this command on each of the server
cat /home/ubuntu/my_file.txt

