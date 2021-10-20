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

variable "new_group_delay" {
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

#Ingress

variable "ingress_5xx_enabled" {
  description = "Flag to enable Ingress 5xx errors monitor"
  type        = string
  default     = "true"
}

variable "ingress_5xx_extra_tags" {
  description = "Extra tags for Ingress 5xx errors monitor"
  type        = list(string)
  default     = []
}

variable "ingress_5xx_message" {
  description = "Message sent when an alert is triggered"
  default     = ""
}

variable "ingress_5xx_time_aggregator" {
  description = "Monitor aggregator for Ingress 5xx errors [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "ingress_5xx_timeframe" {
  description = "Monitor timeframe for Ingress 5xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "ingress_5xx_threshold_critical" {
  type        = string
  default     = "20"
  description = "5xx critical threshold in percentage"
}

variable "ingress_5xx_threshold_warning" {
  type        = string
  default     = "10"
  description = "5xx warning threshold in percentage"
}

variable "ingress_4xx_enabled" {
  description = "Flag to enable Ingress 4xx errors monitor"
  type        = string
  default     = "true"
}

variable "ingress_4xx_extra_tags" {
  description = "Extra tags for Ingress 4xx errors monitor"
  type        = list(string)
  default     = []
}

variable "ingress_4xx_message" {
  description = "Message sent when an alert is triggered"
  default     = ""
}

variable "ingress_4xx_time_aggregator" {
  description = "Monitor aggregator for Ingress 4xx errors [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "ingress_4xx_timeframe" {
  description = "Monitor timeframe for Ingress 4xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "ingress_4xx_threshold_critical" {
  type        = string
  default     = "40"
  description = "4xx critical threshold in percentage"
}

variable "ingress_4xx_threshold_warning" {
  type        = string
  default     = "20"
  description = "4xx warning threshold in percentage"
}

variable "artificial_requests_count" {
  default     = 5
  description = "Number of false requests used to mitigate false positive in case of low trafic"
}

