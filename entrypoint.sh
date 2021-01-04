#!/bin/bash

# TODO: add error handling for arg
# $1 can be destroy or apply.

# terraform code is mapped in as part of docker run command
cd /code/digital_ocean
terraform init
terraform $1 -auto-approve
