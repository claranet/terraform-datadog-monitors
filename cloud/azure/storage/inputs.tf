# Global Terraform
variable "environment" {
  description = "Architecture environment"
  type        = "string"
}

# Global DataDog
variable "message" {
  description = "Message sent when a Redis monitor is triggered"
}

variable "delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
}

variable "filter_tags_use_defaults" {
  description = "Use default filter tags convention"
  default     = "true"
}

variable "filter_tags_custom" {
  description = "Tags used for custom filtering when filter_tags_use_defaults is false"
  default     = "*"
}

# Azure Storage specific variables
variable "availability_silenced" {
  description = "Groups to mute for Storage availability monitor"
  type        = "map"
  default     = {}
}

variable "availability_message" {
  description = "Custom message for Storage availability monitor"
  type        = "string"
  default     = ""
}

variable "availability_time_aggregator" {
  description = "Monitor aggregator for Storage availability [available values: min, max or avg]"
  type        = "string"
  default     = "max"
}

variable "availability_timeframe" {
  description = "Monitor timeframe for Storage availability [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "availability_threshold_critical" {
  description = "Minimum acceptable percent of availability for a storage"
  default     = 50
}

variable "availability_threshold_warning" {
  description = "Warning regarding acceptable percent of availability for a storage"
  default     = 90
}

variable "successful_requests_silenced" {
  description = "Groups to mute for Storage sucessful requests monitor"
  type        = "map"
  default     = {}
}

variable "successful_requests_message" {
  description = "Custom message for Storage sucessful requests monitor"
  type        = "string"
  default     = ""
}

variable "successful_requests_time_aggregator" {
  description = "Monitor aggregator for Storage sucessful requests [available values: min, max or avg]"
  type        = "string"
  default     = "max"
}

variable "successful_requests_timeframe" {
  description = "Monitor timeframe for Storage sucessful requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "successful_requests_threshold_critical" {
  description = "Minimum acceptable percent of successful requests for a storage"
  default     = 10
}

variable "successful_requests_threshold_warning" {
  description = "Warning regarding acceptable percent of successful requests for a storage"
  default     = 30
}

variable "latency_silenced" {
  description = "Groups to mute for Storage latency monitor"
  type        = "map"
  default     = {}
}

variable "latency_message" {
  description = "Custom message for Storage latency monitor"
  type        = "string"
  default     = ""
}

variable "latency_time_aggregator" {
  description = "Monitor aggregator for Storage latency [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "latency_timeframe" {
  description = "Monitor timeframe for Storage latency [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "latency_threshold_critical" {
  description = "Maximum acceptable end to end latency (ms) for a storage"
  default     = 2000
}

variable "latency_threshold_warning" {
  description = "Warning regarding acceptable end to end latency (ms) for a storage"
  default     = 1000
}

variable "timeout_error_requests_silenced" {
  description = "Groups to mute for Storage timeout monitor"
  type        = "map"
  default     = {}
}

variable "timeout_error_requests_message" {
  description = "Custom message for Storage timeout monitor"
  type        = "string"
  default     = ""
}

variable "timeout_error_requests_time_aggregator" {
  description = "Monitor aggregator for Storage timeout [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "timeout_error_requests_timeframe" {
  description = "Monitor timeframe for Storage timeout [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "timeout_error_requests_threshold_critical" {
  description = "Maximum acceptable percent of timeout error requests for a storage"
  default     = 90
}

variable "timeout_error_requests_threshold_warning" {
  description = "Warning regarding acceptable percent of timeout error requests for a storage"
  default     = 50
}

variable "network_error_requests_silenced" {
  description = "Groups to mute for Storage network errors monitor"
  type        = "map"
  default     = {}
}

variable "network_error_requests_message" {
  description = "Custom message for Storage network errors monitor"
  type        = "string"
  default     = ""
}

variable "network_error_requests_time_aggregator" {
  description = "Monitor aggregator for Storage network errors [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "network_error_requests_timeframe" {
  description = "Monitor timeframe for Storage network errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "network_error_requests_threshold_critical" {
  description = "Maximum acceptable percent of network error requests for a storage"
  default     = 90
}

variable "network_error_requests_threshold_warning" {
  description = "Warning regarding acceptable percent of network error requests for a storage"
  default     = 50
}

variable "throttling_error_requests_silenced" {
  description = "Groups to mute for Storage throttling error monitor"
  type        = "map"
  default     = {}
}

variable "throttling_error_requests_message" {
  description = "Custom message for Storage throttling error monitor"
  type        = "string"
  default     = ""
}

variable "throttling_error_requests_time_aggregator" {
  description = "Monitor aggregator for Storage throttling errors [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "throttling_error_requests_timeframe" {
  description = "Monitor timeframe for Storage throttling errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "throttling_error_requests_threshold_critical" {
  description = "Maximum acceptable percent of throttling error requests for a storage"
  default     = 90
}

variable "throttling_error_requests_threshold_warning" {
  description = "Warning regarding acceptable percent of throttling error requests for a storage"
  default     = 50
}

variable "server_other_error_requests_silenced" {
  description = "Groups to mute for Storage server other errors monitor"
  type        = "map"
  default     = {}
}

variable "server_other_error_requests_message" {
  description = "Custom message for Storage server other errors monitor"
  type        = "string"
  default     = ""
}

variable "server_other_error_requests_time_aggregator" {
  description = "Monitor aggregator for Storage other errors [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "server_other_error_requests_timeframe" {
  description = "Monitor timeframe for Storage server other errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "server_other_error_requests_threshold_critical" {
  description = "Maximum acceptable percent of server other error requests for a storage"
  default     = 90
}

variable "server_other_error_requests_threshold_warning" {
  description = "Warning regarding acceptable percent of server other error requests for a storage"
  default     = 50
}

variable "client_other_error_requests_silenced" {
  description = "Groups to mute for Storage other errors monitor"
  type        = "map"
  default     = {}
}

variable "client_other_error_requests_message" {
  description = "Custom message for Storage other errors monitor"
  type        = "string"
  default     = ""
}

variable "client_other_error_requests_time_aggregator" {
  description = "Monitor aggregator for Storage other errors [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "client_other_error_requests_timeframe" {
  description = "Monitor timeframe for Storage other errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "client_other_error_requests_threshold_critical" {
  description = "Maximum acceptable percent of client other error requests for a storage"
  default     = 90
}

variable "client_other_error_requests_threshold_warning" {
  description = "Warning regarding acceptable percent of client other error requests for a storage"
  default     = 50
}

variable "authorization_error_requests_silenced" {
  description = "Groups to mute for Storage authorization errors monitor"
  type        = "map"
  default     = {}
}

variable "authorization_error_requests_message" {
  description = "Custom message for Storage authorization errors monitor"
  type        = "string"
  default     = ""
}

variable "authorization_error_requests_time_aggregator" {
  description = "Monitor aggregator for Storage authorization errors [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "authorization_error_requests_timeframe" {
  description = "Monitor timeframe for Storage authorization errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "authorization_error_requests_threshold_critical" {
  description = "Maximum acceptable percent of authorization error requests for a storage"
  default     = 90
}

variable "authorization_error_requests_threshold_warning" {
  description = "Warning regarding acceptable percent of authorization error requests for a storage"
  default     = 50
}
