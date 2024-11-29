resource "aws_security_group_rule" "allow_rabbitmq" {
  type              = "ingress"
  from_port         = 15672
  to_port           = 15672
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  
  security_group_id = module.eks.node_security_group_id
}

resource "aws_security_group_rule" "allow_rabbitmq_manager" {
  type              = "ingress"
  from_port         = 5672
  to_port           = 5672
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.eks.node_security_group_id
}