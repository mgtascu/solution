variable "region" {
  default = "eu-west-1"
}
variable "profile" {
  default = "default"
}

variable "jenkins_ami" {
  default = "ami-192a9460"
}

variable "jekins_ssh_key_name" {
  default = "jenkins_ssh_access_key2"
}

variable "tags" {
  default = {
    "Owner": "Mike",
    "Scope": "Managed by Terraform"
  }
}
variable "instance_type" {
  default = "t3.medium"
}
variable "storage_size" {
  default = "20"
}
variable "storage_type" {
  default = "gp2"
}

variable "security_group_name" {
  default = "jenkins_sg2"
}

variable "github_token" {
  type = string
}

