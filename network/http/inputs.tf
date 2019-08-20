# Global Terraform
variable "environment" {
  description = "Architecture Environment"
  type        = string
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

variable "prefix_slug" {
  description = "Prefix string to prepend between brackets on every monitors names"
  default     = ""
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

variable "filter_tags_custom_excluded" {
  description = "Tags excluded for custom filtering when filter_tags_use_defaults is false"
  default     = ""
}

#
# HTTP Cannot Connect
#
variable "cannot_connect_enabled" {
  description = "Flag to enable HTTP cannot connect monitor"
  type        = string
  default     = "true"
}

variable "cannot_connect_message" {
  description = "Custom message for HTTP cannot connect monitor"
  type        = string
  default     = ""
}

variable "cannot_connect_last" {
  description = "Parameter 'last' for the service check"
  type        = string
  default     = 6
}

variable "cannot_connect_threshold_warning" {
  description = "HTTP cannot connect monitor (warning threshold)"
  type        = string
  default     = 2
}

variable "cannot_connect_threshold_critical" {
  description = "HTTP cannot connect monitor (warning threshold)"
  type        = string
  default     = 3
}

variable "cannot_connect_threshold_ok" {
  description = "HTTP cannot connect monitor (ok threshold)"
  type        = string
  default     = 3
}

variable "cannot_connect_no_data_timeframe" {
  description = "HTTP cannot connect monitor no data timeframe"
  type        = string
  default     = 10
}

variable "cannot_connect_extra_tags" {
  description = "Extra tags for HTTP cannot connect monitor"
  type        = list(string)
  default     = []
}

#
# SSL invalid certificate
#
variable "invalid_ssl_certificate_enabled" {
  description = "Flag to enable SSL invalid certificate monitor"
  type        = string
  default     = "true"
}

variable "invalid_ssl_certificate_message" {
  description = "Custom message for SSL invalid certificate monitor"
  type        = string
  default     = ""
}

variable "invalid_ssl_certificate_last" {
  description = "Parameter 'last' for the service check"
  type        = string
  default     = 6
}

variable "invalid_ssl_certificate_threshold_warning" {
  description = "SSL invalid certificate monitor (warning threshold)"
  type        = string
  default     = 5
}

variable "invalid_ssl_certificate_threshold_critical" {
  description = "SSL invalid certificate monitor (warning threshold)"
  type        = string
  default     = 5
}

variable "invalid_ssl_certificate_no_data_timeframe" {
  description = "SSL invalid certificate monitor no data timeframe"
  type        = string
  default     = 10
}

variable "invalid_ssl_certificate_extra_tags" {
  description = "Extra tags for SSL invalid certificate monitor"
  type        = list(string)
  default     = []
}

#
# Certificate Expiration Date
#
variable "certificate_expiration_date_enabled" {
  description = "Flag to enable Certificate Expiration Date monitor"
  type        = string
  default     = "false"
}

variable "certificate_expiration_date_message" {
  description = "Custom message for the Certificate Expiration Date monitor"
  type        = string
  default     = ""
}

variable "certificate_expiration_date_time_aggregator" {
  description = "Time aggregator for the Certificate Expiration Date monitor"
  type        = string
  default     = "max"
}

variable "certificate_expiration_date_timeframe" {
  description = "Timeframe for the Certificate Expiration Date monitor"
  type        = string
  default     = "last_5m"
}

variable "certificate_expiration_date_threshold_warning" {
  description = "Certificate Expiration Date warning threshold"
  type        = string
  default     = 30
}

variable "certificate_expiration_date_threshold_critical" {
  description = "Certificate Expiration Date critical threshold"
  type        = string
  default     = 8
}

variable "certificate_expiration_date_extra_tags" {
  description = "Extra tags for Certificate Expiration Date monitor"
  type        = list(string)
  default     = []
}
