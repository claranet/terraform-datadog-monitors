# Global Terraform
variable "environment" {
  description = "Architecture environment"
  type = "string"
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
  description = "Message sent when an alert is triggered"
}

variable "delay" {
  description = "Delay in seconds for the metric evaluation"
  default = 600
}

variable "use_filter_tags" {
  description = "Filter the data with service tags if true"
  default     = "true"
}

variable "failed_requests_rate_thresold_critical" {
  description = "Failed requests ratio (percentage) to trigger the critical alert"
  default = 3
}

variable "failed_requests_rate_thresold_warning" {
  description = "Failed requests ratio (percentage) to trigger a warning alert"
  default = 1
}

variable "errors_rate_thresold_critical" {
  description = "Errors ratio (percentage) to trigger the critical alert"
  default = 3
}

variable "errors_rate_thresold_warning" {
  description = "Errors ratio (percentage) to trigger a warning alert"
  default = 1
}
