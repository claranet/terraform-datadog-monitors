# Global Terraform
variable "environment" {
  description = "Architecture Environment"
  type        = "string"
}

# Global DataDog
variable "delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 600
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

# Azure SQL Database specific
variable "cpu_silenced" {
  description = "Groups to mute for SQL CPU monitor"
  type        = "map"
  default     = {}
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
  description = "Groups to mute for SQL disk space monitor"
  type        = "map"
  default     = {}
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
  description = "Groups to mute for SQL DTU monitor"
  type        = "map"
  default     = {}
}

variable "dtu_threshold_warning" {
  description = "Amount of DTU used (warning threshold)"
  default     = "85"
}

variable "dtu_threshold_critical" {
  description = "Amount of DTU used (critical threshold)"
  default     = "90"
}

variable "deadlock_silenced" {
  description = "Groups to mute for SQL Deadlock monitor"
  type        = "map"
  default     = {}
}

variable "deadlock_threshold_critical" {
  description = "Amount of Deadlocks (critical threshold)"
  default     = "1"
}
