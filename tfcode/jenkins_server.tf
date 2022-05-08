
resource aws_instance "jenkins_server" {
    depends_on = [ aws_key_pair.jenkins_key_pair, aws_security_group.jenkins_sg ]
    ami = var.jenkins_ami
    instance_type = var.instance_type
    key_name = var.jekins_ssh_key_name

    security_groups = [ aws_security_group.jenkins_sg.name]
    tags = merge(var.tags, {
        Name: "jenkins_server"
    })

    root_block_device {
        volume_size = var.storage_size
        volume_type = var.storage_type
    }

    connection {
        type = "ssh"
        user = "centos"
        private_key = file("${var.jekins_ssh_key_name}.pem")
        host = self.public_ip
        timeout = "10m"
    }

    provisioner "file" {
        source = "../payload"
        destination = "/tmp"
    }
    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/payload/install_jenkins_on_docker.sh",
            "sudo sh /tmp/payload/install_jenkins_on_docker.sh ${var.github_token}| tee /tmp/payload/install_jenkins_on_docker.log"
        ]
    }
}

