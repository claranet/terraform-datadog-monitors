variable "environment" {
  description = "Environment"
  type        = "string"
}

variable "filter_tags" {
  description = "Tags used for filtering"
  default     = "*"
}

variable "message" {
  description = "Message sent when a monitor is triggered"
}

variable "delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
}

###################################
###   LATENCY VARIABLES   ###
###################################

variable "latency_silenced" {
  description = "Groups to mute for API Gateway latency monitor"
  type        = "map"
  default     = {}
}

variable "latency_message" {
  description = "Custom message for API Gateway latency monitor"
  type        = "string"
  default     = ""
}

variable "latency_threshold_critical" {
  default     = 800
  description = "Alerting threshold in milliseconds"
}

variable "latency_threshold_warning" {
  default     = 400
  description = "Warning threshold in milliseconds"
}

#################################
###   HTTP 5xx status pages   ###
#################################

variable "http_5xx_requests_silenced" {
  description = "Groups to mute for API Gateway HTTP 5xx requests monitor"
  type        = "map"
  default     = {}
}

variable "http_5xx_requests_message" {
  description = "Custom message for API Gateway HTTP 5xx requests monitor"
  type        = "string"
  default     = ""
}

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

variable "http_4xx_requests_silenced" {
  description = "Groups to mute for API Gateway HTTP 4xx requests monitor"
  type        = "map"
  default     = {}
}

variable "http_4xx_requests_message" {
  description = "Custom message for API Gateway HTTP 4xx requests monitor"
  type        = "string"
  default     = ""
}

variable "http_4xx_requests_threshold_critical" {
  default     = 30
  description = "Maximum critical acceptable percent of 4xx errors"
}

variable "http_4xx_requests_threshold_warning" {
  default     = 15
  description = "Maximum warning acceptable percent of 4xx errors"
}

variable "artificial_requests_count" {
  default     = 5
  description = "Number of false requests used to mitigate false positive in case of low trafic"
}
