#
# Datadog global variables
#
variable "environment" {
  description = "Architecture environment"
  type        = "string"
}

variable "filter_tags" {
  description = "Tags used for filtering"
  default     = "*"
}

variable "message" {
  description = "Message sent when a monitor is triggered"
}

variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
}

variable "new_host_delay" {
  description = "Delay in seconds for the new host evaluation"
  default     = 300
}

variable "prefix_slug" {
  description = "Prefix string to prepend between brackets on every monitors names"
  default     = ""
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
  description = "Critical threshold for the number of sending operations."
  type        = "string"
  default     = 0
}

variable "sending_operations_count_enabled" {
  description = "Flag to enable GCP Pub/Sub Unavailable Sending Operations Count monitor"
  type        = "string"
  default     = "true"
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
  description = "Warning threshold for the number of unavailable sending operations"
  type        = "string"
  default     = 2
}

variable "unavailable_sending_operations_count_threshold_critical" {
  description = "Critical threshold for the number of unavailable sending operations"
  type        = "string"
  default     = 4
}

variable "unavailable_sending_operations_count_enabled" {
  description = "Flag to enable GCP Pub/Sub Unavailable Sending Operations Count monitor"
  type        = "string"
  default     = "true"
}

variable "unavailable_sending_operations_count_extra_tags" {
  description = "Extra tags for GCP Pub/Sub Unavailable Sending Operations Count monitor"
  type        = "list"
  default     = []
}
