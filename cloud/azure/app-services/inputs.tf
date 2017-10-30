variable "filter_tags" {
  default = "*"
}

###################################
###   RESPONSE TIME VARIABLES   ###
###################################
variable "response_time_appserv_eval_delay" {
  default = 600
}

variable "response_time_critical_threshold" {
  default = 0.8
  description = "Alerting threshold in seconds"
}

variable "response_time_threshold_warning" {
  default = 0.4
  description = "Warning threshold in seconds"
}

variable "response_time_last_time_window_code" {
  default = "1h"
  description = "Query time window code, can be: 1h|4h|1d|2d|1w|1m|3m... to write last_#m (1, 5, 10, 15, or 30), last_#h (1, 2, or 4), or last_#d (1 or 2)"
}

variable "response_time_tags" {
  default = []
  description = "A list of tags to associate with your monitor. This can help you categorize and filter monitors in the manage monitors page of the UI. Note: it's not currently possible to filter by these tags when querying via the API"
}

variable "response_time_timeout_h" {
  default = false
  description = "The number of hours of the monitor not reporting data before it will automatically resolve from a triggered state. Defaults to false."
}

variable "response_time_include_tags" {
  default = false
  description = "A boolean indicating whether notifications from this monitor will automatically insert its triggering tags into the title. Defaults to true."
}

variable "response_time_notify_no_data" {
  default = true
  description = " boolean indicating whether this monitor will notify when data stops reporting. Defaults to true."
}

variable "response_time_renotify_interval" {
  default = 0
  description = "The number of minutes after the last notification before a monitor will re-notify on the current status. It will only re-notify if it's not resolved."
}

variable "response_time_escalation_message" {
  default = "Escalation message @pagerduty"
  description = "A message to include with a re-notification. Supports the '@username' notification allowed elsewhere."
}

###################################
###   MEMORY USAGE VARIABLES   ###
###################################
variable "memory_usage_appserv_eval_delay" {
  default = 600
}

variable "memory_usage_threshold_critical" {
  default = 52430000
  description = "Alerting threshold in Mib"
}

variable "memory_usage_threshold_warning" {
  default = 33550000
  description = "Warning threshold in MiB"
}

variable "memory_usage_last_time_window_code" {
  default = "5m"
  description = "Query time window code, can be: 1h|4h|1d|2d|1w|1m|3m... to write last_#m (1, 5, 10, 15, or 30), last_#h (1, 2, or 4), or last_#d (1 or 2)"
}

variable "memory_usage_tags" {
  default = []
  description = "A list of tags to associate with your monitor. This can help you categorize and filter monitors in the manage monitors page of the UI. Note: it's not currently possible to filter by these tags when querying via the API"
}

variable "memory_usage_timeout_h" {
  default = false
  description = "The number of hours of the monitor not reporting data before it will automatically resolve from a triggered state. Defaults to false."
}

variable "memory_usage_include_tags" {
  default = false
  description = "A boolean indicating whether notifications from this monitor will automatically insert its triggering tags into the title. Defaults to true."
}

variable "memory_usage_notify_no_data" {
  default = true
  description = " boolean indicating whether this monitor will notify when data stops reporting. Defaults to true."
}

variable "memory_usage_renotify_interval" {
  default = 0
  description = "The number of minutes after the last notification before a monitor will re-notify on the current status. It will only re-notify if it's not resolved."
}

variable "memory_usage_escalation_message" {
  default = "Escalation message @pagerduty"
  description = "A message to include with a re-notification. Supports the '@username' notification allowed elsewhere."
}
