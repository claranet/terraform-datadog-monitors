#
# Datadog global variables
#
variable "team" {
  description = "Team responsible for the service"
  type        = string
  default     = "devops"
}

variable "environment" {
  description = "Architecture environment"
  type        = string
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
  description = "Delay in seconds before monitor new resource"
  default     = 300
}

variable "prefix_slug" {
  description = "Prefix string to prepend between brackets on every monitors names"
  default     = ""
}

variable "notify_no_data" {
  description = "Will raise no data alert if set to true"
  default     = true
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

#
# Service CPU Utilization
#
variable "service_cpu_utilization_enabled" {
  description = "Flag to enable Service CPU Utilization monitor"
  type        = string
  default     = "false"
}

variable "service_cpu_utilization_extra_tags" {
  description = "Extra tags for Service CPU Utilization monitor"
  type        = list(string)
  default     = []
}

variable "service_cpu_utilization_message" {
  description = "Custom message for the Service CPU Utilization monitor"
  type        = string
  default     = ""
}

variable "service_cpu_utilization_timeframe" {
  description = "Timeframe for the Service CPU Utilization monitor"
  type        = string
  default     = "last_5m"
}

variable "service_cpu_utilization_time_aggregator" {
  description = "Monitor aggregator for Service CPU Utilization [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "service_cpu_utilization_threshold_critical" {
  description = "Critical threshold for the Service CPU Utilization monitor"
  type        = string
  default     = "90"
}

variable "service_cpu_utilization_threshold_warning" {
  description = "Warning threshold for the Service CPU Utilization monitor"
  type        = string
  default     = "80"
}

#
# Service Memory Utilization
#
variable "service_memory_utilization_enabled" {
  description = "Flag to enable Service Memory Utilization monitor"
  type        = string
  default     = "false"
}

variable "service_memory_utilization_extra_tags" {
  description = "Extra tags for Service Memory Utilization monitor"
  type        = list(string)
  default     = []
}

variable "service_memory_utilization_message" {
  description = "Custom message for the Service Memory Utilization monitor"
  type        = string
  default     = ""
}

variable "service_memory_utilization_timeframe" {
  description = "Timeframe for the Service Memory Utilization monitor"
  type        = string
  default     = "last_5m"
}

variable "service_memory_utilization_time_aggregator" {
  description = "Monitor aggregator for Service Memory Utilization [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "service_memory_utilization_threshold_critical" {
  description = "Critical threshold for the Service Memory Utilization monitor"
  type        = string
  default     = 90
}

variable "service_memory_utilization_threshold_warning" {
  description = "Warning threshold for the Service Memory Utilization monitor"
  type        = string
  default     = 85
}

#
# Service Missing tasks
#
variable "service_missing_tasks_enabled" {
  description = "Flag to enable Service Missing Tasks monitor"
  type        = string
  default     = "true"
}

variable "service_missing_tasks_extra_tags" {
  description = "Extra tags for Service Missing Tasks monitor"
  type        = list(string)
  default     = []
}

variable "service_missing_tasks_message" {
  description = "Custom message for the Service Missing Tasks monitor"
  type        = string
  default     = ""
}

variable "service_missing_tasks_timeframe" {
  description = "Timeframe for the Service Missing Tasks monitor"
  type        = string
  default     = "last_5m"
}

variable "service_missing_tasks_time_aggregator" {
  description = "Monitor aggregator for Service Missing Tasks [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "service_missing_tasks_threshold_critical" {
  description = "Critical threshold for the Service Missing Tasks monitor"
  type        = string
  default     = 60
}

variable "service_missing_tasks_threshold_warning" {
  description = "Warning threshold for the Service Missing Tasks monitor"
  type        = string
  default     = 80
}
