# Global variables
variable "tags" {
  type    = list(string)
  default = ["type:cloud", "provider:azure", "resource:keyvault"]
}

# Datadog variables
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

variable "keyvault_status_no_data_timeframe" {
  description = "Number of minutes before reporting no data"
  type        = string
  default     = 10
}

# Azure Key Vault specific variables
variable "status_enabled" {
  description = "Flag to enable Key Vault status monitor"
  type        = string
  default     = "true"
}

variable "status_message" {
  description = "Custom message for Key Vault status monitor"
  type        = string
  default     = ""
}

variable "status_time_aggregator" {
  description = "Monitor aggregator for Key Vault status [available values: min, max or avg]"
  type        = string
  default     = "max"
}

variable "status_timeframe" {
  description = "Monitor timeframe for Key Vault status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  default     = "last_5m"
}

variable "status_extra_tags" {
  description = "Extra tags for Key Vault status monitor"
  type        = list(string)
  default     = []
}

variable "api_result_enabled" {
  description = "Flag to enable Key Vault API result monitor"
  type        = string
  default     = "true"
}

variable "api_result_message" {
  description = "Custom message for Key Vault API result monitor"
  type        = string
  default     = ""
}

variable "api_result_time_aggregator" {
  description = "Monitor aggregator for Key Vault API result [available values: min, max or avg]"
  type        = string
  default     = "max"
}

variable "api_result_timeframe" {
  description = "Monitor timeframe for Key Vault API result [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  default     = "last_5m"
}

variable "api_result_threshold_critical" {
  description = "Critical threshold for Key Vault API result rate"
  default     = 10
}

variable "api_result_threshold_warning" {
  description = "Warning threshold for Key Vault API result rate"
  default     = 30
}

variable "api_result_extra_tags" {
  description = "Extra tags for Key Vault API result monitor"
  type        = list(string)
  default     = []
}

variable "api_latency_enabled" {
  description = "Flag to enable Key Vault API latency monitor"
  type        = string
  default     = "true"
}

variable "api_latency_message" {
  description = "Custom message for Key Vault API latency monitor"
  type        = string
  default     = ""
}

variable "api_latency_time_aggregator" {
  description = "Monitor aggregator for Key Vault API latency [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "api_latency_timeframe" {
  description = "Monitor timeframe for Key Vault API latency [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  default     = "last_5m"
}

variable "api_latency_threshold_critical" {
  description = "Critical threshold for Key Vault API latency rate"
  default     = 100
}

variable "api_latency_threshold_warning" {
  description = "Warning threshold for Key Vault API latency rate"
  default     = 80
}

variable "api_latency_extra_tags" {
  description = "Extra tags for Key Vault API latency monitor"
  type        = list(string)
  default     = []
}

