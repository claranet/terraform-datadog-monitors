# Global Terraform
variable "environment" {
  description = "Architecture environment"
  type        = "string"
}

# Global DataDog
variable "message" {
  description = "Message sent when an alert is triggered"
}

variable "delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
}

variable "filter_tags_use_defaults" {
  description = "Use default filter tags convention"
  default     = "true"
}

variable "filter_tags_custom" {
  description = "Tags used for custom filtering when filter_tags_use_defaults is false"
  default     = "*"
}

# Azure Event Hub specific variables
variable "status_silenced" {
  description = "Groups to mute for Event Hub status monitor"
  type        = "map"
  default     = {}
}

variable "status_message" {
  description = "Custom message for Event Hub status monitor"
  type        = "string"
  default     = ""
}

variable "failed_requests_rate_silenced" {
  description = "Groups to mute for Event Hub failed requests monitor"
  type        = "map"
  default     = {}
}

variable "failed_requests_rate_message" {
  description = "Custom message for Event Hub failed requests monitor"
  type        = "string"
  default     = ""
}

variable "failed_requests_rate_thresold_critical" {
  description = "Failed requests ratio (percentage) to trigger the critical alert"
  default     = 90
}

variable "failed_requests_rate_thresold_warning" {
  description = "Failed requests ratio (percentage) to trigger a warning alert"
  default     = 50
}

variable "errors_rate_silenced" {
  description = "Groups to mute for Event Hub errors monitor"
  type        = "map"
  default     = {}
}

variable "errors_rate_message" {
  description = "Custom message for Event Hub errors monitor"
  type        = "string"
  default     = ""
}

variable "errors_rate_thresold_critical" {
  description = "Errors ratio (percentage) to trigger the critical alert"
  default     = 90
}

variable "errors_rate_thresold_warning" {
  description = "Errors ratio (percentage) to trigger a warning alert"
  default     = 50
}
