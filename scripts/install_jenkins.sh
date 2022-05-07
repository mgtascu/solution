#!/bin/bash

echo "Preparing Jenkins installation"
yum -y install epel-release
yum -y install wget git zip unzip
yum -y install ca-certificates

wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum -y upgrade
yum -y install java-11-openjdk-devel yum-utils 
echo "Installing Jenkins"
yum -y install jenkins

yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo \
    -y
    
yum -y install docker-ce docker-ce-cli containerd.io

systemctl daemon-reload
systemctl enable jenkins docker
systemctl start jenkins docker
chown -R jenkins:jenkins /var/lib/jenkins
echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

cat 
