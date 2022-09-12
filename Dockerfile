FROM jenkins/jenkins

USER root

RUN apt update
RUN apt install wget

RUN wget https://updates.jenkins.io/download/war/2.367/jenkins.war
RUN mv jenkins.war /usr/share/jenkins
RUN chown jenkins:jenkins /usr/share/jenkins/jenkins.war

COPY get-docker.sh /usr
RUN chmod +x /usr/get-docker.sh
RUN /usr/get-docker.sh
RUN usermod -aG docker jenkins
