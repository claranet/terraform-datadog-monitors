# Datadog global variables

variable "environment" {
  description = "Architecture environment"
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

variable "message" {
  description = "Message sent when a monitor is triggered"
}

variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 15
}

variable "new_host_delay" {
  description = "Delay in seconds before monitor new resource"
  default     = 300
}

variable "prefix_slug" {
  description = "Prefix string to prepend between brackets on every monitors names"
  default     = ""
}

# Datadog monitors variables

variable "apiserver_silenced" {
  description = "Groups to mute for API server monitor"
  type        = "map"
  default     = {}
}

variable "apiserver_enabled" {
  description = "Flag to enable API server monitor"
  type        = "string"
  default     = "true"
}

variable "apiserver_extra_tags" {
  description = "Extra tags for API server monitor"
  type        = "list"
  default     = []
}

variable "apiserver_message" {
  description = "Custom message for API server monitor"
  type        = "string"
  default     = ""
}

variable "apiserver_threshold_warning" {
  description = "API server monitor (warning threshold)"
  type        = "string"
  default     = 3
}
