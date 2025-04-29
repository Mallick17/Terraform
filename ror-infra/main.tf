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
