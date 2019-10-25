# Global Terraform
variable "environment" {
  description = "Architecture Environment"
  type        = string
}

# Global DataDog
variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 15
  type        = number
}

variable "new_host_delay" {
  description = "Delay in seconds before monitor new resource"
  default     = 300
  type        = number
}

variable "prefix_slug" {
  description = "Prefix string to prepend between brackets on every monitors names"
  default     = ""
  type        = string
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

# supervisord Middleware specific

variable "supervisord_connect_enabled" {
  description = "Flag to enable supervisord status monitor"
  type        = string
  default     = "true"
}

variable "supervisord_connect_extra_tags" {
  description = "Extra tags for supervisord process monitor"
  type        = list(string)
  default     = []
}

variable "supervisord_connect_message" {
  description = "Custom message for supervisord status monitor"
  type        = string
  default     = ""
}

variable "supervisord_connect_threshold_warning" {
  description = "supervisord status monitor (warning threshold)"
  type        = string
  default     = 3
}

variable "supervisord_process_not_available_enabled" {
  description = "Flag to enable supervisord process status monitor"
  type        = string
  default     = "true"
}

variable "supervisord_process_not_available_extra_tags" {
  description = "Extra tags for supervisord process monitor"
  type        = list(string)
  default     = []
}

variable "supervisord_process_not_available_message" {
  description = "Custom message for supervisord process status monitor"
  type        = string
  default     = ""
}

variable "supervisord_process_not_available_threshold_warning" {
  description = "supervisord process status monitor (warning threshold)"
  type        = string
  default     = 3
}
