FROM saccy/azp-agent:latest

# Pre-reqs
RUN yum install -y unzip openssh nmap-ncat jq

# Digital Ocean CLI
ENV do_ver /tmp/do_ver
RUN curl -sL https://github.com/digitalocean/doctl/releases | grep '<a href="/digitalocean/doctl/releases/tag' | cut -d'>' -f2 | cut -d'<' -f1 | sed 's/^v//g' | sed '/-/!{s/$/_/}' | sort -V | sed 's/_$//' | tail -1 > $do_ver
RUN curl -L https://github.com/digitalocean/doctl/releases/download/v$(cat $do_ver)/doctl-$(cat $do_ver)-linux-amd64.tar.gz -o doctl.tar.gz
RUN tar xfz doctl.tar.gz
RUN mv doctl /usr/sbin/

# Terraform
ENV tf_ver /tmp/tf_ver
RUN curl -sL https://releases.hashicorp.com/terraform | grep "<a\ href=\"\/terraform\/" | cut -d'>' -f2 | cut -d'<' -f1 | cut -d'_' -f2 | grep -w "^[0-9]\.[0-9]\.[0-9]$" | sed '/-/!{s/$/_/}' | sort -V | sed 's/_$//' | tail -1 > ${tf_ver}
#RUN curl -L https://releases.hashicorp.com/terraform/0.14.3/terraform_0.14.3_linux_amd64.zip -o terraform.zip
RUN curl -L https://releases.hashicorp.com/terraform/$(cat $tf_ver)/terraform_$(cat $tf_ver)_linux_amd64.zip -o terraform.zip
RUN unzip terraform.zip
RUN mv terraform /usr/sbin/

# Postgres binary (psql)
RUN dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm
RUN dnf -qy module disable postgresql
RUN dnf install -y postgresql13

