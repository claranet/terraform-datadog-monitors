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

# Azure Stream Analytics specific variables
variable "status_silenced" {
  description = "Groups to mute for Stream Analytics status monitor"
  type        = "map"
  default     = {}
}

variable "status_message" {
  description = "Custom message for Stream Analytics status monitor"
  type        = "string"
  default     = ""
}

variable "su_utilization_silenced" {
  description = "Groups to mute for Stream Analytics utilization monitor"
  type        = "map"
  default     = {}
}

variable "su_utilization_message" {
  description = "Custom message for Stream Analytics utilization monitor"
  type        = "string"
  default     = ""
}

variable "su_utilization_threshold_warning" {
  description = "Streaming Unit utilization rate limit (warning threshold)"
  default     = 60
}

variable "su_utilization_threshold_critical" {
  description = "Streaming Unit utilization rate limit (critical threshold)"
  default     = 80
}

variable "failed_function_requests_silenced" {
  description = "Groups to mute for Stream Analytics failed requests monitor"
  type        = "map"
  default     = {}
}

variable "failed_function_requests_message" {
  description = "Custom message for Stream Analytics failed requests monitor"
  type        = "string"
  default     = ""
}

variable "failed_function_requests_threshold_warning" {
  description = "Failed Function Request rate limit (warning threshold)"
  default     = 0
}

variable "failed_function_requests_threshold_critical" {
  description = "Failed Function Request rate limit (critical threshold)"
  default     = 10
}

variable "conversion_errors_silenced" {
  description = "Groups to mute for Stream Analytics conversion errors monitor"
  type        = "map"
  default     = {}
}

variable "conversion_errors_message" {
  description = "Custom message for Stream Analytics conversion errors monitor"
  type        = "string"
  default     = ""
}

variable "conversion_errors_threshold_warning" {
  description = "Conversion errors limit (warning threshold)"
  default     = 0
}

variable "conversion_errors_threshold_critical" {
  description = "Conversion errors limit (critical threshold)"
  default     = 10
}

variable "runtime_errors_silenced" {
  description = "Groups to mute for Stream Analytics runtime errors monitor"
  type        = "map"
  default     = {}
}

variable "runtime_errors_message" {
  description = "Custom message for Stream Analytics runtime errors monitor"
  type        = "string"
  default     = ""
}

variable "runtime_errors_threshold_warning" {
  description = "Runtime errors limit (warning threshold)"
  default     = 0
}

variable "runtime_errors_threshold_critical" {
  description = "Runtime errors limit (critical threshold)"
  default     = 10
}
