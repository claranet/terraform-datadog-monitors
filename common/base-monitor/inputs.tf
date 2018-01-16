# Global Terraform
variable "environment" {
  description = "Architecture environment"
  type        = "string"
}

variable "name" {
  description = "Name of the monitor, should contain '{{name}}' for resource identification"
  type        = "string"
}

variable "message" {
  type = "string"
}

variable "query" {
  description = "Query to use for monitor evaluation"
  type        = "string"
}

variable "resource_name" {
  type = "string"
}

variable "extra_tags" {
  type    = "map"
  default = {}
}

variable "provider" {
  type = "string"
}

variable "type" {
  type    = "string"
  default = "metric alert"
}

variable "thresholds" {
  type    = "map"
  default = {}
}

variable "notify_no_data" {
  type = "string"
}

variable "no_data_timeframe" {
  type    = "string"
  default = "10"
}

variable "evaluation_delay" {
  type    = "string"
  default = "600"
}

variable "new_host_delay" {
  type    = "string"
  default = "300"
}

variable "timeout_h" {
  type    = "string"
  default = "0"
}

variable "require_full_window" {
  type    = "string"
  default = "false"
}
