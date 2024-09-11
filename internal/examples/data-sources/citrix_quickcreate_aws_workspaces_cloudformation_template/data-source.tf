# CloudFormation template json content can be fetched with citrix_quickcreate_aws_workspaces_cloudformation_template data source
data "citrix_quickcreate_aws_workspaces_cloudformation_template" "example_cloudformation_template" { }

# It can then be referenced with `aws_cloudformation_stack` resource from `aws` provider to create the CloudFormation stack
resource "aws_cloudformation_stack" "citrix_aws_workspaces_core_role_stack" {
  name          = var.citrix_aws_workspaces_core_role_stack_name
  template_body = data.citrix_quickcreate_aws_workspaces_cloudformation_template.example_cloudformation_template.content
  parameters = {
    AssumeRoleName = var.citrix_aws_workspaces_core_assume_role_name
  }
  disable_rollback = true
  capabilities = [ "CAPABILITY_NAMED_IAM" ]
}

# Once the CloudFormation stack is created, the role created by the stack can be referenced with the `aws_iam_role` data source in the `aws` provider
data "aws_iam_role" "citrix_aws_workspaces_core_role" {
  name       = var.citrix_aws_workspaces_core_assume_role_name
  depends_on = [ aws_cloudformation_stack.citrix_aws_workspaces_core_role_stack ]
}

# The role can then be used for creating the Citrix AWS WorkSpaces Core account with the `citrix_quickcreate_aws_workspaces_account` resource
resource "citrix_quickcreate_aws_workspaces_account" "example_aws_workspaces_account_role_arn" {
    name         = "exampe-aws-workspaces-account-role-arn"
    aws_region   = "us-east-1"
    aws_role_arn = data.aws_iam_role.citrix_aws_workspaces_core_role.arn
}
