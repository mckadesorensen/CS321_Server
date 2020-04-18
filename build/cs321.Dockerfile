FROM amazonlinux:2

RUN yum update -y && \
    yum install -y python3-devel make git wget awscli zip gcc unzip nano && \
    wget https://releases.hashicorp.com/terraform/0.12.18/terraform_0.12.18_linux_amd64.zip && \
    unzip *.zip && chmod +x terraform && mv terraform /usr/local/bin