ARG TAG="latest"
FROM jenkins/jenkins:${TAG}

ENV CASC_JENKINS_CONFIG /var/jenkins_home/jcasc.yaml
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
COPY jenkins_global_config.yaml /var/jenkins_home/jcasc.yaml
ADD job_builder/ /tmp

USER root
RUN apt-get update -y && apt-get install -y python3 python3-pip && pip3 install jenkins-job-builder
RUN curl https://get.docker.com/ > dockerinstall && chmod 777 dockerinstall && ./dockerinstall
