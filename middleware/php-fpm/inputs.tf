# Global Terraform
variable "environment" {
  description = "Architecture Environment"
  type        = "string"
}

# Global DataDog
variable "delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 15
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

# PHP FPM Middleware specific

variable "php_fpm_busy_silenced" {
  description = "Groups to mute for PHP FPM busy worker monitor"
  type        = "map"
  default     = {}
}

variable "php_fpm_busy_message" {
  description = "Custom message for PHP FPM busy worker monitor"
  type        = "string"
  default     = ""
}

variable "php_fpm_busy_timeframe" {
  description = "Monitor timeframe for PHP FPM busy worker [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_10m"
}

variable "php_fpm_busy_threshold_warning" {
  description = "php fpm busy warning threshold"
  default     = 0.8
}

variable "php_fpm_busy_threshold_critical" {
  description = "php fpm busy critical threshold"
  default     = 0.9
}

variable "php_fpm_connect_silenced" {
  description = "Groups to mute for PHP FPM process monitor"
  type        = "map"
  default     = {}
}

variable "php_fpm_connect_message" {
  description = "Custom message for PHP FPM process monitor"
  type        = "string"
  default     = ""
}
