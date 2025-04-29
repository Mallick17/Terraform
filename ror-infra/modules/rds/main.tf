resource "aws_db_instance" "this" {
  identifier             = var.db_name
  engine                 = "postgres"
  engine_version         = "17.2"
  instance_class         = "db.t4g.micro"
  allocated_storage      = 20
  storage_type           = "gp2"
  username               = var.db_username
  password               = var.db_password
  db_name                = var.db_name
  publicly_accessible    = false
  vpc_security_group_ids = var.sg_ids
  db_subnet_group_name   = aws_db_subnet_group.this.name
  skip_final_snapshot    = true
  performance_insights_enabled = true
}

resource "aws_db_subnet_group" "this" {
  name       = "${var.db_name}-subnet-group"
  subnet_ids = var.subnet_ids
}

output "db_endpoint" {
  value = aws_db_instance.this.endpoint
}
