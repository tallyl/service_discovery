resource "aws_instance" "consul_server" {

  ami           = lookup(var.ami, var.region)
  instance_type = "t2.micro"
  key_name      = aws_key_pair.opsschool_consul_key.key_name

  iam_instance_profile   = aws_iam_instance_profile.consul-join.name
  vpc_security_group_ids = [aws_security_group.opsschool_consul.id]
  user_data_base64 = "ZWNobyAiWjI5dlpDQnRiM0p1YVc1bklITjBZWEp6YUdsdVpRbz0ifGJhc2U2NCAtRCAgPiAvaG9tZS91YnVudHUvZ29vZC50eHQK"

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

  iam_instance_profile   = aws_iam_instance_profile.consul-join.name
  vpc_security_group_ids = [aws_security_group.opsschool_consul.id]
  user_data_base64 = "VkdobElFVmhjblJvSUhOaGVYTXNJQ0pJWld4c2J5SUt8YmFzZTY0IC1EICA+IC9ob21lL3VidW50dS90aGUudHh0Cg=="
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
  value = aws_instance.consul_server.public_dns
}

output "agent" {
  value = aws_instance.consul_agent.public_dns
}
 
