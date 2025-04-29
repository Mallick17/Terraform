variable "db_name" {}
variable "db_username" {}
variable "db_password" {}
variable "vpc_id" {}
variable "subnet_ids" { type = list(string) }
variable "sg_ids" { type = list(string) }
