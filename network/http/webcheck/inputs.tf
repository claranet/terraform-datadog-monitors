# Global Terraform
variable "environment" {
  description = "Architecture Environment"
  type        = string
}

# Global DataDog
variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 15
}

variable "new_host_delay" {
  description = "Delay in seconds before monitor new resource"
  default     = 300
}

variable "prefix_slug" {
  description = "Prefix string to prepend between brackets on every monitors names"
  default     = ""
}

variable "notify_no_data" {
  description = "Will raise no data alert if set to true"
  default     = true
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

variable "filter_tags_custom_excluded" {
  description = "Tags excluded for custom filtering when filter_tags_use_defaults is false"
  default     = ""
}

#
# HTTP Cannot Connect
#
variable "cannot_connect_enabled" {
  description = "Flag to enable HTTP cannot connect monitor"
  type        = string
  default     = "true"
}

variable "cannot_connect_message" {
  description = "Custom message for HTTP cannot connect monitor"
  type        = string
  default     = ""
}

variable "cannot_connect_threshold_warning" {
  description = "HTTP cannot connect monitor (warning threshold)"
  type        = string
  default     = 3
}

variable "cannot_connect_no_data_timeframe" {
  description = "HTTP cannot connect monitor no data timeframe"
  type        = string
  default     = 10
}

variable "cannot_connect_extra_tags" {
  description = "Extra tags for HTTP cannot connect monitor"
  type        = list(string)
  default     = []
}