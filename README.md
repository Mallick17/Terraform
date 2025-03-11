# Terraform
**So what is Terraform?** Terraform is an infrastructure as code tool that streamlines the process of building, modifying, and versioning cloud and on-premises resources. Developed by HashiCorp, this powerful tool allows users to define their infrastructure in human-readable configuration files, facilitating efficient management and automation of resources through a declarative approach.

## Install Terraform
Refer to the [Official Installation Guide to install in Ubuntu/Debian, CentOS/RHEL, Fedora, Amazon Linux](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

## **Terraform Workflow**

_**Terraform follows a structured workflow to provision, manage, and destroy infrastructure. The workflow includes the following key commands:**_

1. **`terraform init`**  
   - This command initializes the working directory containing Terraform configuration files.  
   - It downloads necessary provider plugins and sets up the backend for storing Terraform state.  
   - Example:  
     ```sh
     terraform init
     ```

2. **`terraform validate`**  
   - It checks the syntax and correctness of the Terraform configuration files.  
   - Helps identify errors before execution.  
   - Example:  
     ```sh
     terraform validate
     ```

3. **`terraform plan`**  
   - This command generates an execution plan by evaluating changes in the infrastructure.  
   - It shows what actions will be performed without making actual changes.  
   - Example:  
     ```sh
     terraform plan
     ```

4. **`terraform apply`**  
   - This command executes the changes required to reach the desired infrastructure state.  
   - It prompts for confirmation before applying the changes.  
   - Example:  
     ```sh
     terraform apply
     ```

5. **`terraform destroy`**  
   - This command removes all resources managed by Terraform.  
   - It is used to clean up infrastructure when it's no longer needed.  
   - Example:  
     ```sh
     terraform destroy
     ```

This workflow ensures that infrastructure changes are applied in a controlled and automated manner. Let me know if you need further details! 🚀

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

## Terraform File Architecture

Below is a visual representation of the Terraform file architecture:

![Terraform File Architecture](Terraform%20File%20Architecture.drawio.png)
