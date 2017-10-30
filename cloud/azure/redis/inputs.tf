# Global Terraform
variable "client_name" {
  type = "string"
}

variable "environment" {
  type = "string"
}

# Global DataDog
variable "message" {
}

variable "delay" {
  default = 600
}

# Azure Redis specific
variable "evictedkeys_limit_threshold_warning" {
  default = 0
}
variable "evictedkeys_limit_threshold_critical" {
  default = 100
}
variable "percent_processor_time_threshold_critical" {
  default = 80
}
variable "percent_processor_time_threshold_warning" {
  default = 60
}
variable "server_load_rate_threshold_critical" {
  default = 90
}
variable "server_load_rate_threshold_warning" {
  default = 70
}
