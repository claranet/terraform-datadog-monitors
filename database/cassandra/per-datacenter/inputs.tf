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


## Check outliers monitor
variable "cassandra_outliers_latency_enabled" {
  description = "Flag to enable Cassandra outliers_latencys monitor"
  type        = string
  default     = "true"
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

variable "cassandra_datacenter_name" {
  description = "Name of datacenter you want to monitor"
  type        = string
  default     = ""
}
