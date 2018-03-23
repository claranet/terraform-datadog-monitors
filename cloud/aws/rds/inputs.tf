# Global Terraform
variable "environment" {
  description = "Architecture Environment"
  type        = "string"
}

# Global DataDog
variable "evaluation_delay" {
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

variable "diskspace_threshold_warning" {
  description = "Disk free space in percent (warning threshold)"
  default     = "20"
}

variable "diskspace_threshold_critical" {
  description = "Disk free space in percent (critical threshold)"
  default     = "10"
}
