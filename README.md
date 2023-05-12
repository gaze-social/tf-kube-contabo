# tf-kube-contabo

This repository contains Terraform IaC configuration that set up a bare node cluster with SSH access, utilizing cloud-init to set up instances to prepare for [kube-spray](https://kubespray.io/) production-grade installation.

![](https://cdn.knoji.com/images/logo/contabo.jpg?aspect=center&snap=false&width=500&height=250)

## Prerequisites

Before you start, please ensure the following software is installed:

- [Terraform](https://www.terraform.io/downloads.html)
- An SSH client

## Getting Started

### 1. Configure Your SSH Key

The SSH key should be placed into the `ssh_keys` directory. This will be loaded into the instances using cloud-init.

```bash
ssh-keygen
cat ~/.ssh/id_rsa.pub
```

### 2. Create terraform.tfvars file

Provide the OAuth credentials and Public Key
   
```init
client_id     = ""
client_secret = ""
username      = ""
password      = ""
public_key    = ""
```

### 3. Run Terraform

```bash

terraform init
terraform plan
terraform apply -auto-approve
```

## Note
Please ensure that the public key used for SSH access is properly secured and not shared publicly. Anybody with access to the private key corresponding to the public key used here will be able to access the created instances.

## Issues
If you encounter any issues, please open a ticket in the GitHub issue tracker. Please include as much information as possible, including error messages, to aid in resolution.

## Contributing
Contributions are welcome! Please fork this repository and open a pull request with your changes.