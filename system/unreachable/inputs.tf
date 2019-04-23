# Global Terraform
variable "environment" {
  description = "Architecture Environment"
  type        = "string"
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

# Unreachable

variable "unreachable_silenced" {
  description = "Groups to mute for Host unreachable monitor"
  type        = "map"
  default     = {}
}

variable "unreachable_enabled" {
  description = "Flag to enable Host unreachable monitor"
  type        = "string"
  default     = "true"
}

variable "unreachable_extra_tags" {
  description = "Extra tags for Host unreachable monitor"
  type        = "list"
  default     = []
}

variable "unreachable_message" {
  description = "Custom message for Host unreachable monitor"
  type        = "string"
  default     = ""
}

variable "unreachable_no_data_timeframe" {
  description = "Timeframe for Host unreachable monitor to alert on no data"
  type        = "string"
  default     = 20
}
