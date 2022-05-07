
resource aws_instance "jenkins_server" {
    ami = var.jenkins_ami
    instance_type = "t3.medium"
    key_name = var.jekins_ssh_key_name

    security_groups = [ aws_security_group.jenkins_sg.name]
    tags = merge(var.tags, {
        Name: "jenkins_server_2"
    })

    root_block_device {
        volume_size = var.storage_size
        volume_type = var.storage_type
    }

    connection {
        type = "ssh"
        user = "centos"
        private_key = file("${var.jekins_ssh_key_name}.pem")
        host = self.private_ip
        timeout = "10m"
    }

    provisioner "file" {
        source = "../scripts/install_jenkins_on_docker.sh"
        destination = "/tmp/install_jenkins_on_docker.sh"
    }

    provisioner "file" {
        source = "../docker/Dockerfile"
        destination = "/tmp/Dockerfile"
    }

    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/install_jenkins_on_docker.sh",
            "sudo sh /tmp/install_jenkins_on_docker.sh | tee /tmp/install_jenkins_on_docker.log"
        ]
    }
}

