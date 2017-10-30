variable "environment" {}

variable "down_message" {}

variable "failed_requests_message" {}

variable "errors_message" {}

variable "delay" {
  default = 600
}

variable "failed_requests_rate_thresold_critical" {
  default = 5
}

variable "failed_requests_rate_thresold_warning" {
  default = 3
}

variable "errors_rate_thresold_critical" {
  default = 5
}

variable "errors_rate_thresold_warning" {
  default = 3
}

variable "use_filter_tags" {
  default = "true"
}
