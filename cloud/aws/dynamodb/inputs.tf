# Datadog global variables

variable "environment" {
  description = "Architecture environment"
  type        = string
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

variable "notify_no_data" {
  description = "Will raise no data alert if set to true"
  default     = true
}

# Datadog monitors variables

# Provisioned read capacity
variable "provisioned_read_capacity_enabled" {
  description = "Flag to enable Errors monitor"
  type        = string
  default     = "false"
}

variable "provisioned_read_capacity_extra_tags" {
  description = "Extra tags for Errors monitor"
  type        = list(string)
  default     = []
}

variable "provisioned_read_capacity_message" {
  description = "Custom message for Errors monitor"
  type        = string
  default     = ""
}

variable "provisioned_read_capacity_time_aggregator" {
  description = "Monitor aggregator for Errors [available values: min, max or avg]"
  type        = string
  default     = "sum"
}

variable "provisioned_read_capacity_timeframe" {
  description = "Monitor timeframe for Errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_1h"
}

variable "provisioned_read_capacity_threshold_critical" {
  default     = 90
  description = "Alerting threshold in percentage"
}

variable "provisioned_read_capacity_threshold_warning" {
  default     = 70
  description = "Warning threshold in percentage"
}

# Provisioned write capacity
variable "provisioned_write_capacity_enabled" {
  description = "Flag to enable Errors monitor"
  type        = string
  default     = "false"
}

variable "provisioned_write_capacity_extra_tags" {
  description = "Extra tags for Errors monitor"
  type        = list(string)
  default     = []
}

variable "provisioned_write_capacity_message" {
  description = "Custom message for Errors monitor"
  type        = string
  default     = ""
}

variable "provisioned_write_capacity_time_aggregator" {
  description = "Monitor aggregator for Errors [available values: min, max or avg]"
  type        = string
  default     = "sum"
}

variable "provisioned_write_capacity_timeframe" {
  description = "Monitor timeframe for Errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_1h"
}

variable "provisioned_write_capacity_threshold_critical" {
  default     = 90
  description = "Alerting threshold in percentage"
}

variable "provisioned_write_capacity_threshold_warning" {
  default     = 70
  description = "Warning threshold in percentage"
}