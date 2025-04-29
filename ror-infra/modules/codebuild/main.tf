resource "aws_codebuild_project" "this" {
  name          = var.project_name
  description   = "Build and push Docker image for Ruby on Rails app"
  service_role  = var.service_role_arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:7.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = true
  }

  source {
    type            = "GITHUB"
    location        = var.repo_url
    git_clone_depth = 1
    buildspec       = "buildspec.yml"
  }

  source_version = "main"

  logs_config {
    cloudwatch_logs {
      status = "ENABLED"
    }
  }

  environment_variables = [
    {
      name

