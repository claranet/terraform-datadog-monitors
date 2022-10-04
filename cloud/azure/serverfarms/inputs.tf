# Global Terraform
variable "environment" {
  description = "Architecture environment"
  type        = string
}

# Global DataDog
variable "message" {
  description = "Message sent when a serverfarms monitor is triggered"
}

variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
}

variable "new_host_delay" {
  description = "Delay in seconds before monitor new resource"
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

variable "notify_no_data" {
  description = "Will raise no data alert if set to true"
  default     = true
}

variable "status_no_data_timeframe" {
  description = "Number of minutes before reporting no data"
  type        = string
  default     = 10
}

variable "filter_tags_use_defaults" {
  description = "Use default filter tags convention"
  default     = "true"
}

variable "filter_tags_custom" {
  description = "Tags used for custom filtering when filter_tags_use_defaults is false"
  default     = "*"
}

# Azure serverfarms specific variables

# Status
variable "status_enabled" {
  description = "Flag to enable the serverfarms status monitor"
  type        = string
  default     = "true"
}

variable "status_message" {
  description = "Custom message for serverfarm status monitor"
  type        = string
  default     = ""
}

variable "status_extra_tags" {
  description = "Extra tags for serverfarms status monitor"
  type        = list(string)
  default     = []
}

variable "status_time_aggregator" {
  description = "Monitor aggregator for serverfarms status [available values: min, max or avg]"
  type        = string
  default     = "max"
}

variable "status_timeframe" {
  description = "Monitor timeframe for serverfarms status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

# CPU percentage
variable "cpu_percentage_enabled" {
  description = "Flag to enable the serverfarms cpu_percentage monitor"
  type        = string
  default     = "true"
}

variable "cpu_percentage_message" {
  description = "Custom message for serverfarm cpu_percentage monitor"
  type        = string
  default     = ""
}

variable "cpu_percentage_extra_tags" {
  description = "Extra tags for serverfarms cpu_percentage monitor"
  type        = list(string)
  default     = []
}

variable "cpu_percentage_time_aggregator" {
  description = "Monitor aggregator for serverfarms cpu_percentage [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "cpu_percentage_timeframe" {
  description = "Monitor timeframe for serverfarms cpu_percentage [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_10m"
}

variable "cpu_percentage_threshold_critical" {
  description = "CPU percentage (critical threshold)"
  default     = 95
}

variable "cpu_percentage_threshold_warning" {
  description = "CPU percentage (warning threshold)"
  default     = 90
}

# Memory percentage
variable "memory_percentage_enabled" {
  description = "Flag to enable the serverfarms memory_percentage monitor"
  type        = string
  default     = "true"
}

variable "memory_percentage_message" {
  description = "Custom message for serverfarm memory_percentage monitor"
  type        = string
  default     = ""
}

variable "memory_percentage_extra_tags" {
  description = "Extra tags for serverfarms memory_percentage monitor"
  type        = list(string)
  default     = []
}

variable "memory_percentage_time_aggregator" {
  description = "Monitor aggregator for serverfarms memory_percentage [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "memory_percentage_timeframe" {
  description = "Monitor timeframe for serverfarms memory_percentage [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "memory_percentage_threshold_critical" {
  description = "Memory percentage (critical threshold)"
  default     = 95
}

variable "memory_percentage_threshold_warning" {
  description = "Memory percentage (warning threshold)"
  default     = 90
}

