resource "aws_ecs_cluster" "this" {
  name = var.cluster_name
}

resource "aws_launch_template" "ecs_instance" {
  name_prefix   = "${var.cluster_name}-lt"
  image_id      = data.aws_ami.ecs_ami.id
  instance_type = var.instance_type
  key_name      = var.key_pair
  iam_instance_profile {
    name = var.instance_profile_name
  }
  user_data = base64encode(templatefile("${path.module}/ecs_user_data.sh", {
    cluster_name = var.cluster_name
  }))
  vpc_security_group_ids = var.sg_ids

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = var.ebs_volume_size
      volume_type = "gp2"
    }
  }
}

resource "aws_autoscaling_group" "ecs_asg" {
  name                      = "${var.cluster_name}-asg"
  desired_capacity          = var.asg_desired
  max_size                  = var.asg_max
  min_size                  = var.asg_min
  vpc_zone_identifier       = var.subnet_ids
  health_check_type         = "EC2"
  launch_template {
    id      = aws_launch_template.ecs_instance.id
    version = "$Latest"
  }
  tag {
    key                 = "AmazonECSManaged"
    value               = "true"
    propagate_at_launch = true
  }
}

data "aws_ami" "ecs_ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-ecs-hvm-*-x86_64-ebs"]
  }
}

resource "aws_ecs_task_definition" "this" {
  family                   = var.task_family
  requires_compatibilities = ["EC2"]
  network_mode            = "bridge"
  cpu                     = "2048"
  memory                  = "3072"
  execution_role_arn      = var.execution_role_arn

  container_definitions = jsonencode([
    {
      name      = "app",
      image     = var.app_image,
      essential = true,
      portMappings = [{
        containerPort = 80,
        hostPort      = 80,
        protocol      = "tcp"
      }],
      environment = [
        { name = "RAILS_ENV", value = "production" },
        { name = "DB_USER", value = var.db_user },
        { name = "DB_PASSWORD", value = var.db_password },
        { name = "DB_HOST", value = var.db_host },
        { name = "DB_PORT", value = "5432" },
        { name = "DB_NAME", value = var.db_name },
        { name = "REDIS_URL", value = "redis://redis:6379/0" },
        { name = "RAILS_MASTER_KEY", value = var.rails_master_key },
        { name = "SECRET_KEY_BASE", value = var.secret_key_base }
      ],
      dependsOn = [
        {
          containerName = "redis",
          condition     = "START"
        }
      ]
    },
    {
      name      = "redis",
      image     = "redis:7",
      essential = false,
      portMappings = [{
        containerPort = 6379,
        hostPort      = 0
      }]
    }
  ])
}

resource "aws_ecs_service" "this" {
  name            = "${var.cluster_name}-service"
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.this.arn
  desired_count   = 1
  launch_type     = "EC2"

  deployment_controller {
    type = "ECS"
  }

  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }

  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200
  ordered_placement_strategy {
    type  = "spread"
    field = "attribute:ecs.availability-zone"
  }
}
