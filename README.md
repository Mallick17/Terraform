# Terraform
**So what is Terraform?** Terraform is an infrastructure as code tool that streamlines the process of building, modifying, and versioning cloud and on-premises resources. Developed by HashiCorp, this powerful tool allows users to define their infrastructure in human-readable configuration files, facilitating efficient management and automation of resources through a declarative approach.

## Install Terraform
Refer to the [Official Installation Guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

#### Prerequisites

Ensure that your system is up to date and that you have the following packages installed: `gnupg`, `software-properties-common`, and `curl`. These packages are required to verify HashiCorp's GPG signature and install the HashiCorp Debian package repository.

```bash
$ sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
```

## Install the HashiCorp GPG Key
- You install the HashiCorp GPG key to verify the authenticity and integrity of downloaded HashiCorp software packages, ensuring that the files you are installing are genuinely from HashiCorp and haven't been tampered with during download, by checking their digital signature using the public GPG key they provide; this is a standard security practice to protect against malicious software distribution.
- Download and install the HashiCorp GPG key to verify the authenticity of the packages.

```bash
$ wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
```

## Verify the Key's Fingerprint

Verify the GPG key's fingerprint to ensure it matches HashiCorp's official key.

```bash
$ gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint
```

The `gpg` command will report the key fingerprint:

```
/usr/share/keyrings/hashicorp-archive-keyring.gpg
-------------------------------------------------
pub   rsa4096 XXXX-XX-XX [SC]
AAAA AAAA AAAA AAAA
uid           [ unknown] HashiCorp Security (HashiCorp Package Signing) <security+packaging@hashicorp.com>
sub   rsa4096 XXXX-XX-XX [E]
```

**Tip**: Refer to the [Official Packaging Guide](https://www.hashicorp.com/official-packaging-guide) for the latest public signing key. You can also verify the key on [Security at HashiCorp](https://www.hashicorp.com/security) under Linux Package Checksum Verification.

## Add the Official HashiCorp Repository

Add the official HashiCorp repository to your system. The `lsb_release -cs` command finds the distribution release codename for your current system, such as `buster`, `groovy`, or `sid`.

```bash
$ echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list
```

## Download Package Information

Update your package list to include the new HashiCorp repository.

```bash
$ sudo apt update
```

## Install Terraform

Install Terraform from the newly added repository.

```bash
$ sudo apt-get install terraform
```

**Tip**: Now that you have added the HashiCorp repository, you can install other HashiCorp products like Vault, Consul, Nomad, and Packer using the same command.

## Verify the Installation

Verify that the installation was successful by opening a new terminal session and listing Terraform's available subcommands.

```bash
$ terraform -help
Usage: terraform [-version] [-help] <command> [args]

The available commands for execution are listed below.
The most common, useful commands are shown first, followed by
less common or more advanced commands. If you're just getting
started with Terraform, stick with the common commands. For the
other commands, please read the help and docs before usage.
##...
```

To learn more about a specific subcommand, add it to `terraform -help`. For example:

```bash
$ terraform -help plan
```

This will provide detailed information about the `plan` subcommand and its available options.

---

This document provides a clear and concise guide for installing Terraform on a Debian-based system, including verification steps and tips for additional HashiCorp products.
## Terraform File Architecture

Below is a visual representation of the Terraform file architecture:

![Terraform File Architecture](Terraform%20File%20Architecture.drawio.png)

## Features

- Modular file structure.
- Reusable Terraform modules.
- Environment-specific configurations.

## Usage

1. Clone this repository.
2. Update the variables as needed.
3. Apply the Terraform configuration:
   ```bash
   terraform init
   terraform apply

