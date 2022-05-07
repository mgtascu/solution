resource "aws_security_group" "jenkins_sg" {
    name        = var.security_group_name
    description = "SG to manage jenkins HTTP and SSH access"

    egress {
        from_port         = 0
        to_port           = 0
        protocol          = "-1"
        cidr_blocks       = ["0.0.0.0/0"]
        description       = "All outbound traffic"
    }

    ingress {
        from_port         = 22
        to_port           = 22
        protocol          = "tcp"
        cidr_blocks       = ["0.0.0.0/0"]
        description       = "All SSH inbound traffic"
    }
     ingress {
        from_port         = 8080
        to_port           = 8080
        protocol          = "tcp"
        cidr_blocks       = ["0.0.0.0/0"]
        description       = "All HTTP inbound traffic on 8080"
    }
}
