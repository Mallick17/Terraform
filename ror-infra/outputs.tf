output "ecr_repository_url" {
  value = module.ecr.repository_url
}

output "codebuild_project" {
  value = module.codebuild.project_name
}

