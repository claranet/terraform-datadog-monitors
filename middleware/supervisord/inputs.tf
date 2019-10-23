#
# Datadog global variables
#
variable "environment" {
  description = "Architecture environment"
  type        = string
}

variable "message" {
  description = "Message sent when a monitor is triggered"
}

variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
}

variable "new_host_delay" {
  description = "Delay in seconds before monitor new resource"
  default     = 300
}

variable "prefix_slug" {
  description = "Prefix string to prepend between brackets on every monitors names"
  default     = ""
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
# Agent Status
#
variable supervisord_status_enabled" {
  description = "Flag to enable Agent Status monitor"
  type        = string
  default     = "true"
}

variable supervisord_status_extra_tags" {
  description = "Extra tags for Agent Status monitor"
  type        = list(string)
  default     = []
}

variable supervisord_status_message" {
  description = "Custom message for the Agent Status monitor"
  type        = string
  default     = ""
}

variable supervisord_status_threshold_warning" {
  description = "Warning threshold for the Agent Status monitor"
  type        = string
  default     = 3
}

variable supervisord_status_no_data_timeframe" {
  description = "Agent status does not respond monitor no data timeframe"
  type        = string
  default     = 10
}