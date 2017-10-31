# Global Terraform
variable "client_name" {
  description = "Client name"
  type        = "string"
}

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
  default     = 600
}

variable "use_filter_tags" {
  description = "Filter the data with service tags if true"
  default     = "true"
}

# Azure Redis specific
variable "evictedkeys_limit_threshold_warning" {
  description = "Evicted keys limit (warning threshold)"
  default     = 0
}

variable "evictedkeys_limit_threshold_critical" {
  description = "Evicted keys limit (critical threshold)"
  default     = 100
}

variable "percent_processor_time_threshold_critical" {
  description = "Processor time percent (critical threshold)"
  default     = 80
}

variable "percent_processor_time_threshold_warning" {
  description = "Processor time percent (warning threshold)"
  default     = 60
}

variable "server_load_rate_threshold_critical" {
  description = "Server CPU load rate (critical threshold)"
  default     = 90
}

variable "server_load_rate_threshold_warning" {
  description = "Server CPU load rate (warning threshold)"
  default     = 70
}
