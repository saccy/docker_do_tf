FROM digitalocean/doctl:latest

RUN curl -L https://releases.hashicorp.com/terraform/0.14.3/terraform_0.14.3_linux_amd64.zip -o terraform.zip
RUN unzip terraform.zip
RUN mv terraform /usr/sbin/
RUN mv doctl /usr/sbin/
COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
CMD ["/entrypoint.sh"]

