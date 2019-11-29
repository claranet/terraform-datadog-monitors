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
# Cannot Resolve
#
variable "cannot_resolve_enabled" {
  description = "Flag to enable DNS cannot resolve monitor"
  type        = string
  default     = "true"
}

variable "cannot_resolve_message" {
  description = "Custom message for DNS cannot resolve monitor"
  type        = string
  default     = ""
}

variable "cannot_resolve_threshold_warning" {
  description = "DNS cannot resolve monitor (warning threshold)"
  type        = string
  default     = 3
}

variable "cannot_resolve_no_data_timeframe" {
  description = "DNS cannot resolve monitor no data timeframe"
  type        = string
  default     = 10
}

variable "cannot_resolve_extra_tags" {
  description = "Extra tags for DNS cannot resolve monitor"
  type        = list(string)
  default     = []
}