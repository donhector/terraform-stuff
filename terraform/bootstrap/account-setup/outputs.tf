output "account_alias" {
  value = aws_iam_account_alias.alias.account_alias
}

output "keypair_name" {
  value = module.key_pair.key_pair_key_name
}

output "keypair_id" {
  value = module.key_pair.key_pair_key_pair_id
}

output "keypair_fingerprint" {
  value = module.key_pair.key_pair_fingerprint
}
