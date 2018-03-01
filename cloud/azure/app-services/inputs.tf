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

# Azure App Services specific variables
variable "response_time_silenced" {
  description = "Groups to mute for App Services response time monitor"
  type        = "map"
  default     = {}
}

variable "response_time_message" {
  description = "Custom message for App Services response time monitor"
  type        = "string"
  default     = ""
}

variable "response_time_threshold_critical" {
  default     = 10
  description = "Alerting threshold for response time in seconds"
}

variable "response_time_threshold_warning" {
  default     = 5
  description = "Warning threshold for response time in seconds"
}

variable "memory_usage_silenced" {
  description = "Groups to mute for App Services memory usage monitor"
  type        = "map"
  default     = {}
}

variable "memory_usage_message" {
  description = "Custom message for App Services memory usage monitor"
  type        = "string"
  default     = ""
}

variable "memory_usage_threshold_critical" {
  default     = 1073741824                  # 1Gb
  description = "Alerting threshold in Mib"
}

variable "memory_usage_threshold_warning" {
  default     = 536870912                  # 512Mb
  description = "Warning threshold in MiB"
}

variable "http_4xx_requests_silenced" {
  description = "Groups to mute for App Services 4xx requests monitor"
  type        = "map"
  default     = {}
}

variable "http_4xx_requests_message" {
  description = "Custom message for App Services 4xx requests monitor"
  type        = "string"
  default     = ""
}

variable "http_4xx_requests_threshold_critical" {
  default     = 90
  description = "Maximum critical acceptable percent of 4xx errors"
}

variable "http_4xx_requests_threshold_warning" {
  default     = 50
  description = "Warning regarding acceptable percent of 4xx errors"
}

variable "http_5xx_requests_silenced" {
  description = "Groups to mute for App Services 5xx requests monitor"
  type        = "map"
  default     = {}
}

variable "http_5xx_requests_message" {
  description = "Custom message for App Services 5xx requests monitor"
  type        = "string"
  default     = ""
}

variable "http_5xx_requests_threshold_critical" {
  default     = 90
  description = "Maximum critical acceptable percent of 5xx errors"
}

variable "http_5xx_requests_threshold_warning" {
  default     = 50
  description = "Warning regarding acceptable percent of 5xx errors"
}

variable "http_successful_requests_silenced" {
  description = "Groups to mute for App Services successful requests monitor"
  type        = "map"
  default     = {}
}

variable "http_successful_requests_message" {
  description = "Custom message for App Services successful requests monitor"
  type        = "string"
  default     = ""
}

variable "http_successful_requests_threshold_critical" {
  default     = 10
  description = "Minimum critical acceptable percent of 2xx & 3xx requests"
}

variable "http_successful_requests_threshold_warning" {
  default     = 30
  description = "Warning regarding acceptable percent of 2xx & 3xx requests"
}
