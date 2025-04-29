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
  source                = "./modules/ecs"
  cluster_name          = "final-ror-cluster"
  instance_type         = "t3.medium"
  key_pair              = "Myops"
  instance_profile_name = "ecsInstanceRole"
  subnet_ids            = ["subnet-0738b2e70f37fe442", "subnet-04cf194b656ad564e", "subnet-03b17848527227137"]
  sg_ids                = ["sg-0a35e9086b143cac5"]
  asg_min               = 1
  asg_max               = 5
  asg_desired           = 1

  task_family           = "final-ror-task-definition"
  execution_role_arn    = "arn:aws:iam::339713104321:role/ecsTaskExecutionRole"
  app_image             = "339713104321.dkr.ecr.ap-south-1.amazonaws.com/mallow-ror-app"

  db_user               = "myuser"
  db_password           = "mypassword"
  db_host               = "ror-chat-app.c342ea4cs6ny.ap-south-1.rds.amazonaws.com"
  db_name               = "ror-chat-app"
  rails_master_key      = "c3ca922688d4bf22ac7fe38430dd8849"
  secret_key_base       = "600f21de02355f788c759ff862a2cb22ba84ccbf072487992f4c2c49ae260f87c7593a1f5f6cf2e45457c76994779a8b30014ee9597e35a2818ca91e33bb7233"
}
