output "rds_hostname" {
  description = "RDS instance hostname"
  value       = aws_db_instance.ntconsult.address
  sensitive   = true
  depends_on = [ aws_db_instance.ntconsult ]
}

output "rds_port" {
  description = "RDS instance port"
  value       = aws_db_instance.ntconsult.port
  sensitive   = true
  depends_on = [ aws_db_instance.ntconsult ]
}

output "rds_username" {
  description = "RDS instance root username"
  value       = aws_db_instance.ntconsult.username
  sensitive   = true
  depends_on = [ aws_db_instance.ntconsult ]
}
