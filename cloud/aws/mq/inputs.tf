# Global variables
variable "tags" {
  type    = list(string)
  default = ["type:cloud", "provider:aws", "resource:mq"]
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

# MQ broker CPU utilization
variable "cpu_utilization_enabled" {
  description = "Flag to enable monitor"
  type        = string
  default     = "true"
}

variable "cpu_utilization_message" {
  description = "Custom message for the monitor"
  type        = string
  default     = ""
}

variable "cpu_utilization_time_aggregator" {
  description = "Monitor aggregator (min, max or avg)"
  type        = string
  default     = "min"
}

variable "cpu_utilization_timeframe" {
  description = "Timeframe for the monitor"
  type        = string
  default     = "last_5m"
}

variable "cpu_utilization_threshold_critical" {
  description = "Critical threshold for the monitor"
  type        = string
  default     = 90
}

variable "cpu_utilization_threshold_warning" {
  description = "Warning threshold for the monitor"
  type        = string
  default     = 85
}

variable "cpu_utilization_extra_tags" {
  description = "Extra tags for the monitor"
  type        = list(string)
  default     = []
}

# MQ broker Memory utilization
variable "memory_utilization_enabled" {
  description = "Flag to enable monitor"
  type        = string
  default     = "true"
}

variable "memory_utilization_message" {
  description = "Custom message for the monitor"
  type        = string
  default     = ""
}

variable "memory_utilization_time_aggregator" {
  description = "Monitor aggregator (min, max or avg)"
  type        = string
  default     = "min"
}

variable "memory_utilization_timeframe" {
  description = "Timeframe for the monitor"
  type        = string
  default     = "last_5m"
}

variable "memory_utilization_threshold_critical" {
  description = "Critical threshold for the monitor"
  type        = string
  default     = 90
}

variable "memory_utilization_threshold_warning" {
  description = "Warning threshold for the monitor"
  type        = string
  default     = 85
}

variable "memory_utilization_extra_tags" {
  description = "Extra tags for the monitor"
  type        = list(string)
  default     = []
}

# MQ broker Disk Free limit
variable "disk_free_limit_enabled" {
  description = "Flag to enable monitor"
  type        = string
  default     = "true"
}

variable "disk_free_limit_message" {
  description = "Custom message for the monitor"
  type        = string
  default     = ""
}

variable "disk_free_limit_time_aggregator" {
  description = "Monitor aggregator (min, max or avg)"
  type        = string
  default     = "min"
}

variable "disk_free_limit_timeframe" {
  description = "Timeframe for the monitor"
  type        = string
  default     = "last_5m"
}

variable "disk_free_limit_threshold_critical" {
  description = "Critical threshold for the monitor"
  type        = string
  default     = 90
}

variable "disk_free_limit_threshold_warning" {
  description = "Warning threshold for the monitor"
  type        = string
  default     = 85
}

variable "disk_free_limit_extra_tags" {
  description = "Extra tags for the monitor"
  type        = list(string)
  default     = []
}

# MQ Consumer count
variable "consumer_count_enabled" {
  description = "Flag to enable monitor"
  type        = string
  default     = "true"
}

variable "consumer_count_message" {
  description = "Custom message for the monitor"
  type        = string
  default     = ""
}

variable "consumer_count_time_aggregator" {
  description = "Monitor aggregator (min, max or avg)"
  type        = string
  default     = "min"
}

variable "consumer_count_timeframe" {
  description = "Timeframe for the monitor"
  type        = string
  default     = "last_5m"
}

variable "consumer_count_threshold_critical" {
  description = "Critical threshold for the monitor"
  type        = string
  default     = 1
}

variable "consumer_count_extra_tags" {
  description = "Extra tags for the monitor"
  type        = list(string)
  default     = []
}

# MQ Messages ready
variable "messages_ready_enabled" {
  description = "Flag to enable monitor"
  type        = string
  default     = "true"
}

variable "messages_ready_message" {
  description = "Custom message for the monitor"
  type        = string
  default     = ""
}

variable "messages_ready_time_aggregator" {
  description = "Monitor aggregator (min, max or avg)"
  type        = string
  default     = "min"
}

variable "messages_ready_timeframe" {
  description = "Timeframe for the monitor"
  type        = string
  default     = "last_5m"
}

variable "messages_ready_threshold_critical" {
  description = "Critical threshold for the monitor"
  type        = string
  default     = 1000
}

variable "messages_ready_threshold_warning" {
  description = "Warning threshold for the monitor"
  type        = string
  default     = 100
}

variable "messages_ready_extra_tags" {
  description = "Extra tags for the monitor"
  type        = list(string)
  default     = []
}