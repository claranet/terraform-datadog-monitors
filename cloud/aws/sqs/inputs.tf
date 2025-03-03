# Global variables
variable "tags" {
  type    = list(string)
  default = ["type:cloud", "provider:aws", "resource:sqs"]
}

# Global DataDog
variable "filter_tags_use_defaults" {
  description = "Use default filter tags convention"
  default     = "true"
}

variable "filter_tags_custom" {
  description = "Tags used for custom filtering when filter_tags_use_defaults is false"
  default     = "*"
}

variable "filter_tags_separator" {
  description = "Set the filter tags separator (, or AND)"
  default     = ","
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

# Datadog monitors variables

# Approximate Number of Visible Messages
variable "visible_messages_enabled" {
  description = "Flag to enable Number of Visible Messages monitor"
  type        = string
  default     = "false"
}

variable "visible_messages_extra_tags" {
  description = "Extra tags for Number of Visible Messages monitor"
  type        = list(string)
  default     = []
}

variable "visible_messages_message" {
  description = "Custom message for Number of Visible Messages monitor"
  type        = string
  default     = ""
}

variable "visible_messages_time_aggregator" {
  description = "Monitor aggregator for Number of Visible Messages [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "visible_messages_timeframe" {
  description = "Monitor timeframe for Number of Visible Messages [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_30m"
}

variable "visible_messages_threshold_critical" {
  default     = 2
  description = "Alerting threshold in number of messages"
}

variable "visible_messages_threshold_warning" {
  default     = 1
  description = "Warning threshold in number of messages"
}

# Age of the Oldest Message
variable "age_of_oldest_message_enabled" {
  description = "Flag to enable Age of Oldest Message monitor"
  type        = string
  default     = "true"
}

variable "age_of_oldest_message_extra_tags" {
  description = "Extra tags for Age of Oldest Message monitor"
  type        = list(string)
  default     = []
}

variable "age_of_oldest_message_message" {
  description = "Custom message for Age of Oldest Message monitor"
  type        = string
  default     = ""
}

variable "age_of_oldest_message_time_aggregator" {
  description = "Monitor aggregator for Age of Oldest Message [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "age_of_oldest_message_timeframe" {
  description = "Monitor timeframe for Age of Oldest Message [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_30m"
}

variable "age_of_oldest_message_threshold_critical" {
  default     = 600
  description = "Alerting threshold in seconds"
}

variable "age_of_oldest_message_threshold_warning" {
  default     = 300
  description = "Warning threshold in seconds"
}
