# Global variables
variable "tags" {
  type    = list(string)
  default = ["type:saas", "provider:new-relic", "resource:new-relic"]
}

# Global DataDog
variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
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

#
# APP Error Rate
#
variable "app_error_rate_enabled" {
  description = "Flag to enable APP Error Rate monitor"
  type        = string
  default     = "true"
}

variable "app_error_rate_message" {
  description = "Custom message for the APP Error Rate monitor"
  type        = string
  default     = ""
}

variable "app_error_rate_time_aggregator" {
  description = "Time aggregator for the APP Error Rate monitor"
  type        = string
  default     = "min"
}

variable "app_error_rate_timeframe" {
  description = "Timeframe for the APP Error Rate monitor"
  type        = string
  default     = "last_5m"
}

variable "app_error_rate_threshold_warning" {
  description = "APP Error Rate warning threshold"
  type        = string
  default     = 1
}

variable "app_error_rate_threshold_critical" {
  description = "APP Error Rate  critical threshold"
  type        = string
  default     = 5
}

variable "app_error_rate_extra_tags" {
  description = "Extra tags for New Relic APP Error Rate monitor"
  type        = list(string)
  default     = []
}

#
# APP Apdex Score
#
variable "app_apdex_score_enabled" {
  description = "Flag to enable APP Apdex Score monitor"
  type        = string
  default     = "true"
}

variable "app_apdex_score_message" {
  description = "Custom message for the APP Apdex Score monitor"
  type        = string
  default     = ""
}

variable "app_apdex_score_time_aggregator" {
  description = "Time aggregator for the APP Apdex Score monitor"
  type        = string
  default     = "avg"
}

variable "app_apdex_score_timeframe" {
  description = "Timeframe for the APP Apdex Score monitor"
  type        = string
  default     = "last_15m"
}

variable "app_apdex_score_threshold_warning" {
  description = "APP Apdex Score warning threshold"
  type        = string
  default     = 0.5
}

variable "app_apdex_score_threshold_critical" {
  description = "APP Apdex Score critical threshold"
  type        = string
  default     = 0.25
}

variable "app_apdex_score_extra_tags" {
  description = "Extra tags for New Relic APP Apdex Score monitor"
  type        = list(string)
  default     = []
}
