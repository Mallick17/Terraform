# Terraform Scripts
Terraform scripts are written in HashiCorp Configuration Language (HCL) and are used to define infrastructure resources. Terraform is an infrastructure as code (IaC) tool that helps users build, manage, and version cloud and on-premises resources.
### How Terraform scripts work
- Users describe the infrastructure they want in Terraform code.
- Terraform uses the declarative language to create the infrastructure.
- Terraform can work with many different cloud platforms and on-premises environments.
- Terraform can manage low-level components like storage, compute, and networking resources.
- Terraform can also manage high-level components like SaaS features and DNS entries.
### Why use Terraform scripts
- Terraform can help streamline infrastructure management, reduce human error, and increase efficiency.
- Terraform can help teams collaborate and be more accountable.
- Terraform can help teams build and manage resources in parallel across different providers.

## Script to Create EC2 Instance in AWS
```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "ap-south-1"
}

resource "aws_instance" "mallick_server" {
  ami           = "ami-0f2ce9ce760bd7133"
  instance_type = "t2.micro"

  tags = {
    Name = "MallickAppServerInstance"
  }
}
```

<details>
   <summary>State File of the Created and Running Resource</summary>

root@ip-172-31-4-247:~/tf-ec2# cat terraform.tfstate
```hcl
{
  "version": 4,
  "terraform_version": "1.11.1",
  "serial": 1,
  "lineage": "099bc8e2-68f5-ee73-b9b5-9726900bf1d3",
  "outputs": {},
  "resources": [
    {
      "mode": "managed",
      "type": "aws_instance",
      "name": "mallick_server",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "ami": "ami-0f2ce9ce760bd7133",
            "arn": "arn:aws:ec2:ap-south-1:339713104321:instance/i-0933d0abda0ba6d36",
            "associate_public_ip_address": true,
            "availability_zone": "ap-south-1a",
            "capacity_reservation_specification": [
              {
                "capacity_reservation_preference": "open",
                "capacity_reservation_target": []
              }
            ],
            "cpu_core_count": 1,
            "cpu_options": [
              {
                "amd_sev_snp": "",
                "core_count": 1,
                "threads_per_core": 1
              }
            ],
            "cpu_threads_per_core": 1,
            "credit_specification": [
              {
                "cpu_credits": "standard"
              }
            ],
            "disable_api_stop": false,
            "disable_api_termination": false,
            "ebs_block_device": [],
            "ebs_optimized": false,
            "enclave_options": [
              {
                "enabled": false
              }
            ],
            "ephemeral_block_device": [],
            "get_password_data": false,
            "hibernation": false,
            "host_id": "",
            "host_resource_group_arn": null,
            "iam_instance_profile": "",
            "id": "i-0933d0abda0ba6d36",
            "instance_initiated_shutdown_behavior": "stop",
            "instance_state": "running",
            "instance_type": "t2.micro",
            "ipv6_address_count": 0,
            "ipv6_addresses": [],
            "key_name": "",
            "launch_template": [],
            "maintenance_options": [
              {
                "auto_recovery": "default"
              }
            ],
            "metadata_options": [
              {
                "http_endpoint": "enabled",
                "http_put_response_hop_limit": 1,
                "http_tokens": "optional",
                "instance_metadata_tags": "disabled"
              }
            ],
            "monitoring": false,
            "network_interface": [],
            "outpost_arn": "",
            "password_data": "",
            "placement_group": "",
            "placement_partition_number": 0,
            "primary_network_interface_id": "eni-040bd93ddb7d877de",
            "private_dns": "ip-172-31-46-193.ap-south-1.compute.internal",
            "private_dns_name_options": [
              {
                "enable_resource_name_dns_a_record": false,
                "enable_resource_name_dns_aaaa_record": false,
                "hostname_type": "ip-name"
              }
            ],
            "private_ip": "172.31.46.193",
            "public_dns": "ec2-13-235-2-21.ap-south-1.compute.amazonaws.com",
            "public_ip": "13.235.2.21",
            "root_block_device": [
              {
                "delete_on_termination": true,
                "device_name": "/dev/xvda",
                "encrypted": false,
                "iops": 100,
                "kms_key_id": "",
                "tags": {},
                "throughput": 0,
                "volume_id": "vol-0574be34402816829",
                "volume_size": 8,
                "volume_type": "gp2"
              }
            ],
            "secondary_private_ips": [],
            "security_groups": [
              "default"
            ],
            "source_dest_check": true,
            "subnet_id": "subnet-0738b2e70f37fe442",
            "tags": {
              "Name": "MallickAppServerInstance"
            },
            "tags_all": {
              "Name": "MallickAppServerInstance"
            },
            "tenancy": "default",
            "timeouts": null,
            "user_data": null,
            "user_data_base64": null,
            "user_data_replace_on_change": false,
            "volume_tags": null,
            "vpc_security_group_ids": [
              "sg-0a35e9086b143cac5"
            ]
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMCwidXBkYXRlIjo2MDAwMDAwMDAwMDB9LCJzY2hlbWFfdmVyc2lvbiI6IjEifQ=="
        }
      ]
    }
  ],
  "check_results": null
}
```
   
</details>

- After `terraform destroy` command is given `terraform.tfstate.backup` file is created.
## Script to Create S3 Bucket in AWS
```hcl


