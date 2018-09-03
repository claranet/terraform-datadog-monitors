# Global Terraform
variable "environment" {
  description = "Architecture Environment"
  type        = "string"
}

# Global DataDog
variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
}

variable "new_host_delay" {
  description = "Delay in seconds before monitor new resource"
  default     = 300
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
  type        = "string"
  default     = "true"
}

variable "status_silenced" {
  description = "Groups to mute for Service Bus status monitor"
  type        = "map"
  default     = {}
}

variable "status_extra_tags" {
  description = "Extra tags for Service Bus status monitor"
  type        = "list"
  default     = []
}

variable "status_message" {
  description = "Custom message for Service Bus status monitor"
  type        = "string"
  default     = ""
}

variable "status_time_aggregator" {
  description = "Monitor aggregator for Service Bus status [available values: min, max or avg]"
  type        = "string"
  default     = "max"
}

variable "status_timeframe" {
  description = "Monitor timeframe for Service Bus status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  default     = "last_5m"
}

variable "no_active_connections_enabled" {
  description = "Flag to enable Service Bus no active connection monitor"
  type        = "string"
  default     = "true"
}

variable "no_active_connections_silenced" {
  description = "Groups to mute for Service Bus no active connection monitor"
  type        = "map"
  default     = {}
}

variable "no_active_connections_message" {
  description = "Custom message for Service Bus no active connection monitor"
  type        = "string"
  default     = ""
}

variable "no_active_connections_time_aggregator" {
  description = "Monitor aggregator for Service Bus no active connection [available values: min, max or avg]"
  type        = "string"
  default     = "max"
}

variable "no_active_connections_timeframe" {
  description = "Monitor timeframe for Service Bus no active connection [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "no_active_connections_extra_tags" {
  description = "Extra tags for Service Bus no active connection monitor"
  type        = "list"
  default     = []
}

variable "server_errors_message" {
  description = "Custom message for Service Bus server errors monitor"
  type        = "string"
  default     = ""
}

variable "server_errors_enabled" {
  description = "Flag to enable Service Bus server errors monitor"
  type        = "string"
  default     = "true"
}

variable "server_errors_silenced" {
  description = "Groups to mute for Service Bus server errors monitor"
  type        = "map"
  default     = {}
}

variable "server_errors_time_aggregator" {
  description = "Monitor aggregator for Service Bus server errors [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "server_errors_timeframe" {
  description = "Monitor timeframe for Service Bus server errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
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

variable "server_errors_extra_tags" {
  description = "Extra tags for Service Bus server errors monitor"
  type        = "list"
  default     = []
}

variable "user_errors_message" {
  description = "Custom message for Service Bus user errors monitor"
  type        = "string"
  default     = ""
}

variable "user_errors_enabled" {
  description = "Flag to enable Service Bus user errors monitor"
  type        = "string"
  default     = "true"
}

variable "user_errors_silenced" {
  description = "Groups to mute for Service Bus user errors monitor"
  type        = "map"
  default     = {}
}

variable "user_errors_time_aggregator" {
  description = "Monitor aggregator for Service Bus user errors [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "user_errors_timeframe" {
  description = "Monitor timeframe for Service Bus user errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
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

variable "user_errors_extra_tags" {
  description = "Extra tags for Service Bus user errors monitor"
  type        = "list"
  default     = []
}

variable "queue_growing_message" {
  description = "Custom message for Service Bus quickly growing queue monitor"
  type        = "string"
  default     = ""
}

variable "queue_growing_enabled" {
  description = "Flag to enable Service Bus quickly growing queue monitor"
  type        = "string"
  default     = "true"
}

variable "queue_growing_config" {
  description = "Configuration for Service Bus quickly growing queue monitor as {\"<timeframe>\" = \"<critical_threshold>,<warning_threshold>\",...} ie. {\"last_5m\" = \"50,30\", \"last_1d\" = \"50,30\"}"
  type        = "map"

  default = {
    "last_5m"  = "50,30"
    "last_30m" = "50,30"
    "last_2h"  = "50,30"
    "last_1d"  = "50,30"
  }
}

variable "queue_growing_silenced" {
  description = "Groups to mute for Service Bus quickly growing queue monitor"
  type        = "map"
  default     = {}
}

variable "queue_growing_time_aggregator" {
  description = "Monitor aggregator for Service Bus no quickly growing queue [available values: min, max or avg]"
  type        = "string"
  default     = "avg"
}

variable "queue_growing_extra_tags" {
  description = "Extra tags for Service Bus quickly growing queue monitor"
  type        = "list"
  default     = []
}
