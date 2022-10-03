# Global Terraform
variable "environment" {
  description = "Architecture environment"
  type        = string
}

# Global DataDog
variable "message" {
  description = "Message sent when an alert is triggered"
}

variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
}

variable "new_host_delay" {
  description = "Delay in seconds before monitor new resource"
  default     = 300
}

variable "new_group_delay" {
  description = "Delay in seconds before monitor new resource"
  default     = 300
}

variable "timeout_h" {
  description = "Default auto-resolving state (in hours)"
  default     = 0
}

variable "prefix_slug" {
  description = "Prefix string to prepend between brackets on every monitors names"
  default     = ""
}

variable "notify_no_data" {
  description = "Will raise no data alert if set to true"
  default     = true
}

variable "eventgrid_no_successful_message_no_data_timeframe" {
  description = "Number of minutes before reporting no data"
  type        = string
  default     = 10
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

# Azure Event Grid specific variables

variable "no_successful_message_rate_enabled" {
  description = "Flag to enable Event Grid no successful message monitor"
  type        = string
  default     = "true"
}

variable "no_successful_message_rate_extra_tags" {
  description = "Extra tags for Event Grid no successful message monitor"
  type        = list(string)
  default     = []
}

variable "no_successful_message_rate_message" {
  description = "Custom message for Event Grid no successful message monitor"
  type        = string
  default     = ""
}

variable "no_successful_message_rate_time_aggregator" {
  description = "Monitor aggregator for Event Grid no successful message [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "no_successful_message_rate_timeframe" {
  description = "Monitor timeframe for Event Grid no successful message [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "failed_messages_rate_enabled" {
  description = "Flag to enable Event Grid failed messages monitor"
  type        = string
  default     = "true"
}

variable "failed_messages_rate_extra_tags" {
  description = "Extra tags for Event Grid failed messages monitor"
  type        = list(string)
  default     = []
}

variable "failed_messages_rate_message" {
  description = "Custom message for Event Grid failed messages monitor"
  type        = string
  default     = ""
}

variable "failed_messages_rate_time_aggregator" {
  description = "Monitor aggregator for Event Grid failed messages [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "failed_messages_rate_timeframe" {
  description = "Monitor timeframe for Event Grid failed messages [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "failed_messages_rate_thresold_critical" {
  description = "Failed messages ratio (percentage) to trigger the critical alert"
  default     = 90
}

variable "failed_messages_rate_thresold_warning" {
  description = "Failed messages ratio (percentage) to trigger a warning alert"
  default     = 50
}

variable "unmatched_events_rate_enabled" {
  description = "Flag to enable Event Grid unmatched events monitor"
  type        = string
  default     = "true"
}

variable "unmatched_events_rate_extra_tags" {
  description = "Extra tags for Event Grid unmatched events monitor"
  type        = list(string)
  default     = []
}

variable "unmatched_events_rate_message" {
  description = "Custom message for Event Grid unmatched events monitor"
  type        = string
  default     = ""
}

variable "unmatched_events_rate_time_aggregator" {
  description = "Monitor aggregator for Event Grid unmatched events [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "unmatched_events_rate_timeframe" {
  description = "Monitor timeframe for Event Grid unmatched events [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "unmatched_events_rate_thresold_critical" {
  description = "Unmatched events ratio (percentage) to trigger the critical alert"
  default     = 90
}

variable "unmatched_events_rate_thresold_warning" {
  description = "Unmatched events ratio (percentage) to trigger a warning alert"
  default     = 50
}

