# Global Terraform
variable "environment" {
  description = "Architecture Environment"
  type        = "string"
}

# Global DataDog
variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 600
}

variable "message" {
  description = "Message sent when an alert is triggered"
}

variable "filter_tags_use_defaults" {
  description = "Use default filter tags convention"
  default     = "true"
}

variable "filter_tags_custom" {
  description = "Tags used for custom filtering when filter_tags_use_defaults is false"
  default     = "*"
}

# Custom CPU instance specific

variable "custom_cpu_period" {
  description = "Set up period for the query"
  default     = "last_5m"
}

variable "custom_cpu_threshold_warning" {
  description = "Custom CPU warning threshold"
  default     = 80
}

variable "custom_cpu_threshold_critical" {
  description = "Custom CPU critical threshold"
  default     = 95
}
