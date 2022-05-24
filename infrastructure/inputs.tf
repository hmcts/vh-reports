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