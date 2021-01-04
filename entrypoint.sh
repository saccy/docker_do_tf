#!/bin/bash

# terraform code is mapped in as part of docker run command
cd /code/
terraform init
terraform apply -auto-approve
