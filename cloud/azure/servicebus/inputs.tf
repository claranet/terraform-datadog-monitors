# Global Terraform
variable "environment" {
  description = "Architecture Environment"
  type        = "string"
}

# Global DataDog
variable "delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
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

# Azure Service Bus specific variables
variable "status_silenced" {
  description = "Groups to mute for Service Bus status monitor"
  type        = "map"
  default     = {}
}

variable "status_message" {
  description = "Custom message for Service Bus status monitor"
  type        = "string"
  default     = ""
}
