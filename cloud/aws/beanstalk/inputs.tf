# Global variables
variable "tags" {
  type    = list(string)
  default = ["type:cloud", "provider:aws", "resource:beanstalk"]
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

variable "health_no_data_timeframe" {
  description = "Number of minutes before reporting no data"
  type        = string
  default     = 20
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

# AWS Beanstalk monitor variables

variable "health_enabled" {
  description = "Flag to enable Beanstalk Health monitor"
  type        = string
  default     = "true"
}

variable "health_message" {
  description = "Custom message for health monitor"
  default     = ""
}

variable "health_time_aggregator" {
  description = "Monitor aggregator for beanstalk health [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "health_timeframe" {
  description = "Monitor timeframe for beanstalk health [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_10m"
}

variable "health_threshold_critical" {
  description = "Health critical threshold (see the `aws.elasticbeanstalk.environment_health` values in the Datadog documentation)"
  default     = 20
}

variable "health_threshold_warning" {
  description = "Health critical threshold (see the `aws.elasticbeanstalk.environment_health` values in the Datadog documentation)"
  default     = 15
}

variable "health_extra_tags" {
  description = "Extra tags for health monitor"
  type        = list(string)
  default     = []
}

variable "application_latency_p90_enabled" {
  description = "Flag to enable Beanstalk application latency P90 monitor"
  type        = string
  default     = "true"
}

variable "application_latency_p90_message" {
  description = "Custom message for application latency P90 monitor"
  default     = ""
}

variable "application_latency_p90_time_aggregator" {
  description = "Monitor aggregator for beanstalk application latency P90 [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "application_latency_p90_timeframe" {
  description = "Monitor timeframe for beanstalk application latency P90 [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "application_latency_p90_threshold_critical" {
  description = "P90 Latency critical threshold in seconds"
  default     = 0.5
}

variable "application_latency_p90_threshold_warning" {
  description = "P90 Latency warning threshold in seconds"
  type        = string
  default     = 0.3
}

variable "application_latency_p90_extra_tags" {
  description = "Extra tags for application latency P90 monitor"
  type        = list(string)
  default     = []
}

variable "application_5xx_error_rate_enabled" {
  description = "Flag to enable Beanstalk application 5xx error ratemonitor"
  type        = string
  default     = "true"
}

variable "application_5xx_error_rate_message" {
  description = "Custom message for application 5xx error rate"
  default     = ""
}

variable "application_5xx_error_rate_time_aggregator" {
  description = "Monitor aggregator for beanstalk application 5xx error rate [available values: min, max or avg]"
  type        = string
  default     = "sum"
}

variable "application_5xx_error_rate_timeframe" {
  description = "Monitor timeframe for beanstalk application 5xx error rate [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "application_5xx_error_rate_threshold_critical" {
  description = "5xx Error rate critical threshold in percent"
  default     = 5
}

variable "application_5xx_error_rate_threshold_warning" {
  description = "5xx Error rate warning threshold in percent"
  type        = string
  default     = 3
}

variable "application_5xx_error_rate_extra_tags" {
  description = "Extra tags for application 5xx error rate monitor"
  type        = list(string)
  default     = []
}

variable "root_filesystem_usage_enabled" {
  description = "Flag to enable Beanstalk instance file system usage monitor"
  type        = string
  default     = "true"
}

variable "root_filesystem_usage_message" {
  description = "Custom message for application file system usage"
  default     = ""
}

variable "root_filesystem_usage_aggregator" {
  description = "Monitor aggregator for beanstalk instance file system usage [available values: min, max or avg]"
  type        = string
  default     = "max"
}

variable "root_filesystem_usage_timeframe" {
  description = "Monitor timeframe for beanstalk instance file system usage [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "root_filesystem_usage_threshold_critical" {
  description = "File system usage critical threshold in percent"
  type        = string
  default     = 90
}

variable "root_filesystem_usage_threshold_warning" {
  description = "File system usage warning threshold in percent"
  type        = string
  default     = 80
}

variable "root_filesystem_usage_timeout_h" {
  description = "File system usage auto-resolving state (in hours)"
  default     = 0
}

variable "root_filesystem_usage_extra_tags" {
  description = "Extra tags for file system usage monitor"
  type        = list(string)
  default     = []
}

