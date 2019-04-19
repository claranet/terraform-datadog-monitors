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

# Datadog monitors variables

variable "pod_phase_status_silenced" {
  description = "Groups to mute for Pod phase status monitor"
  type        = "map"
  default     = {}
}

variable "pod_phase_status_enabled" {
  description = "Flag to enable Pod phase status monitor"
  type        = "string"
  default     = "true"
}

variable "pod_phase_status_extra_tags" {
  description = "Extra tags for Pod phase status monitor"
  type        = "list"
  default     = []
}

variable "pod_phase_status_message" {
  description = "Custom message for Pod phase status monitor"
  type        = "string"
  default     = ""
}

variable "pod_phase_status_time_aggregator" {
  description = "Monitor aggregator for Pod phase status [available values: min, max or avg]"
  type        = "string"
  default     = "max"
}

variable "pod_phase_status_timeframe" {
  description = "Monitor timeframe for Pod phase status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "error_silenced" {
  description = "Groups to mute for Pod errors monitor"
  type        = "map"
  default     = {}
}

variable "error_enabled" {
  description = "Flag to enable Pod errors monitor"
  type        = "string"
  default     = "true"
}

variable "error_extra_tags" {
  description = "Extra tags for Pod errors monitor"
  type        = "list"
  default     = []
}

variable "error_message" {
  description = "Custom message for Pod errors monitor"
  type        = "string"
  default     = ""
}

variable "error_time_aggregator" {
  description = "Monitor aggregator for Pod errors [available values: min, max or avg]"
  type        = "string"
  default     = "sum"
}

variable "error_timeframe" {
  description = "Monitor timeframe for Pod errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_15m"
}

variable "error_threshold_critical" {
  default     = 1
  description = "error critical threshold"
}

variable "error_threshold_warning" {
  default     = 0.5
  description = "error warning threshold"
}

variable "crashloopbackoff_silenced" {
  description = "Groups to mute for Pod crashloopbackoff monitor"
  type        = "map"
  default     = {}
}

variable "crashloopbackoff_enabled" {
  description = "Flag to enable Pod crashloopbackoff monitor"
  type        = "string"
  default     = "true"
}

variable "crashloopbackoff_extra_tags" {
  description = "Extra tags for Pod crashloopbackoff monitor"
  type        = "list"
  default     = []
}

variable "crashloopbackoff_message" {
  description = "Custom message for Pod crashloopbackoff monitor"
  type        = "string"
  default     = ""
}

variable "crashloopbackoff_time_aggregator" {
  description = "Monitor aggregator for Pod crashloopbackoff [available values: min, max or avg]"
  type        = "string"
  default     = "sum"
}

variable "crashloopbackoff_timeframe" {
  description = "Monitor timeframe for Pod crashloopbackoff [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_10m"
}

variable "crashloopbackoff_threshold_critical" {
  default     = 5
  description = "crashloopbackoff critical threshold"
}

variable "crashloopbackoff_threshold_warning" {
  default     = 4
  description = "crashloopbackoff warning threshold"
}
