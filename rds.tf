resource "aws_db_instance" "auth_rds" {
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = "15.3"
  instance_class         = "db.t3.micro"
  name                   = "authdb"
  username               = "admin"
  password               = "securepassword"
  publicly_accessible    = true
  vpc_security_group_ids = [aws_security_group.auth_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.auth_subnet_group.name
  tags = {
    Environment = var.environment
    Name        = "Users Database"
  }
}

resource "aws_security_group" "auth_sg" {
  vpc_id = aws_vpc.main.id
  tags   = merge({ Name = "Auth Security Group" })
}

resource "aws_db_subnet_group" "auth_subnet_group" {
  name       = "auth-db-subnet-group"
  subnet_ids = [aws_subnet.public.id]
  tags       = merge({ Name = "Auth DB Subnet Group" })
}
