variable "aws_connection_profile" {
  description = "The name of the AWS connection profile to use."
  type        = string
}

variable "aws_region" {
  description = "The code of the AWS Region to use."
  type        = string
}

variable "databricks_connection_profile" {
  description = "The name of the Databricks connection profile to use."
  type        = string
}
