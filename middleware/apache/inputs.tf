# Global Terraform
variable "environment" {
  description = "Architecture Environment"
  type        = "string"
}

# Global DataDog
variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 15
}

variable "message" {
  description = "Message sent when an alert is triggered"
}

# Apache Middleware specific

variable "apache_process_silenced" {
  description = "Groups to mute for Apache process monitor"
  type        = "map"
  default     = {}
}

variable "apache_process_message" {
  description = "Custom message for Apache process monitor"
  type        = "string"
  default     = ""
}
