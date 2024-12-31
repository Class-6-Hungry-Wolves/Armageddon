# database.tf

# DB Subnet Group
resource "aws_db_subnet_group" "medical" {
  provider    = aws.tokyo
  name        = "medical-subnet-group"
  description = "DB subnet group for medical application"
  subnet_ids  = aws_subnet.tokyo_private[*].id

  tags = {
    Name = "medical-db-subnet-group"
  }
}

# Security Group for Database
resource "aws_security_group" "db" {
  provider    = aws.tokyo
  name        = "medical-db-sg"
  description = "Security group for medical database"
  vpc_id      = aws_vpc.tokyo.id

  ingress {
    from_port       = 5432  # PostgreSQL port
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.web.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "medical-db-sg"
  }
}

# KMS Key for Database Encryption
resource "aws_kms_key" "db" {
  provider                = aws.tokyo
  description             = "KMS key for database encryption"
  deletion_window_in_days = 7
  enable_key_rotation     = true

  tags = {
    Name = "medical-db-key"
  }
}

# Aurora Cluster
resource "aws_rds_cluster" "medical" {
  provider                  = aws.tokyo
  cluster_identifier        = "medical-cluster"
  engine                   = "aurora-postgresql"
  engine_version           = "13.7"
  database_name            = "medical_records"
  master_username          = var.db_username
  master_password          = var.db_password
  backup_retention_period  = 7
  preferred_backup_window  = "03:00-04:00"
  db_subnet_group_name     = aws_db_subnet_group.medical.name
  vpc_security_group_ids   = [aws_security_group.db.id]
  storage_encrypted        = true
  kms_key_id              = aws_kms_key.db.arn
  skip_final_snapshot      = false
  final_snapshot_identifier = "medical-final-snapshot"
  
  serverlessv2_scaling_configuration {
    min_capacity = 0.5
    max_capacity = 16
  }

  tags = {
    Name = "medical-aurora-cluster"
  }
}

# Aurora Instance
resource "aws_rds_cluster_instance" "medical" {
  provider             = aws.tokyo
  count               = 2
  identifier          = "medical-instance-${count.index + 1}"
  cluster_identifier  = aws_rds_cluster.medical.id
  instance_class      = "db.serverless"
  engine             = aws_rds_cluster.medical.engine
  engine_version     = aws_rds_cluster.medical.engine_version

  tags = {
    Name = "medical-instance-${count.index + 1}"
  }
}

# Variables file (variables.tf)
variable "db_username" {
  description = "Database master username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Database master password"
  type        = string
  sensitive   = true
}

# Outputs file (outputs.tf)
output "db_endpoint" {
  description = "The endpoint of the database"
  value       = aws_rds_cluster.medical.endpoint
}

output "db_reader_endpoint" {
  description = "The reader endpoint of the database"
  value       = aws_rds_cluster.medical.reader_endpoint
}

output "db_port" {
  description = "The port of the database"
  value       = aws_rds_cluster.medical.port
}