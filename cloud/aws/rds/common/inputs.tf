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

# AWS RDS instance specific

variable "cpu_enabled" {
  description = "Flag to enable RDS CPU usage monitor"
  type        = "string"
  default     = "true"
}

variable "cpu_extra_tags" {
  description = "Extra tags for RDS CPU usage monitor"
  type        = "list"
  default     = []
}

variable "cpu_message" {
  description = "Custom message for RDS CPU usage monitor"
  type        = "string"
  default     = ""
}

variable "cpu_time_aggregator" {
  description = "Monitor aggregator for RDS CPU usage [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "cpu_timeframe" {
  description = "Monitor timeframe for RDS CPU usage [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
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

variable "diskspace_enabled" {
  description = "Flag to enable RDS free diskspace monitor"
  type        = "string"
  default     = "true"
}

variable "diskspace_extra_tags" {
  description = "Extra tags for RDS free diskspace monitor"
  type        = "list"
  default     = []
}

variable "diskspace_message" {
  description = "Custom message for RDS free diskspace monitor"
  type        = "string"
  default     = ""
}

variable "diskspace_time_aggregator" {
  description = "Monitor aggregator for RDS free diskspace [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "diskspace_timeframe" {
  description = "Monitor timeframe for RDS free diskspace [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_15m"
}

variable "diskspace_threshold_warning" {
  description = "Disk free space in percent (warning threshold)"
  default     = "20"
}

variable "diskspace_threshold_critical" {
  description = "Disk free space in percent (critical threshold)"
  default     = "10"
}

variable "replicalag_enabled" {
  description = "Flag to enable RDS replica lag monitor"
  type        = "string"
  default     = "true"
}

variable "replicalag_extra_tags" {
  description = "Extra tags for RDS replica lag monitor"
  type        = "list"
  default     = []
}

variable "replicalag_message" {
  description = "Custom message for RDS replica lag monitor"
  type        = "string"
  default     = ""
}

variable "replicalag_timeframe" {
  description = "Monitor timeframe for RDS replica lag monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "replicalag_threshold_warning" {
  description = "replica lag in seconds (warning threshold)"
  default     = "200"
}

variable "replicalag_threshold_critical" {
  description = "replica lag in seconds (critical threshold)"
  default     = "300"
}
