variable "env" {
  description = "The environment the infrastructure will be created in"
  type        = string
}

variable "rg_name" {
  description = "The resource group the infrastructure will be created in"
  type        = string
}

variable "rg_location" {
  description = "The Azure region of the resource group the infrastructure will be created in"
  type        = string
}

variable "sds_subcription_id" {
  type        = string
  description = "SDS Subscription"
}