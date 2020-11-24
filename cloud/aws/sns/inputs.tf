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

# Approximate Number of Notification Failure
variable "notification_failure_enabled" {
  description = "Flag to enable Number of Notification Failure monitor"
  type        = string
  default     = "false"
}

variable "notification_failure_extra_tags" {
  description = "Extra tags for Number of Notification Failure monitor"
  type        = list(string)
  default     = []
}

variable "notification_failure_message" {
  description = "Custom message for Number of Notification Failure monitor"
  type        = string
  default     = ""
}

variable "notification_failure_time_aggregator" {
  description = "Monitor aggregator for Number of Notification Failure [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "notification_failure_timeframe" {
  description = "Monitor timeframe for Number of Notification Failure [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_30m"
}

variable "notification_failure_threshold_critical" {
  default     = 10
  description = "Alerting threshold in notification failure percentage"
}

variable "notification_failure_threshold_warning" {
  default     = 5
  description = "Warning threshold in notification failure percentage"
}
