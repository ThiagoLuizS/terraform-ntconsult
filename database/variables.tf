variable "region" {
  description = "The AWS region to create the resources in"
  type        = string
  default     = "us-east-2"
}

variable "db_username" {
  description = "Username for the RDS database"
  type        = string
  default     = "postgres"
}

variable "db_password" {
  description = "Password for the RDS database"
  type        = string
  sensitive   = true
  default = "12345678"
}

variable "db_name" {
  description = "The name of the database"
  type        = string
  default     = "ntconsult"
}

variable "vpc_name" {
  type = string
  default = "ntconsult-rds-vpc"
}
