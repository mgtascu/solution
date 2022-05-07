#!/bin/bash

echo "Preparing Jenkins installation"
yum -y install epel-release
yum -y install wget git zip unzip yum-utils

yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo \
    -y
    
yum -y install docker-ce docker-ce-cli containerd.io

systemctl daemon-reload
systemctl enable docker
systemctl start docker

usermod -aG docker centos
su centos

HOSTNAME=$(curl -s http://169.254.169.254/latest/meta-data/public-hostname)


cd /tmp || exit 2
docker build -t custom_jenkins:1.0 .
docker run -d -e JENKINS_HOST="http://${HOSTNAME}:8080" -v /var/run/docker.sock:/var/run/docker.sock -v /var/jenkins_home/workspace:/var/jenkins_home/workspace -p 8080:8080 custom_jenkins:1.0
