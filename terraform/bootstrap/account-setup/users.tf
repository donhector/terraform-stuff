locals {
  users = [
    {
      name : "hector",
      groups : [aws_iam_group.readonly_group.name, aws_iam_group.admin_group.name]
    },
    {
      name : "svcacct-ci",
      groups : [aws_iam_group.admin_group.name]
    }
  ]
}

resource "aws_iam_user" "user" {
  for_each = { for user in local.users : user.name => user }

  name = each.value.name
}

resource "aws_iam_user_group_membership" "user_group_membership" {
  for_each = { for user in local.users : user.name => user }

  user   = each.value.name
  groups = each.value.groups
  depends_on = [
    aws_iam_user.user
  ]
}
