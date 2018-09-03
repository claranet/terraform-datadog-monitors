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

# Datadog monitors variables

variable "ark_schedules_monitor_message" {
  description = "Custom message for Ark schedules monitor"
  type        = "string"
  default     = ""
}

variable "ark_schedules_monitor_timeframe" {
  description = "Monitor timeframe for Ark schedules monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_1d"
}

variable "ark_schedules_monitor_silenced" {
  description = "Groups to mute for Ark schedules monitor"
  type        = "map"
  default     = {}
}

variable "ark_schedules_monitor_no_data_timeframe" {
  description = "No data timeframe"
  default     = 1440
}
