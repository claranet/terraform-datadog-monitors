# Global Terraform
variable "environment" {
  description = "Architecture environment"
  type = "string"
}

# Global DataDog
variable "message" {
  description = "Message sent when a Redis monitor is triggered"
}

variable "delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 600
}

variable "filter_tags_use_defaults" {
  description = "Use default filter tags convention"
  default     = "true"
}

variable "filter_tags_custom" {
  description = "Tags used for custom filtering when filter_tags_use_defaults is false"
  default     = "*"
}

# Azure Storage specific
variable "availability_threshold_critical" {
  description = "Minimum acceptable percent of availability for a storage"
  default = 90
}

variable "successful_requests_threshold_critical" {
  description = "Minimum acceptable percent of successful requests for a storage"
  default = 90
}

variable "latency_threshold_critical" {
  description = "Maximum acceptable end to end latency (ms) for a storage"
  default = 1000
}

variable "timeout_error_requests_threshold_critical" {
  description = "Maximum acceptable percent of timeout error requests for a storage"
  default = 5
}

variable "network_error_requests_threshold_critical" {
  description = "Maximum acceptable percent of network error requests for a storage"
  default = 5
}

variable "throttling_error_requests_threshold_critical" {
  description = "Maximum acceptable percent of throttling error requests for a storage"
  default = 10
}

variable "server_other_error_requests_threshold_critical" {
  description = "Maximum acceptable percent of server other error requests for a storage"
  default = 10
}

variable "client_other_error_requests_threshold_critical" {
  description = "Maximum acceptable percent of client other error requests for a storage"
  default = 15
}

variable "authorization_error_requests_threshold_critical" {
  description = "Maximum acceptable percent of authorization error requests for a storage"
  default = 15
}

