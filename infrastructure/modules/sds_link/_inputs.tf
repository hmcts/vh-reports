variable "adf_id" {
  type        = string
  description = "Azure Data Factory ID"
}
variable "adf_integration_runtime_name" {
  type        = string
  description = "Azure Data Factory Integration Runtime Name"
}

variable "env" {
  type        = string
  description = "Environment"
}
variable "adf_mi_principal_id" {
  type        = string
  description = "Managed Identity Principal ID"
}
