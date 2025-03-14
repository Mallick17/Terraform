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
### `terraform.state` vs `terraform.tfstate.backup`

| **Feature**               | **terraform.tfstate**                              | **terraform.tfstate.backup**                    |
|---------------------------|----------------------------------------------------|-------------------------------------------------|
| **Purpose**                | Current state file                                 | Backup of the state file                        |
| **When is it created?**    | Created automatically when you run `terraform apply` for the first time | Created automatically before Terraform makes any changes to the state file |
| **When is it updated?**    | Updated every time you run `terraform apply`       | Overwritten every time Terraform makes changes to the state file |
| **Where is it stored?**    | Stored in the same directory as your Terraform configuration files | Stored in the same directory as the state file  |

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
  
<details>
   <summary>terraform.tfstate.backup File of the Created and Running Resource</summary>

root@ip-172-31-4-247:~/tf-ec2# cat terraform.tfstate.backup
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

---

## Script to Create S3 Bucket in AWS
```hcl
provider "aws" {
  region = "ap-south-1"  # Region set to ap-south-1 (Mumbai)
}

resource "aws_s3_bucket" "mallick_bucket" {
  bucket = "demo-terra-bucket-123456"  # Change to your desired bucket name
}

# Use aws_s3_bucket_versioning to enable versioning
resource "aws_s3_bucket_versioning" "mallick_bucket_versioning" {
  bucket = aws_s3_bucket.mallick_bucket.bucket

  versioning_configuration {
    status = "Enabled"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.mallick_bucket.bucket
}

```

<details>
   <summary>State File of the Created and Running Resource</summary>

root@ip-172-31-4-247:~/tf-s3# cat terraform.tfstate
```hcl
{
  "version": 4,
  "terraform_version": "1.11.1",
  "serial": 12,
  "lineage": "86a4b7d1-94d8-6b1d-65f7-a299e9c7acf8",
  "outputs": {
    "bucket_name": {
      "value": "demo-terra-bucket-123456",
      "type": "string"
    }
  },
  "resources": [
    {
      "mode": "managed",
      "type": "aws_s3_bucket",
      "name": "mallick_bucket",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "acceleration_status": "",
            "acl": null,
            "arn": "arn:aws:s3:::demo-terra-bucket-123456",
            "bucket": "demo-terra-bucket-123456",
            "bucket_domain_name": "demo-terra-bucket-123456.s3.amazonaws.com",
            "bucket_prefix": "",
            "bucket_regional_domain_name": "demo-terra-bucket-123456.s3.ap-south-1.amazonaws.com",
            "cors_rule": [],
            "force_destroy": false,
            "grant": [
              {
                "id": "852b3ddbb7b9294824a2ececf0387cf0a9f734163b58d96287cd6e4d45fd6ab0",
                "permissions": [
                  "FULL_CONTROL"
                ],
                "type": "CanonicalUser",
                "uri": ""
              }
            ],
            "hosted_zone_id": "Z11RGJOFQNVJUP",
            "id": "demo-terra-bucket-123456",
            "lifecycle_rule": [],
            "logging": [],
            "object_lock_configuration": [],
            "object_lock_enabled": false,
            "policy": "",
            "region": "ap-south-1",
            "replication_configuration": [],
            "request_payer": "BucketOwner",
            "server_side_encryption_configuration": [
              {
                "rule": [
                  {
                    "apply_server_side_encryption_by_default": [
                      {
                        "kms_master_key_id": "",
                        "sse_algorithm": "AES256"
                      }
                    ],
                    "bucket_key_enabled": false
                  }
                ]
              }
            ],
            "tags": null,
            "tags_all": {},
            "timeouts": null,
            "versioning": [
              {
                "enabled": false,
                "mfa_delete": false
              }
            ],
            "website": [],
            "website_domain": null,
            "website_endpoint": null
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxMjAwMDAwMDAwMDAwLCJkZWxldGUiOjM2MDAwMDAwMDAwMDAsInJlYWQiOjEyMDAwMDAwMDAwMDAsInVwZGF0ZSI6MTIwMDAwMDAwMDAwMH19"
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_s3_bucket_versioning",
      "name": "mallick_bucket_versioning",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "bucket": "demo-terra-bucket-123456",
            "expected_bucket_owner": "",
            "id": "demo-terra-bucket-123456",
            "mfa": null,
            "versioning_configuration": [
              {
                "mfa_delete": "",
                "status": "Enabled"
              }
            ]
          },
          "sensitive_attributes": [],
          "private": "bnVsbA==",
          "dependencies": [
            "aws_s3_bucket.mallick_bucket"
          ]
        }
      ]
    }
  ],
  "check_results": null
}
```
   
</details>

- After `terraform destroy` command is given `terraform.tfstate.backup` file is created.
  
<details>
   <summary>terraform.tfstate.backup File of the Created and Running Resource</summary>

root@ip-172-31-4-247:~/tf-s3# cat terraform.tfstate.backup
```hcl
{
  "version": 4,
  "terraform_version": "1.11.1",
  "serial": 9,
  "lineage": "86a4b7d1-94d8-6b1d-65f7-a299e9c7acf8",
  "outputs": {},
  "resources": [],
  "check_results": null
}

```

</details>   

---

## Script to Create IAM Roles & Policies in AWS
```hcl
provider "aws" {
  region = "ap-south-1"  # Region set to ap-south-1 (Mumbai)
}

# Create an IAM Policy
resource "aws_iam_policy" "mallick_policy" {
  name        = "mallick-policy"
  description = "A policy that grants basic S3 permissions"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["s3:ListBucket", "s3:GetObject"]
        Resource = [
          "arn:aws:s3:::demo-terra-bucket-123456",
          "arn:aws:s3:::demo-terra-bucket-123456/*"
        ]
      },
      {
        Effect   = "Allow"
        Action   = "s3:PutObject"
        Resource = "arn:aws:s3:::demo-terra-bucket-123456/*"
      }
    ]
  })
}

# Create an IAM Role
resource "aws_iam_role" "mallick_role" {
  name               = "mallick-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"  # EC2 can assume this role
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach the IAM Policy to the Role
resource "aws_iam_role_policy_attachment" "mallick_role_policy_attachment" {
  policy_arn = aws_iam_policy.mallick_policy.arn
  role       = aws_iam_role.mallick_role.name
}

output "role_name" {
  value = aws_iam_role.mallick_role.name
}

output "policy_name" {
  value = aws_iam_policy.mallick_policy.name
}

```

<details>
   <summary>State File of the Created and Running Resource</summary>

root@ip-172-31-4-247:~/tf-iam# cat terraform.tfstate
```hcl
{
  "version": 4,
  "terraform_version": "1.11.1",
  "serial": 4,
  "lineage": "4e94e2a0-2d4e-f92d-627f-badc7fe5464c",
  "outputs": {
    "policy_name": {
      "value": "mallick-policy",
      "type": "string"
    },
    "role_name": {
      "value": "mallick-role",
      "type": "string"
    }
  },
  "resources": [
    {
      "mode": "managed",
      "type": "aws_iam_policy",
      "name": "mallick_policy",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "arn": "arn:aws:iam::339713104321:policy/mallick-policy",
            "attachment_count": 0,
            "description": "A policy that grants basic S3 permissions",
            "id": "arn:aws:iam::339713104321:policy/mallick-policy",
            "name": "mallick-policy",
            "name_prefix": "",
            "path": "/",
            "policy": "{\"Statement\":[{\"Action\":[\"s3:ListBucket\",\"s3:GetObject\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::demo-terra-bucket-123456\",\"arn:aws:s3:::demo-terra-bucket-123456/*\"]},{\"Action\":\"s3:PutObject\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:s3:::demo-terra-bucket-123456/*\"}],\"Version\":\"2012-10-17\"}",
            "policy_id": "ANPAU6GD2THAZ2IYO2TF5",
            "tags": null,
            "tags_all": {}
          },
          "sensitive_attributes": [],
          "private": "bnVsbA=="
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_iam_role",
      "name": "mallick_role",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "arn": "arn:aws:iam::339713104321:role/mallick-role",
            "assume_role_policy": "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ec2.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}",
            "create_date": "2025-03-12T07:40:00Z",
            "description": "",
            "force_detach_policies": false,
            "id": "mallick-role",
            "inline_policy": [],
            "managed_policy_arns": [],
            "max_session_duration": 3600,
            "name": "mallick-role",
            "name_prefix": "",
            "path": "/",
            "permissions_boundary": "",
            "tags": null,
            "tags_all": {},
            "unique_id": "AROAU6GD2THASP4LN5K4V"
          },
          "sensitive_attributes": [],
          "private": "bnVsbA=="
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_iam_role_policy_attachment",
      "name": "mallick_role_policy_attachment",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "id": "mallick-role-20250312074001913700000001",
            "policy_arn": "arn:aws:iam::339713104321:policy/mallick-policy",
            "role": "mallick-role"
          },
          "sensitive_attributes": [],
          "private": "bnVsbA==",
          "dependencies": [
            "aws_iam_policy.mallick_policy",
            "aws_iam_role.mallick_role"
          ]
        }
      ]
    }
  ],
  "check_results": null
}

```
   
</details>

- After `terraform destroy` command is given `terraform.tfstate.backup` file is created.
  
<details>
   <summary>terraform.tfstate.backup File of the Created and Running Resource</summary>

root@ip-172-31-4-247:~/tf-iam# cat terraform.tfstate.backup
```hcl
{
  "version": 4,
  "terraform_version": "1.11.1",
  "serial": 4,
  "lineage": "4e94e2a0-2d4e-f92d-627f-badc7fe5464c",
  "outputs": {
    "policy_name": {
      "value": "mallick-policy",
      "type": "string"
    },
    "role_name": {
      "value": "mallick-role",
      "type": "string"
    }
  },
  "resources": [
    {
      "mode": "managed",
      "type": "aws_iam_policy",
      "name": "mallick_policy",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "arn": "arn:aws:iam::339713104321:policy/mallick-policy",
            "attachment_count": 0,
            "description": "A policy that grants basic S3 permissions",
            "id": "arn:aws:iam::339713104321:policy/mallick-policy",
            "name": "mallick-policy",
            "name_prefix": "",
            "path": "/",
            "policy": "{\"Statement\":[{\"Action\":[\"s3:ListBucket\",\"s3:GetObject\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::demo-terra-bucket-123456\",\"arn:aws:s3:::demo-terra-bucket-123456/*\"]},{\"Action\":\"s3:PutObject\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:s3:::demo-terra-bucket-123456/*\"}],\"Version\":\"2012-10-17\"}",
            "policy_id": "ANPAU6GD2THAZ2IYO2TF5",
            "tags": null,
            "tags_all": {}
          },
          "sensitive_attributes": [],
          "private": "bnVsbA=="
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_iam_role",
      "name": "mallick_role",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "arn": "arn:aws:iam::339713104321:role/mallick-role",
            "assume_role_policy": "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ec2.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}",
            "create_date": "2025-03-12T07:40:00Z",
            "description": "",
            "force_detach_policies": false,
            "id": "mallick-role",
            "inline_policy": [],
            "managed_policy_arns": [],
            "max_session_duration": 3600,
            "name": "mallick-role",
            "name_prefix": "",
            "path": "/",
            "permissions_boundary": "",
            "tags": null,
            "tags_all": {},
            "unique_id": "AROAU6GD2THASP4LN5K4V"
          },
          "sensitive_attributes": [],
          "private": "bnVsbA=="
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_iam_role_policy_attachment",
      "name": "mallick_role_policy_attachment",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "id": "mallick-role-20250312074001913700000001",
            "policy_arn": "arn:aws:iam::339713104321:policy/mallick-policy",
            "role": "mallick-role"
          },
          "sensitive_attributes": [],
          "private": "bnVsbA==",
          "dependencies": [
            "aws_iam_policy.mallick_policy",
            "aws_iam_role.mallick_role"
          ]
        }
      ]
    }
  ],
  "check_results": null
}

```

</details>   
