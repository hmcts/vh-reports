variable "env" {
  description = "The environment the infrastructure will be created in"
  type        = string
}

variable "location" {
  description = "The Azure region the infrastructure will be created in"
  type        = string
}

variable "administrator_login" {
  description = "The user name for the database connections"
  type        = string
  default     = "hvhearingsapiadmin"
}

locals {
  sds_subcription_id = var.env == "dev" ? "867a878b-cb68-4de5-9741-361ac9e178b6" : var.env == "stg" ? "74dacd4f-a248-45bb-a2f0-af700dc4cf68" : var.env == "prod" ? "5ca62022-6aa2-4cee-aaa7-e7536c8d566c" : ""
}