#
# Datadog global variables
#
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
  default     = 15
}

variable "new_host_delay" {
  description = "Delay in seconds before begin to monitor new host"
  default     = 300
}

variable "prefix_slug" {
  description = "Prefix string to prepend between brackets on every monitors names"
  default     = ""
}

# Service Check
variable "zookeeper_process_enabled" {
  description = "Flag to enable Zookeeper does not respond monitor"
  type        = string
  default     = "true"
}

variable "zookeeper_process_message" {
  description = "Custom message for Zookeeper does not respond monitor"
  type        = string
  default     = ""
}

variable "zookeeper_process_time_aggregator" {
  description = "Time aggregator for the Zookeeper does not respond monitor"
  type        = string
  default     = "avg"
}

variable "zookeeper_process_timeframe" {
  description = "Timeframe for the does not respond monitor"
  type        = string
  default     = "last_10m"
}

variable "zookeeper_process_extra_tags" {
  description = "Extra tags for Zookeeper does not respond monitor"
  type        = list(string)
  default     = []
}


## Check read latency monitor
variable "zookeeper_latency_enabled" {
  description = "Flag to enable Zookeeper read latency monitor"
  type        = string
  default     = "true"
}

variable "zookeeper_latency_status_message" {
  description = "Custom message for Zookeeper read latency monitor"
  type        = string
  default     = ""
}

variable "zookeeper_latency_time_aggregator" {
  description = "Monitor time aggregator for Zookeeper read latency monitor [available values: min, max or avg]"
  type        = string
  default     = "avg"
}

variable "zookeeper_latency_timeframe" {
  description = "Monitor timeframe for Zookeeper read latency monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "zookeeper_latency_threshold_critical" {
  description = "Maximum critical acceptable ms of zookeeper latency monitor"
  default     = 300000
}

variable "zookeeper_latency_threshold_warning" {
  description = "Maximum warning acceptable ms of zookeeper latency monitor"
  default     = 250000
}

variable "zookeeper_latency_availability_extra_tags" {
  description = "Extra tags for zookeeper read latency monitor"
  type        = list(string)
  default     = []
}
