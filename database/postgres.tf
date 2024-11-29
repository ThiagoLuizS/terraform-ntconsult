resource "aws_db_subnet_group" "ntconsult" {
  name       = var.db_name
  subnet_ids = module.vpc.public_subnets

  tags = {
    Name = var.db_name
  }
}

resource "aws_db_parameter_group" "ntconsult" {
  name   = var.db_name
  family = "postgres16"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}

resource "aws_db_instance" "ntconsult" {
  identifier = var.db_name
  allocated_storage    = 5        # Tipo de armazenamento
  engine               = "postgres"      # Tipo de banco de dados
  engine_version       = "16.3"        # Versão do MySQL
  instance_class       = "db.t3.micro" # Tipo de instância
  db_name              = var.db_name
  username             = var.db_username
  password             = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.ntconsult.name
  vpc_security_group_ids = [aws_security_group.ntconsult.id]
  parameter_group_name   = aws_db_parameter_group.ntconsult.name
  multi_az             = false  # Multi-AZ, se você quiser alta disponibilidade
  publicly_accessible  = true   # Acesso público ao banco de dados (desabilitar para maior segurança)
  skip_final_snapshot  = true   # Não criar um snapshot final na destruição (evitar custos extras)
}