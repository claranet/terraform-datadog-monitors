# Global Terraform
variable "client_name" {
  type = "string"
}

variable "environment" {
  type = "string"
}

variable "stack" {
  type = "string"
}

# Global DataDog
variable "critical_escalation_group" {
}

variable "warning_escalation_group" {
}

variable "delay" {
  default = 600
}

# Azure Redis specific
variable "evictedkeys_threshold_warning" {
  default = 0
}
variable "evictedkeys_threshold_critical" {
  default = 100
}
