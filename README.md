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
## Types of Blocks in Terraform
Terraform is an Infrastructure as Code (IaC) tool that enables us to define and provision infrastructure using a high-level configuration language. Terraform configurations are written using blocks, which define the different components and behavior of our infrastructure. Let's break down the blocks in Terraform in detail using the provided IaC code

### Here’s a comprehensive example that integrates all the blocks we’ve discussed:

```hcl
terraform {
  required_version = ">= 1.0.0"
  
  backend "s3" {
    bucket = "my-terraform-state"
    key    = "global/s3/terraform.tfstate"
    region = "us-east-1"
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 3.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
  access_key = "YOUR_ACCESS_KEY"
  secret_key = "YOUR_SECRET_KEY"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

locals {
  instance_name = "example-instance"
}

data "aws_ami" "latest" {
  most_recent = true
  owners      = ["amazon"]

  filters = {
    name  = "amzn2-ami-hvm-*-x86_64-gp2"
    state = "available"
  }
}

resource "aws_instance" "example" {
  ami           = data.aws_ami.latest.id
  instance_type = var.instance_type
  tags = {
    Name = local.instance_name
  }
}

output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.example.id
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  
  name = "my-vpc"
  cidr = "10.0.0.0/16"
  
  azs             = ["us-west-2a", "us-west-2b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.3.0/24", "10.0.4.0/24"]
}
```

### 1. **Terraform Block**

The `terraform` block is used to configure the Terraform settings. It's a top-level block that specifies the backend, required providers, required versions, and other global settings for the Terraform configuration. 

#### Example:
```hcl
terraform {
  required_version = ">= 1.0.0"
  
  backend "s3" {
    bucket = "my-terraform-state"
    key    = "global/s3/terraform.tfstate"
    region = "us-east-1"
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 3.0"
    }
  }
}
```

#### Explanation:
- `required_version`: Specifies the minimum required version of Terraform.
- `backend`: Configures the backend where the state file will be stored (in this case, S3).
- `required_providers`: Specifies which providers are required for this configuration, such as AWS.

---

### 2. **Provider Block**

The `provider` block configures the provider plugin, which defines the cloud platform (e.g., AWS, Azure, GCP) or other infrastructure services you will use.

#### Example:
```hcl
provider "aws" {
  region  = "us-west-2"
  access_key = "YOUR_ACCESS_KEY"
  secret_key = "YOUR_SECRET_KEY"
}
```

#### Explanation:
- The `provider "aws"` block configures the AWS provider with the specified region and access keys.
- You can use this block to specify credentials, regions, and other provider-specific configurations.

---

### 3. **Data Block**

The `data` block allows you to fetch data from external sources, such as existing resources or third-party APIs. we can use a data block to fetch information about existing resources, such as a list of available AWS AMIs or the currently existing state of a Kubernetes cluster.
- Retrieving information about existing infrastructure to be used in the Terraform configuration.
- Querying and filtering data for use in resource configuration.

#### Example:
```hcl
data "aws_vpc" "existing_vpc" { id = "vpc-12345678" } 
```
OR
```hcl
data "aws_ami" "latest" {
  most_recent = true
  owners      = ["amazon"]

  filters = {
    name   = "amzn2-ami-hvm-*-x86_64-gp2"
    state  = "available"
  }
}
```

#### Explanation:
- The `data "aws_ami"` block is used to fetch information about an Amazon Machine Image (AMI) that matches the specified criteria (e.g., most recent AMI, owned by Amazon).
- This can be used to reference the AMI ID when creating EC2 instances.

---

### 4. **Resource Block**

The `resource` block is the most fundamental block in Terraform. It defines the infrastructure elements (such as virtual machines, databases, or networks) that you want to create, update, or delete.

#### Example:
```hcl
resource "aws_instance" "example" {
  ami           = data.aws_ami.latest.id
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleInstance"
  }
}
```

#### Explanation:
- The `resource "aws_instance"` block creates an EC2 instance using the latest AMI that was retrieved in the `data` block.
- Resources are the actual components of your infrastructure that Terraform manages (e.g., EC2 instances, VPCs, security groups).

---

### 5. **Module Block**

Modules in Terraform are reusable containers of resources and other configurations to encapsulate and manage infrastructure components. A `module` block allows you to define and use a collection of resources defined in another directory or as part of a public module registry.

#### Example:
```hcl
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  
  name = "my-vpc"
  cidr = "10.0.0.0/16"
  
  azs             = ["us-west-2a", "us-west-2b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.3.0/24", "10.0.4.0/24"]
}
```

#### Explanation:
- The `module` block imports a pre-built module from the Terraform registry (in this case, a VPC module).
- Modules are helpful for organizing and reusing configurations across different projects.

---

### 6. **Variable Block**

The `variable` block defines input variables, allowing you to pass values into your Terraform configuration. These variables can be of various types (string, number, list, etc.) and help make your configuration more dynamic and reusable.

#### Example:
```hcl
variable "instance_count" {
  description = "Number of instances to create"
  type        = number
  default     = 1
}
```
1. **`variable "instance_count"`**:  
   Declares a variable named `instance_count` to be used in your configuration.

2. **`description = "Number of instances to create"`**:  
   Provides a brief description of what the variable represents.

3. **`type = number`**:  
   Specifies that the variable should be a numeric value (integer or float).

4. **`default = 1`**:  
   Sets the default value of `instance_count` to `1`, meaning it will create 1 instance unless overridden.
This allows you to control the number of instances in your configuration dynamically.

OR

```hcl
variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}
```
#### Explanation:
- The `variable` block defines an input variable called `instance_type`.
- The `default` value is set to `t2.micro`, but it can be overridden when applying the configuration.

#### Example Usage in a Resource Block:
```hcl
resource "aws_instance" "example" {
  ami           = data.aws_ami.latest.id
  instance_type = var.instance_type
}
```

---

### 7. **Output Block**

The `output` block is used to define the values that will be displayed after the Terraform plan or apply is executed. Outputs can include information like IP addresses, URLs, or resource identifiers that are useful for interacting with the given infrastructure. By defining output blocks, you can extract important information from your infrastructure and provide it to users or other systems for further actions or integrations.
#### Example:
```hcl
output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.example.id
}
```

#### Explanation:
- The `output "instance_id"` block will output the ID of the EC2 instance after Terraform has provisioned it.
- Outputs can be used to expose information to other parts of your system or to the user.

---

### 8. **Locals Block**

The `locals` block allows declaring local variables within the Terraform configuration for easier code readability and reusability.Local variables are temporary and can be defined within a block to compute and store intermediate values that are used within the same configuration file. These variables are not exposed to other configurations or modules and are purely for internal use within the same configuration.

#### Example:
```hcl
locals {
  region       = "us-west-2"
  instance_type = "t2.micro"
}
```

#### Explanation:
- The `locals` block defines local variables `region` and `instance_type`.
- These values can be used throughout the Terraform configuration and are not exposed outside of the current module.

#### Example Usage:
```hcl
resource "aws_instance" "example" {
  ami           = data.aws_ami.latest.id
  instance_type = local.instance_type
  availability_zone = local.region
}
```

---

### Key Takeaways:
- **Terraform Block**: Configures global settings such as required versions and providers.
- **Provider Block**: Defines the provider configuration, like AWS or Azure.
- **Data Block**: Queries existing data (like AMIs, existing VPC or resource information).
- **Resource Block**: Creates and manages infrastructure resources.
- **Module Block**: Reuses and organizes Terraform code in reusable modules.
- **Variable Block**: Defines input parameters that can be dynamically configured.
- **Output Block**: Exposes data for use after Terraform apply.
- **Locals Block**: Creates local variables for reuse within the configuration.

By using these blocks effectively, you can manage complex infrastructure in a modular, reusable, and maintainable way.

## Terraform File Architecture

Below is a visual representation of the Terraform file architecture:

![Terraform File Architecture](Terraform%20File%20Architecture.drawio.png)
