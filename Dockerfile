FROM saccy/azp-agent:latest

# Pre-reqs
RUN yum install -y unzip openssh nmap-ncat jq

# Digital Ocean CLI
RUN curl -L https://github.com/digitalocean/doctl/releases/download/v1.60.0/doctl-1.60.0-linux-amd64.tar.gz -o doctl.tar.gz
RUN tar xfz doctl.tar.gz
RUN mv doctl /usr/sbin/

# Terraform
RUN curl -L https://releases.hashicorp.com/terraform/0.14.3/terraform_0.14.3_linux_amd64.zip -o terraform.zip
RUN unzip terraform.zip
RUN mv terraform /usr/sbin/
