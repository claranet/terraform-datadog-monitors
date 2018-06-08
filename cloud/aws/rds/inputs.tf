# Global Terraform
variable "environment" {
  description = "Architecture Environment"
  type        = "string"
}

# Global DataDog
variable "delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
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

variable "aurora_cluster_type" {
  description = "RDS Aurora cluster monitoring.  If empty, single RDS instance monitoring. [available values: `mysql`, `postgresql`]"
  type        = "string"
  default     = ""
}

# AWS RDS instance specific

variable "cpu_silenced" {
  description = "Groups to mute for RDS CPU usage monitor"
  type        = "map"
  default     = {}
}

variable "cpu_message" {
  description = "Custom message for RDS CPU usage monitor"
  type        = "string"
  default     = ""
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

variable "diskspace_silenced" {
  description = "Groups to mute for RDS free diskspace monitor"
  type        = "map"
  default     = {}
}

variable "diskspace_message" {
  description = "Custom message for RDS free diskspace monitor"
  type        = "string"
  default     = ""
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

variable "aurora_replicalag_silenced" {
  description = "Groups to mute for RDS Aurora replica lag monitor"
  type        = "map"
  default     = {}
}

variable "aurora_replicalag_message" {
  description = "Custom message for RDS Aurora replica lag monitor"
  type        = "string"
  default     = ""
}

variable "aurora_replicalag_timeframe" {
  description = "Monitor timeframe for RDS Aurora replica lag monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "aurora_replicalag_threshold_warning" {
  description = "Aurora replica lag in milliseconds (warning threshold)"
  default     = "100"
}

variable "aurora_replicalag_threshold_critical" {
  description = "Aurora replica lag in milliseconds (critical threshold)"
  default     = "200"
}
