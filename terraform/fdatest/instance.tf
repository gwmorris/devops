

resource "aws_instance" "instance_1" {
  ami                    = local.base_ami
  instance_type          = "t3.micro"
  subnet_id              = module.network_1.public_subnet_a
  key_name               = module.keypair.key_name
  vpc_security_group_ids = ["${aws_security_group.accessdatawebdev.id}"]

  root_block_device {
    volume_size           = 10
    volume_type           = "gp2"
    delete_on_termination = true
  }

  tags = merge(
    local.common_tags,
    map(
      "Name", "Test Instance 1"
  ))

  # provisioner "local-exec" {
  #   command = "echo '${var.pass}' > vault.pass; sleep 120; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook --vault-password-file=vault.pass -u ec2-user --extra-vars 'jenkins_url=http://${aws_instance.jenkins.public_ip} domain=${local.project}.${local.domain} sonar=${aws_instance.sonar.public_ip}' --private-key ./keys/key.pem -i '${aws_instance.jenkins.public_ip},' ../ansible/jenkins.yml; rm vault.pass"
  # }
}

resource "aws_instance" "instance_2" {
  ami                    = local.base_ami
  instance_type          = "t3.micro"
  subnet_id              = module.network_1.public_subnet_a
  key_name               = module.keypair.key_name
  vpc_security_group_ids = ["${aws_security_group.accessdatawebdev.id}"]

  root_block_device {
    volume_size           = 10
    volume_type           = "gp2"
    delete_on_termination = true
  }

  tags = merge(
    local.common_tags,
    map(
      "Name", "Test Instance 2"
  ))


  # provisioner "local-exec" {
  #   command = "echo '${var.pass}' > vault.pass; sleep 120; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook --vault-password-file=vault.pass -u ec2-user --extra-vars 'jenkins_url=http://${aws_instance.jenkins.public_ip} domain=${local.project}.${local.domain} sonar=${aws_instance.sonar.public_ip}' --private-key ./keys/key.pem -i '${aws_instance.jenkins.public_ip},' ../ansible/jenkins.yml; rm vault.pass"
  # }
}

output "instance_ip_2" {
  value = aws_instance.instance_1.public_ip
}
output "instance_ip_1" {
  value = aws_instance.instance_2.public_ip
}

output "instance_dns_1" {
  value = aws_instance.instance_1.public_dns
}

output "instance_dns_2" {
  value = aws_instance.instance_2.public_dns
}
