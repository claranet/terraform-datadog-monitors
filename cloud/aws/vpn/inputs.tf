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

variable "filter_tags" {
  description = "Tags used for metrics filtering"
  default     = "*"
}

variable "vpn_status_silenced" {
  description = "Groups to mute for VPN status monitor"
  type        = "map"
  default     = {}
}

variable "vpn_status_message" {
  description = "Custom message for VPN status monitor"
  type        = "string"
  default     = ""
}

variable "vpn_status_time_aggregator" {
  description = "Monitor aggregator for VPN status [available values: min, max or avg]"
  type        = "string"
  default     = "max"
}

variable "vpn_status_timeframe" {
  description = "Monitor timeframe for VPN status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}
