# Global variables
variable "tags" {
  type    = list(string)
  default = ["type:middleware", "provider:php-fpm", "resource:php-fpm"]
}

# Global DataDog
variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 15
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

# PHP FPM Middleware specific

variable "php_fpm_busy_enabled" {
  description = "Flag to enable PHP FPM busy worker monitor"
  type        = string
  default     = "true"
}

variable "php_fpm_busy_extra_tags" {
  description = "Extra tags for PHP FPM busy worker monitor"
  type        = list(string)
  default     = []
}

variable "php_fpm_busy_message" {
  description = "Custom message for PHP FPM busy worker monitor"
  type        = string
  default     = ""
}

variable "php_fpm_busy_time_aggregator" {
  description = "Monitor aggregator for PHP FPM busy worker [available values: min, max or avg]"
  type        = string
  default     = "avg"
}

variable "php_fpm_busy_timeframe" {
  description = "Monitor timeframe for PHP FPM busy worker [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_10m"
}

variable "php_fpm_busy_threshold_warning" {
  description = "php fpm busy warning threshold"
  default     = 80
}

variable "php_fpm_busy_threshold_critical" {
  description = "php fpm busy critical threshold"
  default     = 90
}

variable "php_fpm_connect_enabled" {
  description = "Flag to enable PHP FPM status monitor"
  type        = string
  default     = "true"
}

variable "php_fpm_connect_extra_tags" {
  description = "Extra tags for PHP FPM status monitor"
  type        = list(string)
  default     = []
}

variable "php_fpm_connect_message" {
  description = "Custom message for PHP FPM status monitor"
  type        = string
  default     = ""
}

variable "php_fpm_connect_threshold_warning" {
  description = "PHP FPM status monitor (warning threshold)"
  type        = string
  default     = 3
}

variable "php_fpm_connect_no_data_timeframe" {
  description = "PHP FPM status monitor no data timeframe"
  type        = string
  default     = 10
}

