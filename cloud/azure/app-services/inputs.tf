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
  default     = 600
}

###################################
###   RESPONSE TIME VARIABLES   ###
###################################

variable "response_time_threshold_critical" {
  default     = 0.8
  description = "Alerting threshold in seconds"
}

variable "response_time_threshold_warning" {
  default     = 0.4
  description = "Warning threshold in seconds"
}

###################################
###   MEMORY USAGE VARIABLES   ###
###################################

variable "memory_usage_threshold_critical" {
  default     = 52430000
  description = "Alerting threshold in Mib"
}

variable "memory_usage_threshold_warning" {
  default     = 33550000
  description = "Warning threshold in MiB"
}

#################################
###   HTTP 5xx status pages   ###
#################################

variable "http_5xx_requests_threshold_critical" {
  default     = 20
  description = "Maximum critical acceptable percent of 5xx errors"
}

variable "http_5xx_requests_threshold_warning" {
  default     = 10
  description = "Maximum warning acceptable percent of 5xx errors"
}

#################################
###   HTTP 4xx status pages   ###
#################################

variable "http_4xx_requests_threshold_critical" {
  default     = 30
  description = "Maximum critical acceptable percent of 4xx errors"
}

variable "http_4xx_requests_threshold_warning" {
  default     = 15
  description = "Maximum warning acceptable percent of 4xx errors"
}

#################################
###   HTTP 2xx status pages   ###
#################################

variable "http_2xx_requests_threshold_critical" {
  default     = 90
  description = "Minimum critical acceptable percent of 2xx requests"
}

variable "http_2xx_requests_threshold_warning" {
  default     = 95
  description = "Minimum warning acceptable percent of 2xx requests"
}
