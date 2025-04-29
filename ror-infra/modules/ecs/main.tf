resource "aws_ecs_cluster" "this" {
  name = var.cluster_name
}

resource "aws_ecs_task_definition" "this" {
  family                   = var.task_family
  requires_compatibilities = ["EC2"]
  network_mode            = "bridge"
  cpu                     = "2048"
  memory                  = "3072"
  execution_role_arn      = var.task_execution_role_arn

  container_definitions = jsonencode([
    {
      name      = "app"
      image     = var.app_image
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
      environment = [
        { name = "RAILS_ENV",         value = "production" },
        { name = "DB_USER",           value = var.db_user },
        { name = "DB_PASSWORD",       value = var.db_password },
        { name = "DB_HOST",           value = var.db_host },
        { name = "DB_PORT",           value = var.db_port },
        { name = "DB_NAME",           value = var.db_name },
        { name = "REDIS_URL",         value = var.redis_url },
        { name = "RAILS_MASTER_KEY",  value = var.rails_master_key },
        { name = "SECRET_KEY_BASE",   value = var.secret_key_base }
      ],
      dependsOn = [{ containerName = "redis", condition = "START" }]
    },
    {
      name      = "redis"
      image     = "redis:7"
      essential = false
      portMappings = [
        {
          containerPort = 6379

