# ecs-shibd-data-sealer-role

[![Terraform actions status](https://github.com/techservicesillinois/terraform-aws-ecs-shibd-data-sealer-role/workflows/terraform/badge.svg)](https://github.com/techservicesillinois/terraform-aws-ecs-shibd-data-sealer-role/actions)

Provides an IAM role and policy for an ECS task that allows read
access to a service specific 
[data sealer](https://github.com/techservicesillinois/terraform-aws-shibd-data-sealer)
rotated on a daily basis for use with a Shibboleth SP.

Argument Reference
-----------------

The following arguments are supported:

* `service` - (Required) The name of the service associated with
the Shibboleth SP

* `role_name` - The name of the created IAM role. Defaults to
${var.service}-shibd-data-sealer.

* `policy_name` - The name of the created IAM policy. Defaults to
${var.service}-shibd-data-sealer.

* `secret_name` - The name of the Secrets Manager secret to allow
access to. Defaults to ${var.service}-shibd-data-sealer.

Attributes Reference
--------------------

The following attributes are exported:

* `arn` - The Amazon Resource Name (ARN) that identifies the policy
