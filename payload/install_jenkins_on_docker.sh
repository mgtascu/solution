#!/bin/bash
TOKEN="$1"
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

HOSTNAME=$(curl -s http://169.254.169.254/latest/meta-data/public-hostname)

set -x
cd /tmp/payload || exit 2
docker build -t custom_jenkins:1.0 .
mkdir -p /var/jenkins_home/workspace/
CID=$(docker run -d -e JENKINS_HOST="http://${HOSTNAME}:8080" -e GITHUB_TOKEN=$TOKEN -v /var/run/docker.sock:/var/run/docker.sock -v /var/jenkins_home/workspace:/var/jenkins_home/workspace -p 8080:8080 custom_jenkins:1.0)

echo "Waiting fo jenkins to be up and running"
sleep 30s

docker exec $CID jenkins-jobs --conf /tmp/config.ini update /tmp/seed.yaml
