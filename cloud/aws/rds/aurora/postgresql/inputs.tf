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

# AWS RDS Aurora instance specific

variable "aurora_replicalag_enabled" {
  description = "Flag to enable RDS Aurora replica lag monitor"
  type        = string
  default     = "true"
}

variable "aurora_replicalag_extra_tags" {
  description = "Extra tags for RDS Aurora replica lag monitor"
  type        = list(string)
  default     = []
}

variable "aurora_replicalag_message" {
  description = "Custom message for RDS Aurora replica lag monitor"
  type        = string
  default     = ""
}

variable "aurora_replicalag_timeframe" {
  description = "Monitor timeframe for RDS Aurora replica lag monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
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

