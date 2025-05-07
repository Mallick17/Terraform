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

---

## Script to Create CloudFront as S3 Origin
```hcl
provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "mallick-static-site-site"
}

resource "aws_cloudfront_origin_access_control" "oac" {
  name                              = "my-oac"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "my_distribution" {
  origin {
    domain_name              = aws_s3_bucket.my_bucket.bucket_regional_domain_name
    origin_id                = "S3Origin"
    origin_access_control_id = aws_cloudfront_origin_access_control.oac.id
  }

  enabled             = true
  default_root_object = "index.html"

  default_cache_behavior {
    target_origin_id       = "S3Origin"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
```

<details>
   <summary>State File of the Created and Running Resource</summary>

root@ip-172-31-37-110:~/tf-cloudfront# cat terraform.tfstate
```hcl
{
  "version": 4,
  "terraform_version": "1.11.2",
  "serial": 17,
  "lineage": "7ed73276-fab1-94e4-0276-232cad1c6343",
  "outputs": {},
  "resources": [
    {
      "mode": "managed",
      "type": "aws_cloudfront_distribution",
      "name": "my_distribution",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "aliases": null,
            "arn": "arn:aws:cloudfront::339713104321:distribution/E1HJW91BESZVRX",
            "caller_reference": "terraform-20250321072328494700000001",
            "comment": null,
            "continuous_deployment_policy_id": "",
            "custom_error_response": [],
            "default_cache_behavior": [
              {
                "allowed_methods": [
                  "GET",
                  "HEAD"
                ],
                "cache_policy_id": "",
                "cached_methods": [
                  "GET",
                  "HEAD"
                ],
                "compress": false,
                "default_ttl": 0,
                "field_level_encryption_id": "",
                "forwarded_values": [
                  {
                    "cookies": [
                      {
                        "forward": "none",
                        "whitelisted_names": []
                      }
                    ],
                    "headers": [],
                    "query_string": false,
                    "query_string_cache_keys": []
                  }
                ],
                "function_association": [],
                "grpc_config": [
                  {
                    "enabled": false
                  }
                ],
                "lambda_function_association": [],
                "max_ttl": 0,
                "min_ttl": 0,
                "origin_request_policy_id": "",
                "realtime_log_config_arn": "",
                "response_headers_policy_id": "",
                "smooth_streaming": false,
                "target_origin_id": "S3Origin",
                "trusted_key_groups": [],
                "trusted_signers": [],
                "viewer_protocol_policy": "redirect-to-https"
              }
            ],
            "default_root_object": "index.html",
            "domain_name": "d2p3jca5q3a57g.cloudfront.net",
            "enabled": true,
            "etag": "E3QPYCS434NFK9",
            "hosted_zone_id": "Z2FDTNDATAQYW2",
            "http_version": "http2",
            "id": "E1HJW91BESZVRX",
            "in_progress_validation_batches": 0,
            "is_ipv6_enabled": false,
            "last_modified_time": "2025-03-21 07:23:28.652 +0000 UTC",
            "logging_config": [],
            "ordered_cache_behavior": [],
            "origin": [
              {
                "connection_attempts": 3,
                "connection_timeout": 10,
                "custom_header": [],
                "custom_origin_config": [],
                "domain_name": "mallick-static-site-site.s3.ap-south-1.amazonaws.com",
                "origin_access_control_id": "EU0XO07QTDGCV",
                "origin_id": "S3Origin",
                "origin_path": "",
                "origin_shield": [],
                "s3_origin_config": [],
                "vpc_origin_config": []
              }
            ],
            "origin_group": [],
            "price_class": "PriceClass_All",
            "restrictions": [
              {
                "geo_restriction": [
                  {
                    "locations": [],
                    "restriction_type": "none"
                  }
                ]
              }
            ],
            "retain_on_delete": false,
            "staging": false,
            "status": "Deployed",
            "tags": null,
            "tags_all": {},
            "trusted_key_groups": [
              {
                "enabled": false,
                "items": []
              }
            ],
            "trusted_signers": [
              {
                "enabled": false,
                "items": []
              }
            ],
            "viewer_certificate": [
              {
                "acm_certificate_arn": "",
                "cloudfront_default_certificate": true,
                "iam_certificate_id": "",
                "minimum_protocol_version": "TLSv1",
                "ssl_support_method": ""
              }
            ],
            "wait_for_deployment": true,
            "web_acl_id": ""
          },
          "sensitive_attributes": [],
          "private": "eyJzY2hlbWFfdmVyc2lvbiI6IjEifQ==",
          "dependencies": [
            "aws_cloudfront_origin_access_control.oac",
            "aws_s3_bucket.my_bucket"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_cloudfront_origin_access_control",
      "name": "oac",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "arn": "arn:aws:cloudfront::339713104321:origin-access-control/EU0XO07QTDGCV",
            "description": "Managed by Terraform",
            "etag": "ETVPDKIKX0DER",
            "id": "EU0XO07QTDGCV",
            "name": "my-oac",
            "origin_access_control_origin_type": "s3",
            "signing_behavior": "always",
            "signing_protocol": "sigv4"
          },
          "sensitive_attributes": [],
          "private": "bnVsbA=="
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_s3_bucket",
      "name": "my_bucket",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "acceleration_status": "",
            "acl": null,
            "arn": "arn:aws:s3:::mallick-static-site-site",
            "bucket": "mallick-static-site-site",
            "bucket_domain_name": "mallick-static-site-site.s3.amazonaws.com",
            "bucket_prefix": "",
            "bucket_regional_domain_name": "mallick-static-site-site.s3.ap-south-1.amazonaws.com",
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
            "id": "mallick-static-site-site",
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
    }
  ],
  "check_results": null
}

```

</details>

- After `terraform destroy` command is given `terraform.tfstate.backup` file is created.

<details>
   <summary>terraform.tfstate.backup File of the Created and Running Resource</summary>

root@ip-172-31-37-110:~/tf-cloudfront# cat terraform.tfstate.backup
```hcl
{
  "version": 4,
  "terraform_version": "1.11.2",
  "serial": 9,
  "lineage": "7ed73276-fab1-94e4-0276-232cad1c6343",
  "outputs": {},
  "resources": [
    {
      "mode": "managed",
      "type": "aws_cloudfront_distribution",
      "name": "my_distribution",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "aliases": null,
            "arn": "arn:aws:cloudfront::339713104321:distribution/E2U9Z284705EYC",
            "caller_reference": "terraform-20250321052615225200000001",
            "comment": null,
            "continuous_deployment_policy_id": "",
            "custom_error_response": [],
            "default_cache_behavior": [
              {
                "allowed_methods": [
                  "GET",
                  "HEAD"
                ],
                "cache_policy_id": "",
                "cached_methods": [
                  "GET",
                  "HEAD"
                ],
                "compress": false,
                "default_ttl": 0,
                "field_level_encryption_id": "",
                "forwarded_values": [
                  {
                    "cookies": [
                      {
                        "forward": "none",
                        "whitelisted_names": []
                      }
                    ],
                    "headers": [],
                    "query_string": false,
                    "query_string_cache_keys": []
                  }
                ],
                "function_association": [],
                "grpc_config": [
                  {
                    "enabled": false
                  }
                ],
                "lambda_function_association": [],
                "max_ttl": 0,
                "min_ttl": 0,
                "origin_request_policy_id": "",
                "realtime_log_config_arn": "",
                "response_headers_policy_id": "",
                "smooth_streaming": false,
                "target_origin_id": "S3Origin",
                "trusted_key_groups": [],
                "trusted_signers": [],
                "viewer_protocol_policy": "redirect-to-https"
              }
            ],
            "default_root_object": "index.html",
            "domain_name": "d3ma64atow6zys.cloudfront.net",
            "enabled": true,
            "etag": "E1PZ26F66FLG7A",
            "hosted_zone_id": "Z2FDTNDATAQYW2",
            "http_version": "http2",
            "id": "E2U9Z284705EYC",
            "in_progress_validation_batches": 0,
            "is_ipv6_enabled": false,
            "last_modified_time": "2025-03-21 05:26:15.385 +0000 UTC",
            "logging_config": [],
            "ordered_cache_behavior": [],
            "origin": [
              {
                "connection_attempts": 3,
                "connection_timeout": 10,
                "custom_header": [],
                "custom_origin_config": [],
                "domain_name": "mallick-static-site-site.s3.ap-south-1.amazonaws.com",
                "origin_access_control_id": "E2IJJQS2ZSO1YH",
                "origin_id": "S3Origin",
                "origin_path": "",
                "origin_shield": [],
                "s3_origin_config": [],
                "vpc_origin_config": []
              }
            ],
            "origin_group": [],
            "price_class": "PriceClass_All",
            "restrictions": [
              {
                "geo_restriction": [
                  {
                    "locations": [],
                    "restriction_type": "none"
                  }
                ]
              }
            ],
            "retain_on_delete": false,
            "staging": false,
            "status": "Deployed",
            "tags": null,
            "tags_all": {},
            "trusted_key_groups": [
              {
                "enabled": false,
                "items": []
              }
            ],
            "trusted_signers": [
              {
                "enabled": false,
                "items": []
              }
            ],
            "viewer_certificate": [
              {
                "acm_certificate_arn": "",
                "cloudfront_default_certificate": true,
                "iam_certificate_id": "",
                "minimum_protocol_version": "TLSv1",
                "ssl_support_method": ""
              }
            ],
            "wait_for_deployment": true,
            "web_acl_id": ""
          },
          "sensitive_attributes": [],
          "private": "eyJzY2hlbWFfdmVyc2lvbiI6IjEifQ==",
          "dependencies": [
            "aws_cloudfront_origin_access_control.oac",
            "aws_s3_bucket.my_bucket"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_cloudfront_origin_access_control",
      "name": "oac",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "arn": "arn:aws:cloudfront::339713104321:origin-access-control/E2IJJQS2ZSO1YH",
            "description": "Managed by Terraform",
            "etag": "ETVPDKIKX0DER",
            "id": "E2IJJQS2ZSO1YH",
            "name": "my-oac",
            "origin_access_control_origin_type": "s3",
            "signing_behavior": "always",
            "signing_protocol": "sigv4"
          },
          "sensitive_attributes": [],
          "private": "bnVsbA=="
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_s3_bucket",
      "name": "my_bucket",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "acceleration_status": "",
            "acl": null,
            "arn": "arn:aws:s3:::mallick-static-site-site",
            "bucket": "mallick-static-site-site",
            "bucket_domain_name": "mallick-static-site-site.s3.amazonaws.com",
            "bucket_prefix": "",
            "bucket_regional_domain_name": "mallick-static-site-site.s3.ap-south-1.amazonaws.com",
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
            "id": "mallick-static-site-site",
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
    }
  ],
  "check_results": null
}
```

</details>

## Script to create Launch Template, Auto Scaling Group and ECS Cluster
- `root@ip-172-31-10-86:~/terraform# cat main.tf`
```hcl
module "ecs_infra" {
  source               = "./modules/ecs_cluster_with_asg"
  name_prefix          = "gyan"
  instance_type        = "t3.micro"
  key_name             = "Myops"
  instance_profile_name = "ecsInstanceRole"
  min_size             = 1
  max_size             = 2
  desired_capacity     = 1
}
```


- `root@ip-172-31-10-86:~/terraform# cat modules/ecs_cluster_with_asg/main.tf`
```hcl
data "aws_ssm_parameter" "ecs_ami" {
  name = "/aws/service/ecs/optimized-ami/amazon-linux-2/recommended/image_id"
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

resource "aws_security_group" "ecs" {
  name        = "${var.name_prefix}-asg-sg"
  description = "Allow all outbound"
  vpc_id      = data.aws_vpc.default.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_ecs_cluster" "this" {
  name = "${var.name_prefix}-cluster"
}

resource "aws_launch_template" "ecs" {
  name_prefix   = "${var.name_prefix}-lt-"
  image_id      = data.aws_ssm_parameter.ecs_ami.value
  instance_type = var.instance_type
  key_name      = var.key_name

  iam_instance_profile {
    name = var.instance_profile_name
  }

  user_data = base64encode(<<-EOF
    #!/bin/bash
    echo ECS_CLUSTER=${var.name_prefix}-cluster >> /etc/ecs/ecs.config
  EOF
  )

  vpc_security_group_ids = [aws_security_group.ecs.id]
}

resource "aws_autoscaling_group" "ecs" {
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  min_size             = var.min_size
  vpc_zone_identifier  = data.aws_subnets.default.ids

  launch_template {
    id      = aws_launch_template.ecs.id
    version = "$Latest"
  }

  protect_from_scale_in = true

  tag {
    key                 = "Name"
    value               = "${var.name_prefix}-asg-instance"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_ecs_capacity_provider" "asg_provider" {
  name = "${var.name_prefix}-capacity-provider"

  auto_scaling_group_provider {
    auto_scaling_group_arn         = aws_autoscaling_group.ecs.arn
    managed_termination_protection = "ENABLED"

    managed_scaling {
      status                    = "ENABLED"
      target_capacity           = 100
      minimum_scaling_step_size = 1
      maximum_scaling_step_size = 100
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_ecs_cluster_capacity_providers" "attach" {
  cluster_name = aws_ecs_cluster.this.name

  capacity_providers = [aws_ecs_capacity_provider.asg_provider.name]

  default_capacity_provider_strategy {
    capacity_provider = aws_ecs_capacity_provider.asg_provider.name
    weight            = 1
    base              = 1
  }
}

output "cluster_name" {
  value = aws_ecs_cluster.this.name
}
```

- `root@ip-172-31-10-86:~/terraform# cat modules/ecs_cluster_with_asg/variables.tf`
```hcl
variable "name_prefix" {
  type        = string
  description = "Prefix for naming ECS cluster and related resources"
}

#variable "ami_id" {
#  type        = string
#  description = "AMI ID (ECS-optimized Amazon Linux 2)"
#}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "EC2 instance type"
}

variable "key_name" {
  type        = string
  description = "EC2 Key Pair name"
}

variable "instance_profile_name" {
  type        = string
  description = "IAM Instance Profile name (ecsInstanceRole)"
}

variable "min_size" {
  type        = number
  default     = 1
}

variable "max_size" {
  type        = number
  default     = 2
}

variable "desired_capacity" {
  type        = number
  default     = 1
}
```
