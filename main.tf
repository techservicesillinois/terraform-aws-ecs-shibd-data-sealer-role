data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "instance-assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

locals {
  name        = "${var.service}-shibd-data-sealer"
  role_name   = var.role_name != null ? var.role_name : local.name
  policy_name = var.policy_name != null ? var.policy_name : local.name
  secret_name = var.secret_name != null ? var.secret_name : local.name
  tags        = merge({ Name = local.name }, var.tags)
}

resource "aws_iam_role" "default" {
  name               = local.role_name
  path               = "/"
  description        = "Allows ECS tasks to access ${var.service} data sealer key"
  assume_role_policy = data.aws_iam_policy_document.instance-assume-role-policy.json
  tags               = local.tags
}

module "data_sealer_policy" {
  # NOTE: Needs to be a HTTPS URL because consumers of this code may not have SSH keys.
  source = "github.com/techservicesillinois/terraform-aws-sm-secrets-ro-policy?ref=v3.0.2"

  name        = local.policy_name
  description = "Readonly access to secret ${local.secret_name}"
  secrets     = [local.secret_name]
  tags        = local.tags
}

resource "aws_iam_role_policy_attachment" "default" {
  role       = aws_iam_role.default.name
  policy_arn = module.data_sealer_policy.arn
}
