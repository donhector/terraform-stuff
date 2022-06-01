output "instance_ami" {
  value       = aws_instance.ubuntu.*.ami
  description = "Instance ami"
}

output "instance_arn" {
  value       = aws_instance.ubuntu.*.arn
  description = "Instance arn"
}

output "instance_public_ip" {
  value       = aws_instance.ubuntu.*.public_ip
  description = "Instance public IP"
}

output "instance_private_ip" {
  value       = aws_instance.ubuntu.*.private_ip
  description = "Instance private IP"
}

output "instance_public_dns" {
  value       = aws_instance.ubuntu.*.public_dns
  description = "Instance public dns"
}

output "instance_private_dns" {
  value       = aws_instance.ubuntu.*.private_dns
  description = "Instance private dns"
}

output "key_name" {
  value       = aws_key_pair.ec2.key_name
  description = "SSH key pair name"
}

# output "security_group_id" {
#   value       = aws_security_group.ssh_allow.id
#   description = "Security group id"
# }
