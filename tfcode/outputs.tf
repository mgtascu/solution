output "ec2_id" {
  value = aws_instance.jenkins_server.id
}

output "ec2_private_ip" {
  value = aws_instance.jenkins_server.private_ip
}

output "ec2_public_ip" {
  value = aws_instance.jenkins_server.public_ip
}

output "jenkins_server_url" {
  value = "http://${aws_instance.jenkins_server.public_dns}:8080" 
}

output "ssh_key_name" {
  value = "${var.jekins_ssh_key_name}.pem"
}