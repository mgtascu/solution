resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "jenkins_key_pair" {
  key_name   = var.jekins_ssh_key_name 
  public_key = tls_private_key.ssh_key.public_key_openssh
  tags = var.tags
}

resource "local_file" "private_key" {
  content = tls_private_key.ssh_key.private_key_pem
  filename = "${var.jekins_ssh_key_name}.pem"
}
