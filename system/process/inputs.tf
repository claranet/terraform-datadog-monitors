# Global Terraform
variable "environment" {
  description = "Architecture Environment"
  type        = "string"
}

# Global DataDog
variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 15
}

variable "new_host_delay" {
  description = "Delay in seconds before monitor new resource"
  default     = 300
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

# Process check

variable "process_check_silenced" {
  description = "Groups to mute for process check monitor"
  type        = "map"
  default     = {}
}

variable "process_check_enabled" {
  description = "Flag to enable process check monitor"
  type        = "string"
  default     = "true"
}

variable "process_check_extra_tags" {
  description = "Extra tags for process check monitor"
  type        = "list"
  default     = []
}

variable "process_check_message" {
  description = "Custom message for process check monitor"
  type        = "string"
  default     = ""
}

variable "process_check_no_data_timeframe" {
  description = "Timeframe for process check monitor to alert on no data"
  type        = "string"
  default     = 20
}
