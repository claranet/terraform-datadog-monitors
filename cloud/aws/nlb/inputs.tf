# Datadog global variables

variable "environment" {
  description = "Architecture environment"
  type        = string
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

variable "notify_no_data" {
  description = "Will raise no data alert if set to true"
  default     = true
}

variable "nlb_no_healthy_instances_no_data_timeframe" {
  description = "Number of minutes before reporting no data"
  type        = string
  default     = 10
}

# Datadog monitors variables

variable "nlb_no_healthy_instances_enabled" {
  description = "Flag to enable NLB no healthy instances monitor"
  type        = string
  default     = "true"
}

variable "nlb_no_healthy_instances_extra_tags" {
  description = "Extra tags for NLB no healthy instances monitor"
  type        = list(string)
  default     = []
}

variable "nlb_no_healthy_instances_message" {
  description = "Custom message for NLB no healthy instances monitor"
  type        = string
  default     = ""
}

variable "nlb_no_healthy_instances_time_aggregator" {
  description = "Monitor aggregator for NLB no healthy instances [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "nlb_no_healthy_instances_timeframe" {
  description = "Monitor timeframe for NLB no healthy instances [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "nlb_no_healthy_instances_threshold_warning" {
  description = "NLB no healthy instances warning threshold in percentage"
  default     = 100
}
