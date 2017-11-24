# Global Terraform
variable "environment" {
  description = "Architecture environment"
  type = "string"
}

variable "name" {
  description = "Name of the monitor, should contain '{{name}}' for resource identification"
  type = "string"
}

variable "query" {
  description = "Query to use for monitor evaluation"
  type = "string"
}

variable "critical_threshold" {
  description = "Critical threshold to set, mandatory if `warning_threshold` is set"
  default = ""
}
variable "warning_threshold" {
  description = "Warning threshold to set"
  default = ""
}

variable "notify_no_data" {}

variable "resource_name" {}

variable "provider" {}

# Global DataDog
variable "message" {
  description = "Message sent when a Redis monitor is triggered"
}

variable "delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 600
}
