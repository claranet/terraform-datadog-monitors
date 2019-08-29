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

variable "cassandra_node_enabled" {
  description = "Flag to enable Cassandra availability monitor"
  type        = string
  default     = "true"
}

variable "cassandra_process_enabled" {
  description = "Flag to enable Cassandra availability monitor"
  type        = string
  default     = "true"
}

variable "node_cassandra_availability_extra_tags" {
  description = "Extra tags for Cassandra availability monitor"
  type        = list(string)
  default     = []
}

variable "process_cassandra_availability_extra_tags" {
  description = "Extra tags for Cassandra availability monitor"
  type        = list(string)
  default     = []
}

variable "node_cassandra_status_message" {
  description = "Custom message for Cassandra availability monitor"
  type        = string
  default     = ""
}

variable "process_cassandra_status_message" {
  description = "Custom message for Cassandra status monitor"
  type        = string
  default     = ""
}

variable "node_cassandra_status_time_aggregator" {
  description = "Monitor aggregator for Cassandra [available values: min, max, sum or avg]"
  type        = string
  default     = "min"
}

variable "node_cassandra_status_timeframe" {
  description = "Monitor timeframe for Cassandra [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

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
  default     = 300000
  description = "Maximum critical acceptable ms of read latency"
}

variable "cassandra_read_latency_threshold_warning" {
  default     = 250000
  description = "Maximum critical acceptable ms of read latency"
}

variable "cassandra_read_latency_availability_extra_tags" {
  description = "Extra tags for Cassandra read latency monitor"
  type        = list(string)
  default     = []
}

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
  default     = 300000
  description = "Maximum critical acceptable ms of write latency"
}

variable "cassandra_write_latency_threshold_warning" {
  default     = 250000
  description = "Maximum critical acceptable ms of write latency"
}

variable "cassandra_write_latency_availability_extra_tags" {
  description = "Extra tags for Cassandra write latency monitor"
  type        = list(string)
  default     = []
}

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
  default     = 0.30
  description = "Maximum critical acceptable rate of key cache"
}

variable "cassandra_key_cache_threshold_warning" {
  default     = 0.40
  description = "Maximum critical acceptable rate of key cache"
}

variable "cassandra_key_cache_extra_tags" {
  description = "Extra tags for Cassandra key cache monitor"
  type        = list(string)
  default     = []
}


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
  default     = 1000
  description = "Maximum critical acceptable rate of exceptions"
}

variable "cassandra_exceptions_threshold_warning" {
  default     = 500
  description = "Maximum critical acceptable rate of exceptions"
}

variable "cassandra_exceptions_extra_tags" {
  description = "Extra tags for Cassandra exceptions monitor"
  type        = list(string)
  default     = []
}
