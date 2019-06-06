# Datadog global variables

variable "environment" {
  description = "Architecture environment"
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

variable "message" {
  description = "Message sent when a monitor is triggered"
}

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

# Datadog monitors variables

variable "ark_schedules_monitor_message" {
  description = "Custom message for Ark schedules monitor"
  type        = string
  default     = ""
}

variable "ark_schedules_monitor_timeframe" {
  description = "Monitor timeframe for Ark schedules monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_1d"
}

variable "ark_schedules_enabled" {
  description = "Flag to enable Ark schedules monitor"
  type        = string
  default     = "true"
}

variable "ark_schedules_extra_tags" {
  description = "Extra tags for Ark schedules monitor"
  type        = list(string)
  default     = []
}

variable "ark_schedules_monitor_no_data_timeframe" {
  description = "No data timeframe in minutes"
  default     = 1440
}

