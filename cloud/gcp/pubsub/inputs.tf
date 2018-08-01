#
# Datadog global variables
#
variable "environment" {
  description = "Architecture environment"
  type        = "string"
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

variable "delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
}

#
# Filter variables
#
variable "project_id" {
  type        = "string"
  description = "ID of the GCP Project"
}

#
# Sending Operations Count
#
variable "sending_operations_count_message" {
  description = "Custom message for the GCP Pub/Sub Sending Operations Count monitor"
  type        = "string"
  default     = ""
}

variable "sending_operations_count_time_aggregator" {
  description = "Timeframe for the GCP Pub/Sub Sending Operations Count monitor"
  type        = "string"
  default     = "sum"
}

variable "sending_operations_count_timeframe" {
  description = "Timeframe for the GCP Pub/Sub Sending Operations Count monitor"
  type        = "string"
  default     = "last_30m"
}

variable "sending_operations_count_threshold_critical" {
  description = "Critical threshold"
  type        = "string"
  default     = 0
}

variable "sending_operations_count_silenced" {
  description = "Groups to mute for GCP Pub/Sub Sending Operations Count monitor"
  type        = "map"
  default     = {}
}

variable "sending_operations_count_extra_tags" {
  description = "Extra tags for GCP Pub/Sub Sending Operations Count monitor"
  type        = "list"
  default     = []
}

#
# Unavailable Sending Operations Count
#
variable "unavailable_sending_operations_count_message" {
  description = "Custom message for the GCP Pub/Sub Unavailable Sending Operations Count monitor"
  type        = "string"
  default     = ""
}

variable "unavailable_sending_operations_count_time_aggregator" {
  description = "Timeframe for the GCP Pub/Sub Unavailable Sending Operations Count monitor"
  type        = "string"
  default     = "sum"
}

variable "unavailable_sending_operations_count_timeframe" {
  description = "Timeframe for the GCP Pub/Sub Unavailable Sending Operations Count monitor"
  type        = "string"
  default     = "last_10m"
}

variable "unavailable_sending_operations_count_threshold_warning" {
  description = "Warning threshold"
  type        = "string"
  default     = 2
}

variable "unavailable_sending_operations_count_threshold_critical" {
  description = "Critical threshold"
  type        = "string"
  default     = 4
}

variable "unavailable_sending_operations_count_silenced" {
  description = "Groups to mute for GCP Pub/Sub Unavailable Sending Operations Count monitor"
  type        = "map"
  default     = {}
}

variable "unavailable_sending_operations_count_extra_tags" {
  description = "Extra tags for GCP Pub/Sub Unavailable Sending Operations Count monitor"
  type        = "list"
  default     = []
}
