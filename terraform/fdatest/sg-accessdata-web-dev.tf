resource "aws_security_group" "accessdatawebdev" {
  name        = "AccessData Web Dev"
  description = "necessary ports"
  vpc_id      = module.network_1.vpc

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/24"]
    description = "ssh access"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/24"]
    description = "https access"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/24"]
    description = "https access"
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
    description = "any same group"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow all egress"
  }

  tags = merge(
    local.common_tags,
    map(
      "Name", "AccessDataWebDev"
  ))

}

output "accessdatawebdev-sg-id" {
  value = aws_security_group.accessdatawebdev.id
}
