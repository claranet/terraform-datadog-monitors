# Global variables
variable "tags" {
  type    = list(string)
  default = ["type:cloud", "provider:aws", "resource:vpn"]
}

# Global DataDog
variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
}

variable "new_host_delay" {
  description = "Delay in seconds before monitor new resource"
  default     = 300
}

variable "new_group_delay" {
  description = "Delay in seconds before monitor new resource"
  default     = 300
}

variable "timeout_h" {
  description = "Default auto-resolving state (in hours)"
  default     = 0
}

variable "prefix_slug" {
  description = "Prefix string to prepend between brackets on every monitors names"
  default     = ""
}

variable "notify_no_data" {
  description = "Will raise no data alert if set to true"
  default     = true
}

variable "vpn_status_no_data_timeframe" {
  description = "Number of minutes before reporting no data"
  type        = string
  default     = 10
}

variable "message" {
  description = "Message sent when an alert is triggered"
}

variable "filter_tags" {
  description = "Tags used for metrics filtering"
  default     = "*"
}

variable "vpn_status_enabled" {
  description = "Flag to enable VPN status monitor"
  type        = string
  default     = "true"
}

variable "vpn_status_extra_tags" {
  description = "Extra tags for VPN status monitor"
  type        = list(string)
  default     = []
}

variable "vpn_status_message" {
  description = "Custom message for VPN status monitor"
  type        = string
  default     = ""
}

variable "vpn_status_time_aggregator" {
  description = "Monitor aggregator for VPN status [available values: min, max or avg]"
  type        = string
  default     = "max"
}

variable "vpn_status_timeframe" {
  description = "Monitor timeframe for VPN status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

