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

#
# Not Responding
#

variable "not_responding_enabled" {
  description = "Flag to enable Kong does not respond monitor"
  type        = string
  default     = "true"
}

variable "not_responding_message" {
  description = "Custom message for Kong does not respond monitor"
  type        = string
  default     = ""
}

variable "not_responding_threshold_warning" {
  description = "Warning threshold for the service check"
  type        = string
  default     = 3
}

variable "not_responding_no_data_timeframe" {
  description = "Kong does not respond monitor no data timeframe"
  type        = string
  default     = 10
}

variable "not_responding_extra_tags" {
  description = "Extra tags for Kong does not respond monitor"
  type        = list(string)
  default     = []
}

#
# Treatment Limit
#
variable "treatment_limit_enabled" {
  description = "Flag to enable Kong Treatment Limit monitor"
  type        = string
  default     = "true"
}

variable "treatment_limit_message" {
  description = "Custom message for the Kong Treatment Limit monitor"
  type        = string
  default     = ""
}

variable "treatment_limit_time_aggregator" {
  description = "Time aggregator for the Kong Treatment Limit monitor"
  type        = string
  default     = "min"
}

variable "treatment_limit_timeframe" {
  description = "Timeframe for the Kong Treatment Limit monitor"
  type        = string
  default     = "last_15m"
}

variable "treatment_limit_threshold_warning" {
  description = "Docker Container Memory Usage warning threshold"
  type        = string
  default     = 0
}

variable "treatment_limit_threshold_critical" {
  description = "Docker Container Memory Usage  critical threshold"
  type        = string
  default     = 20
}

variable "treatment_limit_extra_tags" {
  description = "Extra tags for Kong Treatment Limit monitor"
  type        = list(string)
  default     = []
}


