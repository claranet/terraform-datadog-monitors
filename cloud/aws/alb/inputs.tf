# Datadog global variables

variable "environment" {
  description = "Architecture environment"
  type        = "string"
}

variable "filter_tags_use_defaults" {
  description = "Use default filter tags convention"
  default     = "true"
}

variable "filter_tags_custom" {
  description = "Tags used for custom filtering when filter_tags_use_defaults is false"
  default     = "*"
}

variable "message" {
  description = "Message sent when a monitor is triggered"
}

variable "delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
}

# Datadog monitors variables

variable "latency_threshold_critical" {
  default     = 1000
  description = "latency critical threshold in milliseconds"
}

variable "latency_threshold_warning" {
  default     = 500
  description = "latency warning threshold in milliseconds"
}

variable "httpcode_elb_4xx_threshold_critical" {
  default     = 80
  description = "loadbalancer 4xx critical threshold in percentage"
}

variable "httpcode_elb_4xx_threshold_warning" {
  default     = 60
  description = "loadbalancer 4xx warning threshold in percentage"
}

variable "httpcode_target_4xx_threshold_critical" {
  default     = 80
  description = "target 4xx critical threshold in percentage"
}

variable "httpcode_target_4xx_threshold_warning" {
  default     = 60
  description = "target 4xx warning threshold in percentage"
}

variable "httpcode_elb_5xx_threshold_critical" {
  default     = 80
  description = "loadbalancer 5xxcritical threshold in percentage"
}

variable "httpcode_elb_5xx_threshold_warning" {
  default     = 60
  description = "loadbalancer 5xx warning threshold in percentage"
}

variable "httpcode_target_5xx_threshold_critical" {
  default     = 80
  description = "target 5xx critical threshold in percentage"
}

variable "httpcode_target_5xx_threshold_warning" {
  default     = 60
  description = "target 5xx warning threshold in percentage"
}
