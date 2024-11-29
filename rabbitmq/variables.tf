variable "cluster_name" {
  type = string
  default = "rabbitmq-cluster"
}

variable "aws_security_group_name" {
  type = string
  default = "ssh-cluster-rabbitmq"
}

variable "vpc_name" {
  type = string
  default = "vpc-rabbitmq"
}
