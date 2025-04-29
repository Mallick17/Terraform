variable "cluster_name" {}
variable "instance_type" {}
variable "asg_min" {}
variable "asg_max" {}
variable "asg_desired" {}
variable "key_pair" {}
variable "instance_profile_name" {}
variable "subnet_ids" { type = list(string) }
variable "sg_ids" { type = list(string) }

# Task config
variable "task_family" {}
variable "execution_role_arn" {}
variable "app_image" {}

# App env vars
variable "db_user" {}
variable "db_password" {}
variable "db_host" {}
variable "db_name" {}
variable "rails_master_key" {}
variable "secret_key_base" {}
variable "ebs_volume_size" { default = 30 }
