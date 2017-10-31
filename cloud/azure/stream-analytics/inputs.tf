# Global Terraform
variable "environment" {
  description = "Architecture environment"
  type        = "string"
}

variable "message" {
  description = "Message sent when a monitor is triggered"
}

# Global DataDog
variable "use_filter_tags" {
  description = "Filter the data with service tags if true"
  default     = "true"
}

variable "notify_no_data" {
  default = "false"
}

variable "delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 600
}

# Monitor specific
variable "su_utilization_threshold_warning" {
  default = 60
}

variable "su_utilization_threshold_critical" {
  default = 80
}

variable "function_requests_threshold_warning" {
  default = 0
}

variable "function_requests_threshold_critical" {
  default = 10
}

variable "conversion_errors_threshold_warning" {
  default = 0
}

variable "conversion_errors_threshold_critical" {
  default = 10
}

variable "runtime_errors_threshold_warning" {
  default = 0
}

variable "runtime_errors_threshold_critical" {
  default = 10
}
