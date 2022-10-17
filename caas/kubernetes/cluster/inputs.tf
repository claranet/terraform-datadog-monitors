# Datadog global variables

variable "environment" {
  description = "Architecture environment"
}

variable "default_tags" {
  description = "Default list of tags that will be associate to all monitor"
  type        = list(string)
  default     = ["type:caas", "provider:kubernetes", "resource:kubernetes-cluster"]
}

variable "extra_tags" {
  description = "Extra optional list of tags to associate to all monitor"
  type        = list(string)
  default     = ["team:claranet"]
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

variable "filter_tags_separator" {
  description = "Set the filter tags separator (, or AND)"
  default     = ","
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

variable "name_prefix" {
  description = "Prefix string to prepend before every monitors names. Sustitute to the prefix_slug variable"
  default     = ""
}

variable "notify_no_data" {
  description = "Will raise no data alert if set to true"
  default     = true
}

variable "apiserver_no_data_timeframe" {
  description = "Number of minutes before reporting no data"
  type        = string
  default     = 10
}

# Datadog monitors variables

variable "apiserver_enabled" {
  description = "Flag to enable API server monitor"
  type        = string
  default     = "true"
}

variable "apiserver_extra_tags" {
  description = "Extra tags for API server monitor"
  type        = list(string)
  default     = []
}

variable "apiserver_message" {
  description = "Custom message for API server monitor"
  type        = string
  default     = ""
}

variable "apiserver_threshold_warning" {
  description = "API server monitor (warning threshold)"
  type        = string
  default     = 3
}

