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

# Cassandra specific

####################################
###    Cassandra availability    ###
####################################

## Check Node monitor
variable "cassandra_node_enabled" {
  description = "Flag to enable Cassandra node availability monitor"
  type        = string
  default     = "true"
}

variable "cassandra_node_status_message" {
  description = "Custom message for Cassandra node status monitor"
  type        = string
  default     = ""
}

variable "cassandra_node_time_aggregator" {
  description = "Monitor aggregator for Cassandra node [available values: min, max, sum or avg]"
  type        = string
  default     = "min"
}

variable "cassandra_node_timeframe" {
  description = "Monitor timeframe for Cassandra node monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "cassandra_node_availability_extra_tags" {
  description = "Extra tags for Cassandra node availability monitor"
  type        = list(string)
  default     = []
}

## Check process monitor
variable "cassandra_process_enabled" {
  description = "Flag to enable Cassandra availability monitor"
  type        = string
  default     = "true"
}

variable "cassandra_process_message" {
  description = "Custom message for Cassandra process monitor"
  type        = string
  default     = ""
}

variable "cassandra_process_time_aggregator" {
  description = "Monitor aggregator for Cassandra process monitor [available values: min, max, sum or avg]"
  type        = string
  default     = "max"
}

variable "cassandra_process_timeframe" {
  description = "Monitor timeframe for Cassandra process monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "cassandra_process_extra_tags" {
  description = "Extra tags for Cassandra process monitor"
  type        = list(string)
  default     = []
}

## Check read latency monitor
variable "cassandra_read_latency_enabled" {
  description = "Flag to enable Cassandra read latency monitor"
  type        = string
  default     = "true"
}

variable "cassandra_read_latency_status_message" {
  description = "Custom message for Cassandra read latency monitor"
  type        = string
  default     = ""
}

variable "cassandra_read_latency_time_aggregator" {
  description = "Monitor time aggregator for Cassandra read latency monitor [available values: min, max or avg]"
  type        = string
  default     = "avg"
}

variable "cassandra_read_latency_timeframe" {
  description = "Monitor timeframe for Cassandra read latency monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "cassandra_read_latency_threshold_critical" {
  description = "Maximum critical acceptable µs of read latency monitor"
  default     = 3000000
}

variable "cassandra_read_latency_threshold_warning" {
  description = "Maximum warning acceptable µs of read latency monitor"
  default     = 2000000
}

variable "cassandra_read_latency_availability_extra_tags" {
  description = "Extra tags for Cassandra read latency monitor"
  type        = list(string)
  default     = []
}

## Check read latency monitor
variable "cassandra_write_latency_enabled" {
  description = "Flag to enable Cassandra write latency monitor"
  type        = string
  default     = "true"
}

variable "cassandra_write_latency_status_message" {
  description = "Custom message for Cassandra write latency monitor"
  type        = string
  default     = ""
}

variable "cassandra_write_latency_time_aggregator" {
  description = "Monitor time aggregator for Cassandra write latency monitor [available values: min, max or avg]"
  type        = string
  default     = "avg"
}

variable "cassandra_write_latency_timeframe" {
  description = "Monitor timeframe for Cassandra write latency monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "cassandra_write_latency_threshold_critical" {
  description = "Maximum critical acceptable µs of write latency monitor"
  default     = 300000
}

variable "cassandra_write_latency_threshold_warning" {
  description = "Maximum warning acceptable µs of write latency monitor"
  default     = 250000
}

variable "cassandra_write_latency_availability_extra_tags" {
  description = "Extra tags for Cassandra write latency monitor"
  type        = list(string)
  default     = []
}

## Check keycache monitor
variable "cassandra_key_cache_enabled" {
  description = "Flag to enable Cassandra key cache monitor"
  type        = string
  default     = "true"
}

variable "cassandra_key_cache_status_message" {
  description = "Custom message for Cassandra key cache monitor"
  type        = string
  default     = ""
}

variable "cassandra_key_cache_time_aggregator" {
  description = "Monitor time aggregator for Cassandra key cache monitor [available values: min, max or avg]"
  type        = string
  default     = "avg"
}

variable "cassandra_key_cache_timeframe" {
  description = "Monitor timeframe for Cassandra key cache monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "cassandra_key_cache_threshold_critical" {
  description = "Maximum critical acceptable rate of key cache monitor"
  default     = 0.30
}

variable "cassandra_key_cache_threshold_warning" {
  description = "Maximum warning acceptable rate of key cache monitor"
  default     = 0.40
}

variable "cassandra_key_cache_extra_tags" {
  description = "Extra tags for Cassandra key cache monitor"
  type        = list(string)
  default     = []
}


## Check exceptions monitor
variable "cassandra_exceptions_enabled" {
  description = "Flag to enable Cassandra exceptions monitor"
  type        = string
  default     = "true"
}

variable "cassandra_exceptions_status_message" {
  description = "Custom message for Cassandra exceptions monitor"
  type        = string
  default     = ""
}

variable "cassandra_exceptions_time_aggregator" {
  description = "Monitor time aggregator for Cassandra exceptions monitor [available values: min, max or avg]"
  type        = string
  default     = "avg"
}

variable "cassandra_exceptions_timeframe" {
  description = "Monitor timeframe for Cassandra exceptions monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "cassandra_exceptions_threshold_critical" {
  description = "Maximum critical acceptable rate of exceptions monitor"
  default     = 1000
}

variable "cassandra_exceptions_threshold_warning" {
  description = "Maximum warning acceptable rate of exceptions monitor"
  default     = 500
}

variable "cassandra_exceptions_extra_tags" {
  description = "Extra tags for Cassandra exceptions monitor"
  type        = list(string)
  default     = []
}

## Check outliers monitor
variable "cassandra_outliers_latency_enabled" {
  description = "Flag to enable Cassandra outliers_latencys monitor"
  type        = string
  default     = "false"
}

variable "cassandra_outliers_latency_status_message" {
  description = "Custom message for Cassandra outliers_latency monitor"
  type        = string
  default     = ""
}

variable "cassandra_outliers_latency_time_aggregator" {
  description = "Monitor time aggregator for Cassandra outliers_latency monitor [available values: min, max or avg]"
  type        = string
  default     = "avg"
}

variable "cassandra_outliers_latency_timeframe" {
  description = "Monitor timeframe for Cassandra outliers_latency monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "cassandra_outliers_latency_threshold_critical" {
  description = "Maximum critical acceptable rate of outliers_latency monitor"
  default     = 90
}

variable "cassandra_outliers_latency_threshold_warning" {
  description = "Maximum warning acceptable rate of outliers_latency monitor"
  default     = 85
}

variable "cassandra_outliers_latency_extra_tags" {
  description = "Extra tags for Cassandra exceptions monitor"
  type        = list(string)
  default     = []
}
