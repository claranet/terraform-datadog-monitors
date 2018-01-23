# Global Terraform
variable "environment" {
  description = "Architecture environment"
  type        = "string"
}

# Global DataDog
variable "message" {
  description = "Message sent when a Redis monitor is triggered"
}

variable "delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 600
}

variable "filter_tags_use_defaults" {
  description = "Use default filter tags convention"
  default     = "true"
}

variable "filter_tags_custom" {
  description = "Tags used for custom filtering when filter_tags_use_defaults is false"
  default     = "*"
}

# Azure API Management specific
variable "failed_requests_threshold_critical" {
  description = "Maximum acceptable percent of failed requests"
  default     = 5
}

variable "other_requests_threshold_critical" {
  description = "Maximum acceptable percent of other requests"
  default     = 5
}

variable "unauthorized_requests_threshold_critical" {
  description = "Maximum acceptable percent of unauthorized requests"
  default     = 5
}

variable "successful_requests_threshold_critical" {
  description = "Minimum acceptable percent of successful requests"
  default     = 90
}
