# Global variables
variable "tags" {
  type    = list(string)
  default = ["type:cloud", "provider:azure", "resource:servicebus"]
}

# Global DataDog
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

variable "servicebus_status_no_data_timeframe" {
  description = "Number of minutes before reporting no data"
  type        = string
  default     = 10
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

# Azure Service Bus specific variables
variable "status_enabled" {
  description = "Flag to enable Service Bus status monitor"
  type        = string
  default     = "true"
}

variable "status_extra_tags" {
  description = "Extra tags for Service Bus status monitor"
  type        = list(string)
  default     = []
}

variable "status_message" {
  description = "Custom message for Service Bus status monitor"
  type        = string
  default     = ""
}

variable "status_time_aggregator" {
  description = "Monitor aggregator for Service Bus status [available values: min, max or avg]"
  type        = string
  default     = "max"
}

variable "status_timeframe" {
  description = "Monitor timeframe for Service Bus status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  default     = "last_5m"
}

variable "no_active_connections_enabled" {
  description = "Flag to enable Service Bus no active connections monitor"
  type        = string
  default     = "true"
}

variable "no_active_connections_extra_tags" {
  description = "Extra tags for Service Bus no active connections monitor"
  type        = list(string)
  default     = []
}

variable "no_active_connections_message" {
  description = "Custom message for Service Bus no active connections monitor"
  type        = string
  default     = ""
}

variable "no_active_connections_time_aggregator" {
  description = "Monitor aggregator for Service Bus no active connections [available values: min, max or avg]"
  type        = string
  default     = "max"
}

variable "no_active_connections_timeframe" {
  description = "Monitor timeframe for Service Bus no active connections [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "server_errors_message" {
  description = "Custom message for Service Bus server errors monitor"
  type        = string
  default     = ""
}

variable "server_errors_enabled" {
  description = "Flag to enable Service Bus server errors monitor"
  type        = string
  default     = "true"
}

variable "server_errors_extra_tags" {
  description = "Extra tags for Service Bus server errors monitor"
  type        = list(string)
  default     = []
}

variable "server_errors_time_aggregator" {
  description = "Monitor aggregator for Service Bus server errors [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "server_errors_timeframe" {
  description = "Monitor timeframe for Service Bus server errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "server_errors_threshold_critical" {
  description = "Critical threshold for Service Bus server errors monitor"
  default     = 90
}

variable "server_errors_threshold_warning" {
  description = "Warning threshold for Service Bus server errors monitor"
  default     = 50
}

variable "user_errors_message" {
  description = "Custom message for Service Bus user errors monitor"
  type        = string
  default     = ""
}

variable "user_errors_enabled" {
  description = "Flag to enable Service Bus user errors monitor"
  type        = string
  default     = "true"
}

variable "user_errors_extra_tags" {
  description = "Extra tags for Service Bus user errors monitor"
  type        = list(string)
  default     = []
}

variable "user_errors_time_aggregator" {
  description = "Monitor aggregator for Service Bus user errors [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "user_errors_timeframe" {
  description = "Monitor timeframe for Service Bus user errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "user_errors_threshold_critical" {
  description = "Critical threshold for Service Bus user errors monitor"
  default     = 90
}

variable "user_errors_threshold_warning" {
  description = "Warning threshold for Service Bus user errors monitor"
  default     = 50
}

