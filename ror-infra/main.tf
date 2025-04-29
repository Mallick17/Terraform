provider "aws" {
  region = "ap-south-1"
}

module "rds" {
  source        = "./modules/rds"
  db_name       = "final-ror-db"
  db_username   = "myuser"
  db_password   = "mypassword"
  vpc_id        = "vpc-02853bd379618f5ca"
  subnet_ids    = [
    "subnet-0738b2e70f37fe442",
    "subnet-04cf194b656ad564e",
    "subnet-03b17848527227137"
  ]
  sg_ids        = ["sg-0a35e9086b143cac5"]
}

module "ecr" {
  source           = "./modules/ecr"
  repository_name  = "final-ror-ecr"
}

module "codebuild" {
  source            = "./modules/codebuild"
  project_name      = "final-ror-codebuild"
  repo_url          = "https://github.com/Mallick17/ROR-AWS-ECS"
  service_role_arn  = "arn:aws:iam::339713104321:role/codebuild-ror-app-role"
  ecr_repo_url      = module.ecr.repository_url
}

module "ecs" {
  source = "./modules/ecs"

  cluster_name            = "final-ror-cluster"
  task_family             = "final-ror-task-definition"
  service_name            = "final-ror-cluster-service"
  task_execution_role_arn = "arn:aws:iam::339713104321:role/ecsTaskExecutionRole"
  app_image               = "${module.ecr.repository_url}:latest"

  db_user           = "myuser"
  db_password       = "mypassword"
  db_host           = module.rds.db_endpoint
  db_port           = "5432"
  db_name           = "final-ror-db"
  redis_url         = "redis://redis:6379/0"
  rails_master_key  = "c3ca922688d4bf22ac7fe38430dd8849"
  secret_key_base   = "600f21de02355f788c759ff862a2cb22ba84ccbf072487992f4c2c49ae260f

