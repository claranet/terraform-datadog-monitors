# Global variables
variable "tags" {
  type    = list(string)
  default = ["type:database", "provider:zookeeper", "resource:zookeeper"]
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

#
# Service Check
#
variable "not_responding_notify_no_data" {
  default     = true
  type        = bool
  description = "Send notification if not_responding monitor does not retrieve data"
}
variable "not_responding_no_data_timeframe" {
  default     = 10
  description = "Zookeeper monitor no_data_timeframe"
  type        = number
}

variable "not_responding_group_by" {
  default     = ["host", "server"]
  type        = list(string)
  description = "List of tags to use to group data"
}

variable "zookeeper_not_responding_enabled" {
  description = "Flag to enable Zookeeper does not respond monitor"
  type        = string
  default     = "true"
}

variable "zookeeper_not_responding_message" {
  description = "Custom message for Zookeeper does not respond monitor"
  type        = string
  default     = ""
}

variable "zookeeper_not_responding_time_aggregator" {
  description = "Time aggregator for the Zookeeper does not respond monitor"
  type        = string
  default     = "avg"
}

variable "zookeeper_not_responding_timeframe" {
  description = "Timeframe for the does not respond monitor"
  type        = string
  default     = "last_5m"
}

variable "zookeeper_not_responding_extra_tags" {
  description = "Extra tags for Zookeeper does not respond monitor"
  type        = list(string)
  default     = []
}

variable "not_responding_threshold_warning" {
  default     = 3
  type        = number
  description = "Zookeeper not responding limit (warning threshold)"
}

#
# Check read latency monitor
#
variable "zookeeper_latency_enabled" {
  description = "Flag to enable Zookeeper read latency monitor"
  type        = string
  default     = "true"
}

variable "zookeeper_latency_group_by" {
  description = "Tags to use to group datas"
  type        = list(string)
  default     = ["host"]
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

