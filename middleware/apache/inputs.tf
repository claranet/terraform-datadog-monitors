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

variable "new_host_delay" {
  description = "Delay in seconds before monitor new resource"
  default     = 300
}

variable "message" {
  description = "Message sent when an alert is triggered"
}

variable "filter_tags_use_defaults" {
  description = "Use default filter tags convention"
  default     = "true"
}

variable "filter_tags_custom" {
  description = "Tags used for custom filtering when filter_tags_use_defaults is false"
  default     = "*"
}

# Apache Middleware specific

variable "apache_connect_silenced" {
  description = "Groups to mute for Apache status monitor"
  type        = "map"
  default     = {}
}

variable "apache_connect_message" {
  description = "Custom message for Apache status monitor"
  type        = "string"
  default     = ""
}

variable "apache_connect_threshold_critical" {
  description = "Apache status monitor (critical threshold)"
  type        = "string"
  default     = 1.1754943508222875e-38
}
