# Global Terraform
variable "team" {
  type    = "string"
  default = "k8s"
}

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

#Ingress
variable "ingress_5xx_silenced" {
  description = "Groups to mute for Ingress 5xx errors monitor"
  type        = "map"
  default     = {}
}

variable "ingress_5xx_message" {
  description = "Message sent when an alert is triggered"
  default     = ""
}

variable "ingress_5xx_timeframe" {
  description = "Monitor timeframe for Ingress 5xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "ingress_5xx_threshold_critical" {
  type    = "string"
  default = "10"
}

variable "ingress_5xx_threshold_warning" {
  type    = "string"
  default = "5"
}

variable "artificial_requests_count" {
  default     = 5
  description = "Number of false requests used to mitigate false positive in case of low trafic"
}
