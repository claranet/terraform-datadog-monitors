#
# Datadog global variables
#
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
  default     = 15
}

variable "new_host_delay" {
  description = "Delay in seconds before begin to monitor new host"
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


#
# Service Check
#
variable "not_responding_enabled" {
  type        = bool
  description = "Flag to enable Solr does not repsond monitor"
  default     = true
}

variable "not_responding_message" {
  description = "Custom message for Solr does not respond monitor"
  type        = string
  default     = ""
}

variable "not_responding_threshold_warning" {
  type        = number
  default     = 3
  description = "Solr not responding limit (warning threshold)"
}

variable "not_responding_no_data_timeframe" {
  description = "Solr not responding monitor no data timeframe"
  type        = number
  default     = 10
}

variable "not_responding_extra_tags" {
  description = "Extra tags for solr does not respond monitor"
  type        = list(string)
  default     = []
}

#
# Handler errors
#
variable "search_handler_errors_enabled" {
  description = "Flag to enable Solr search handler errors monitor"
  type        = bool
  default     = true
}

variable "search_handler_errors_message" {
  description = "Custom message for Solr search handler errors monitor"
  type        = string
  default     = ""
}
variable "search_handler_errors_rate_threshold_critical" {
  description = "Handler errors rate critical threshold"
  default     = 50
  type        = number
}

variable "search_handler_errors_rate_threshold_warning" {
  description = "Handler errors rate warning threshold"
  default     = 10
  type        = number
}

variable "search_handler_errors_time_aggregator" {
  description = "Time aggregator for the Handler errors monitor"
  type        = string
  default     = "min"
}

variable "search_handler_errors_timeframe" {
  description = "Timeframe for the search handler errors monitor"
  type        = string
  default     = "last_5m"
}

variable "search_handler_errors_extra_tags" {
  description = "Extra tags for Search handler errors monitor"
  default     = []
  type        = list(string)
}

#
# Searcher warmup time
#
variable "searcher_warmup_time_enabled" {
  default     = true
  description = "Flag to enable Solr searcher warmup time monitor"
  type        = bool
}

variable "searcher_warmup_time_message" {
  description = "Custom message for Solr searcher warmup time monitor"
  default     = ""
  type        = string
}

variable "searcher_warmup_time_threshold_warning" {
  description = "Searcher warmup time warning threshold in ms"
  # 2sec
  default = 2000
  type    = number
}

variable "searcher_warmup_time_threshold_critical" {
  description = "Searcher warmup time critical threshold in ms"
  # 5 sec
  default = 5000
  type    = number
}

variable "searcher_warmup_time_extra_tags" {
  description = "Extra tags for searcher warmum time monitor"
  default     = []
  type        = list(string)
}

variable "searcher_warmup_time_aggregator" {
  description = "Time aggregator for the searcher warmup time monitor"
  default     = "max"
  type        = string
}

variable "searcher_warmup_time_timeframe" {
  description = "Timeframe for the searcher warmup time monitor"
  default     = "last_5m"
  type        = string
}