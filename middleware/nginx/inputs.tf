# Global Terraform
variable "environment" {
  description = "Architecture Environment"
  type        = string
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

# Nginx Middleware specific

variable "nginx_connect_enabled" {
  description = "Flag to enable Nginx status monitor"
  type        = string
  default     = "true"
}

variable "nginx_connect_extra_tags" {
  description = "Extra tags for Nginx process monitor"
  type        = list(string)
  default     = []
}

variable "nginx_connect_message" {
  description = "Custom message for Nginx status monitor"
  type        = string
  default     = ""
}

variable "nginx_connect_threshold_warning" {
  description = "Nginx status monitor (warning threshold)"
  type        = string
  default     = 3
}

variable "nginx_connect_no_data_timeframe" {
  description = "Nginx status monitor no data timeframe"
  type        = string
  default     = 10
}

variable "nginx_dropped_enabled" {
  description = "Flag to enable Nginx dropped monitor"
  type        = string
  default     = "true"
}

variable "nginx_dropped_extra_tags" {
  description = "Extra tags for Nginx dropped connections monitor"
  type        = list(string)
  default     = []
}

variable "nginx_dropped_message" {
  description = "Custom message for Nginx dropped connections monitor"
  type        = string
  default     = ""
}

variable "nginx_dropped_time_aggregator" {
  description = "Monitor aggregator for Nginx dropped connections [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "nginx_dropped_timeframe" {
  description = "Monitor timeframe for Nginx dropped connections [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "nginx_dropped_threshold_critical" {
  description = "Nginx dropped connections critical threshold"
  default     = 0
}

