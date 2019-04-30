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

variable "prefix_slug" {
  description = "Prefix string to prepend between brackets on every monitors names"
  default     = ""
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

# Azure SQL Elastic Pool specific variables
variable "cpu_silenced" {
  description = "Groups to mute for SQL Elastic Pool CPU monitor"
  type        = "map"
  default     = {}
}

variable "cpu_enabled" {
  description = "Flag to enable SQL Elastic Pool CPU monitor"
  type        = "string"
  default     = "true"
}

variable "cpu_extra_tags" {
  description = "Extra tags for SQL Elastic Pool CPU monitor"
  type        = "list"
  default     = []
}

variable "cpu_message" {
  description = "Custom message for SQL Elastic Pool CPU monitor"
  type        = "string"
  default     = ""
}

variable "cpu_time_aggregator" {
  description = "Monitor aggregator for SQL Elastic Pool CPU [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "cpu_timeframe" {
  description = "Monitor timeframe for SQL Elastic Pool CPU [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
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

variable "diskspace_silenced" {
  description = "Groups to mute for SQL Elastic Pool disk space monitor"
  type        = "map"
  default     = {}
}

variable "diskspace_enabled" {
  description = "Flag to enable SQL Elastic Pool disk space monitor"
  type        = "string"
  default     = "true"
}

variable "diskspace_extra_tags" {
  description = "Extra tags for SQL Elastic Pool disk space monitor"
  type        = "list"
  default     = []
}

variable "diskspace_message" {
  description = "Custom message for SQL Elastic Pool disk space monitor"
  type        = "string"
  default     = ""
}

variable "diskspace_time_aggregator" {
  description = "Monitor aggregator for SQL Elastic Pool disk space [available values: min, max or avg]"
  type        = "string"
  default     = "max"
}

variable "diskspace_timeframe" {
  description = "Monitor timeframe for SQL Elastic Pool disk space [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
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

variable "dtu_silenced" {
  description = "Groups to mute for SQL Elastic Pool DTU monitor"
  type        = "map"
  default     = {}
}

variable "dtu_enabled" {
  description = "Flag to enable SQL Elastic Pool DTU monitor"
  type        = "string"
  default     = "true"
}

variable "dtu_extra_tags" {
  description = "Extra tags for SQL Elastic Pool DTU monitor"
  type        = "list"
  default     = []
}

variable "dtu_message" {
  description = "Custom message for SQL Elastic Pool DTU monitor"
  type        = "string"
  default     = ""
}

variable "dtu_time_aggregator" {
  description = "Monitor aggregator for SQL Elastic Pool DTU [available values: min, max or avg]"
  type        = "string"
  default     = "avg"
}

variable "dtu_timeframe" {
  description = "Monitor timeframe for SQL Elastic Pool DTU [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
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
