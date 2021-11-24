
resource "aws_instance" "consul_server" {

  ami           = lookup(var.ami, var.region)
  instance_type = "t2.micro"
  key_name      = aws_key_pair.opsschool_consul_key.key_name
  subnet_id                   = aws_subnet.public.id
  iam_instance_profile   = aws_iam_instance_profile.consul-join.name
  associate_public_ip_address = true

  vpc_security_group_ids = [aws_security_group.opsschool_consul.id]
  #user_data_base64 = "ZWNobyAiWjI5dlpDQnRiM0p1YVc1bklITjBZWEp6YUdsdVpRbz0ifGJhc2U2NCAtRCAgPiAvaG9tZS91YnVudHUvZ29vZC50eHQK"
  user_data            = "./run_server.sh"

  provisioner "file" {
    source      = "scripts/consul-server.sh"
    destination = "/home/ubuntu/consul-server.sh"
    connection {   
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file(var.pem_key_name)      
    }   
  }

  tags = {
    Name = "opsschool-server"
    consul_server = "true"
  }

}

resource "aws_instance" "consul_agent" {

  ami           = lookup(var.ami, var.region)
  instance_type = "t2.micro"
  key_name      = aws_key_pair.opsschool_consul_key.key_name
  subnet_id                   = aws_subnet.public.id
  associate_public_ip_address = true
  iam_instance_profile   = aws_iam_instance_profile.consul-join.name
  vpc_security_group_ids = [aws_security_group.opsschool_consul.id]
  #user_data_base64 = "ZWNobyBWR2hsSUVWaGNuUm9JSE5oZVhNc0lDSklaV3hzYnlJS3xiYXNlNjQgLUQgID4gL2hvbWUvdWJ1bnR1L3RoZS50eHQK"
  user_data            = "./run_agent.sh"  
  provisioner "file" {
    source      = "scripts/consul-agent.sh"
    destination = "/home/ubuntu/consul-agent.sh"

    connection {   
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file(var.pem_key_name)      
    }   
  }


  tags = {
    Name = "opsschool-agent"
  }


}

output "server" {
  value = aws_instance.consul_server.public_ip
}

output "agent" {
  value = aws_instance.consul_agent.public_ip
}
 
