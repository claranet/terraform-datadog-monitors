variable "environment" {
  description = "Architecture environment"
  type        = string
}

variable "filter_tags_use_defaults" {
  description = "Use default filter tags convention"
  default     = "true"
}

variable "filter_tags_custom" {
  description = "Tags used for custom filtering when filter_tags_use_defaults is false"
  default     = "*"
}

variable "filter_tags_custom_excluded" {
  description = "Tags excluded for custom filtering when filter_tags_use_defaults is false"
  default     = ""
}

variable "message" {
  description = "Message sent when a monitor is triggered"
}

variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
}

variable "new_host_delay" {
  description = "Delay in seconds before monitor new resource"
  default     = 300
}

variable "prefix_slug" {
  description = "Prefix string to prepend between brackets on every monitors names"
  default     = ""
}

variable "notify_no_data" {
  description = "Will raise no data alert if set to true"
  default     = true
}

variable "appservices_status_no_data_timeframe" {
  description = "Number of minutes before reporting no data"
  type        = string
  default     = 10
}

# VPN Gateways connexions specific variables

variable "vpngw_connexion_status_enabled" {
  description = "Enable VPN Gateways connexions status monitor"
  type = bool
  default = true
}

variable "vpngw_connexion_status_status_message" {
  description = "Custom message for VPN Gateway connexions status monitor"
  type        = string
  default     = ""
}

variable "vpngw_connexion_status_threshold_warning" {
  description = "VPN Gateways connexions monitor limit (warning threshold)"
  type        = number
  default     = 3
}

variable "vpngw_connexion_status_no_data_timeframe" {
  description = "VPN Gateways connexions monitor no data timeframe"
  type        = number
  default     = 10
}

variable "vpngw_connexion_status_extra_tags" {
  description = "Extra tags for VPN Gateways connexions monitor"
  type        = list(string)
  default     = []
}
