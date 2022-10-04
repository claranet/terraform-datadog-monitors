# Global Terraform
variable "environment" {
  description = "Architecture Environment"
  type        = string
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

# Azure SQL Database specific variables

variable "status_enabled" {
  description = "Flag to enable Redis status monitor"
  type        = string
  default     = "true"
}

variable "status_extra_tags" {
  description = "Extra tags for Redis status monitor"
  type        = list(string)
  default     = []
}

variable "status_message" {
  description = "Custom message for Redis status monitor"
  type        = string
  default     = ""
}

variable "status_time_aggregator" {
  description = "Monitor aggregator for Redis status [available values: min, max or avg]"
  type        = string
  default     = "max"
}

variable "status_timeframe" {
  description = "Monitor timeframe for Redis status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "cpu_enabled" {
  description = "Flag to enable SQL CPU monitor"
  type        = string
  default     = "true"
}

variable "cpu_extra_tags" {
  description = "Extra tags for SQL CPU monitor"
  type        = list(string)
  default     = []
}

variable "cpu_message" {
  description = "Custom message for SQL CPU monitor"
  type        = string
  default     = ""
}

variable "cpu_time_aggregator" {
  description = "Monitor aggregator for SQL CPU [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "cpu_timeframe" {
  description = "Monitor timeframe for SQL CPU [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "cpu_threshold_warning" {
  description = "CPU usage in percent (warning threshold)"
  default     = "80"
}

variable "cpu_threshold_critical" {
  description = "CPU usage in percent (critical threshold)"
  default     = "90"
}

variable "diskspace_enabled" {
  description = "Flag to enable SQL disk space monitor"
  type        = string
  default     = "true"
}

variable "diskspace_extra_tags" {
  description = "Extra tags for SQL disk space monitor"
  type        = list(string)
  default     = []
}

variable "diskspace_message" {
  description = "Custom message for SQL disk space monitor"
  type        = string
  default     = ""
}

variable "diskspace_time_aggregator" {
  description = "Monitor aggregator for SQL disk space [available values: min, max or avg]"
  type        = string
  default     = "max"
}

variable "diskspace_timeframe" {
  description = "Monitor timeframe for SQL disk space [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "diskspace_threshold_warning" {
  description = "Disk space used in percent (warning threshold)"
  default     = "80"
}

variable "diskspace_threshold_critical" {
  description = "Disk space used in percent (critical threshold)"
  default     = "90"
}

variable "dtu_enabled" {
  description = "Flag to enable SQL DTU monitor"
  type        = string
  default     = "true"
}

variable "dtu_extra_tags" {
  description = "Extra tags for SQL DTU monitor"
  type        = list(string)
  default     = []
}

variable "dtu_message" {
  description = "Custom message for SQL DTU monitor"
  type        = string
  default     = ""
}

variable "dtu_time_aggregator" {
  description = "Monitor aggregator for SQL DTU [available values: min, max or avg]"
  type        = string
  default     = "avg"
}

variable "dtu_timeframe" {
  description = "Monitor timeframe for SQL DTU [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "dtu_threshold_warning" {
  description = "Amount of DTU used (warning threshold)"
  default     = "85"
}

variable "dtu_threshold_critical" {
  description = "Amount of DTU used (critical threshold)"
  default     = "90"
}

variable "deadlock_enabled" {
  description = "Flag to enable SQL Deadlock monitor"
  type        = string
  default     = "true"
}

variable "deadlock_extra_tags" {
  description = "Extra tags for SQL Deadlock monitor"
  type        = list(string)
  default     = []
}

variable "deadlock_message" {
  description = "Custom message for SQL Deadlock monitor"
  type        = string
  default     = ""
}

variable "deadlock_timeframe" {
  description = "Monitor timeframe for SQL Deadlock [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "deadlock_threshold_critical" {
  description = "Amount of Deadlocks (critical threshold)"
  default     = "1"
}

