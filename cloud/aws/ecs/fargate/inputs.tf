# Global variables
variable "tags" {
  type    = list(string)
  default = ["type:cloud", "provider:aws", "resource:ecs_fargate", "category:service"]
}

# Generics
variable "message" {
  type        = string
  description = "Message sent when a monitor is triggered"
}

variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  type        = number
  default     = 15
}

variable "new_group_delay" {
  description = "Delay in seconds before monitor new resource"
  default     = 300
}

variable "timeout_h" {
  description = "Default auto-resolving state (in hours)"
  default     = 0
}

variable "notify_no_data" {
  description = "Will raise no data alert if set to true"
  type        = bool
  default     = true
}

variable "prefix_slug" {
  description = "Prefix string to prepend between brackets on every monitors names"
  default     = ""
}

variable "filter_tags_use_defaults" {
  description = "Use default filter tags convention"
  type        = bool
  default     = true
}

variable "filter_tags_custom" {
  description = "Tags used for custom filtering when filter_tags_use_defaults is false"
  type        = string
  default     = "*"
}

variable "filter_tags_custom_excluded" {
  description = "Tags excluded for custom filtering when filter_tags_use_defaults is false"
  type        = string
  default     = ""
}

variable "filter_tags_separator" {
  description = "Set the filter tags separator (, or AND)"
  type        = string
  default     = ","
}

# Service checks
variable "service_check_enabled" {
  type        = bool
  description = "Flag to enable monitor"
  default     = true
}

variable "service_group_by" {
  type        = string
  description = "Service check grouping by"
  default     = "*"
}

variable "service_check_message" {
  type        = string
  description = "Custom message for the monitor"
  default     = ""
}

variable "service_check_extra_tags" {
  type        = list(string)
  description = "Extra tags for the monitor"
  default     = []
}

variable "service_check_threshold_warning" {
  type        = number
  description = "Warning threshold"
  default     = 3
}

variable "service_check_no_data_timeframe" {
  type        = number
  description = "No data timeframe in minutes"
  default     = 10
}

# CPU utilization
variable "cpu_utilization_enabled" {
  description = "Flag to enable monitor"
  type        = string
  default     = "false"
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

# Memory usage
variable "memory_utilization_enabled" {
  description = "Flag to enable Fargate Memory utilization monitor"
  type        = string
  default     = "false"
}

variable "memory_utilization_extra_tags" {
  description = "Extra tags for Fargate Memory utilization monitor"
  type        = list(string)
  default     = []
}

variable "memory_utilization_message" {
  description = "Custom message for the Fargate Memory Utilization monitor"
  type        = string
  default     = ""
}

variable "memory_utilization_time_aggregator" {
  description = "Monitor aggregator for Fargate Memory Utilization [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "memory_utilization_timeframe" {
  description = "Timeframe for the Fargate Memory Utilization monitor"
  type        = string
  default     = "last_5m"
}

variable "memory_utilization_threshold_critical" {
  description = "Critical threshold for the Fargate Memory Utilization monitor"
  type        = string
  default     = 90
}

variable "memory_utilization_threshold_warning" {
  description = "Warning threshold for the Fargate Memory Utilization monitor"
  type        = string
  default     = 85
}
