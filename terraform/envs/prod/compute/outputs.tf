output "instance_ami" {
  value       = module.instance.*.instance_ami
  description = "Instance ami"
}

output "instance_arn" {
  value       = module.instance.*.instance_arn
  description = "Instance arn"
}

output "instance_public_ip" {
  value       = module.instance.*.instance_public_ip
  description = "Instance public IP"
}

output "instance_private_ip" {
  value       = module.instance.*.instance_private_ip
  description = "Instance private IP"
}

output "instance_public_dns" {
  value       = module.instance.*.instance_public_dns
  description = "Instance public dns"
}

output "instance_private_dns" {
  value       = module.instance.*.instance_private_dns
  description = "Instance private dns"
}

output "key_name" {
  value       = module.instance.key_name
  description = "Key name"
}

# output "security_group_id" {
#   value       = aws_security_group.ssh-allow.id
#   description = "Security group id"
# }
