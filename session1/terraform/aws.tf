provider "aws" {
  region = var.region
}

resource "aws_security_group" "opsschool_consul" {
  name        = "opsschool-consul"
  description = "Allow ssh & consul inbound traffic"
  vpc_id = aws_vpc.consul_vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
    description = "Allow all inside security group"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["84.229.153.195/32"]
    description = "Allow ssh from the world"
  }

  ingress {
    from_port   = 8500
    to_port     = 8500
    protocol    = "tcp"
    cidr_blocks = ["84.229.153.195/32"]
    description = "Allow consul UI access from the world"
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["84.229.153.195/32"]
    description     = "Allow all outside security group"
  }
}

# Create an IAM role for the auto-join
resource "aws_iam_role" "consul-join" {
  name               = "opsschool-consul-join"
  assume_role_policy = file("${path.module}/templates/policies/assume-role.json")
}

# Create the policy
resource "aws_iam_policy" "consul-join" {
  name        = "opsschool-consul-join"
  description = "Allows Consul nodes to describe instances for joining."
  policy      = file("${path.module}/templates/policies/describe-instances.json")
}

# Attach the policy
resource "aws_iam_policy_attachment" "consul-join" {
  name       = "opsschool-consul-join"
  roles      = [aws_iam_role.consul-join.name]
  policy_arn = aws_iam_policy.consul-join.arn
}

# Create the instance profile
resource "aws_iam_instance_profile" "consul-join" {
  name  = "opsschool-consul-join"
  role = aws_iam_role.consul-join.name
}
