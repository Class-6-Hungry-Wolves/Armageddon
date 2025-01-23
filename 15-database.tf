# DB Subnet Group
# resource "aws_db_subnet_group" "medical" {
#   provider    = aws.Tokyo
#   name        = "medical-subnet-group"
#   description = "DB subnet group for medical application"
#   subnet_ids  = [aws_subnet.private-ap-northeast-1d-DB.id]

#   tags = {
#     Name = "medical-db-subnet-group"
#   }
# }

# Declare variables
# variable "db_username" {
#   description = "The master username for the database"
#   type        = string
# }

# variable "db_password" {
#   description = "The master password for the database"
#   type        = string
#   sensitive   = true  # Sensitive data, so it won't be displayed in logs
# }

locals {
  db_username = "tmmc_admin"
  db_password = "TMmc2024!SecureDB#1"
}

# Security Group for Database
resource "aws_security_group" "db" {
  provider    = aws.Tokyo
  name        = "medical-db-sg"
  description = "Security group for medical database"
  vpc_id      = aws_vpc.TMMC-Tokyo.id

  ingress {
    from_port   = 5432 # PostgreSQL port
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.TMMC-Tokyo.cidr_block]
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
  provider                = aws.Tokyo
  description             = "KMS key for database encryption"
  deletion_window_in_days = 7
  enable_key_rotation     = true

  tags = {
    Name = "medical-db-key"
  }
}

resource "aws_db_subnet_group" "medical_subnet_group" {
  provider = aws.Tokyo
  name     = "medical-subnet-group"
  subnet_ids = [aws_subnet.private-ap-northeast-1d-DB.id, aws_subnet.private-ap-northeast-1a.id,
  aws_subnet.private-ap-northeast-1c.id]
}

# Aurora Cluster
resource "aws_rds_cluster" "medical" {
  provider                  = aws.Tokyo
  cluster_identifier        = "medical-cluster"
  engine                    = "aurora-postgresql"
  engine_version            = "11.9"
  database_name             = "medical_records"
  master_username           = local.db_username
  master_password           = local.db_password
  backup_retention_period   = 7
  preferred_backup_window   = "03:00-04:00"
  db_subnet_group_name      = aws_db_subnet_group.medical_subnet_group.name
  vpc_security_group_ids    = [aws_security_group.db.id]
  storage_encrypted         = true
  kms_key_id                = aws_kms_key.db.arn
  skip_final_snapshot       = false
  final_snapshot_identifier = "medical-final-snapshot"

  tags = {
    Name = "medical-aurora-cluster"
  }
}

# Aurora Instance
resource "aws_rds_cluster_instance" "medical" {
  provider           = aws.Tokyo
  count              = 2
  identifier         = "medical-instance-${count.index + 1}"
  cluster_identifier = aws_rds_cluster.medical.id
  instance_class     = "db.r5.large"
  engine             = aws_rds_cluster.medical.engine
  engine_version     = aws_rds_cluster.medical.engine_version

  tags = {
    Name = "medical-instance-${count.index + 1}"
  }
}
