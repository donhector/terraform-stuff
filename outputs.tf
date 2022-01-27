output "instance_ami" {
  value       = aws_instance.ubuntu.*.ami
  description = "Instance ami"
}

output "instance_arn" {
  value       = aws_instance.ubuntu.*.arn
  description = "Instance arn"
}
