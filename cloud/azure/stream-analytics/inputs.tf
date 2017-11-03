# Global Terraform
variable "environment" {
  description = "Architecture environment"
  type        = "string"
}

variable "message" {
  description = "Message sent when a monitor is triggered"
}

variable "subscription_id" {
  description = "Azure account id used as filter for monitors"
  type = "string"
}

variable "provider" {
  description = "Cloud provider which the monitor and its based metric depend on"
  type = "string"
  default = "azure"
}

variable "service" {
  description = "Service monitored by this set of monitors"
  type = "string"
  default = "storage"
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

# Azure Stream Analytics specific
variable "su_utilization_threshold_warning" {
  description = "Streaming Unit utilization rate limit (warning threshold)"
  default = 60
}

variable "su_utilization_threshold_critical" {
  description = "Streaming Unit utilization rate limit (critical threshold)"
  default = 80
}

variable "function_requests_threshold_warning" {
  description = "Failed Function Request rate limit (warning threshold)"
  default = 0
}

variable "function_requests_threshold_critical" {
  description = "Failed Function Request rate limit (critical threshold)"
  default = 10
}

variable "conversion_errors_threshold_warning" {
  description = "Conversion errors limit (warning threshold)"
  default = 0
}

variable "conversion_errors_threshold_critical" {
  description = "Conversion errors limit (critical threshold)"
  default = 10
}

variable "runtime_errors_threshold_warning" {
  description = "Runtime errors limit (warning threshold)"
  default = 0
}

variable "runtime_errors_threshold_critical" {
  description = "Runtime errors limit (critical threshold)"
  default = 10
}
