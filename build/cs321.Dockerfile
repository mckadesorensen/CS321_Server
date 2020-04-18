FROM amazonlinux:2

RUN yum update -y && \
    yum install -y python3-devel make git wget awscli zip gcc unzip nano