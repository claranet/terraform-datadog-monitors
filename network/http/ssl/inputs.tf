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

variable "notify_no_data" {
  description = "Will raise no data alert if set to true"
  default     = true
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

variable "invalid_ssl_certificate_threshold_warning" {
  description = "SSL invalid certificate monitor (warning threshold)"
  type        = string
  default     = 3
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
  default     = 15
}

variable "certificate_expiration_date_extra_tags" {
  description = "Extra tags for Certificate Expiration Date monitor"
  type        = list(string)
  default     = []
}