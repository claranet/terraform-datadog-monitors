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

# Nginx Middleware specific

variable "nginx_connect_silenced" {
  description = "Groups to mute for Nginx process monitor"
  type        = "map"
  default     = {}
}

variable "nginx_connect_message" {
  description = "Custom message for Nginx process monitor"
  type        = "string"
  default     = ""
}
