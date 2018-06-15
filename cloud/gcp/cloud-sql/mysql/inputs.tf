#
# Datadog global variables
#
variable "environment" {
  description = "Architecture environment"
  type        = "string"
}

variable "filter_tags_use_defaults" {
  description = "Use default filter tags convention"
  default     = "true"
}

variable "filter_tags_custom" {
  description = "Tags used for custom filtering when filter_tags_use_defaults is false"
  default     = "*"
}

variable "message" {
  description = "Message sent when a monitor is triggered"
}

variable "delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
}

#
# Filter variables
#
variable "project_id" {
  type        = "string"
  description = "ID of the GCP Project"
}

#
# Network Connections
#
variable "network_connections_message" {
  description = "Custom message for the Network Connections monitor"
  type        = "string"
  default     = ""
}

variable "network_connections_timeframe" {
  description = "Timeframe for the Network Connections monitor"
  type        = "string"
  default     = "last_5m"
}

variable "network_connections_hard_limit" {
  description = "Max number of connections for the CloudSQL Instance. Default value is the max value on https://cloud.google.com/sql/docs/quotas#fixed-limits for MySQL"
  type        = "string"
  default     = 4000
}

variable "network_connections_threshold_warning" {
  description = "Number of network connections (warning threshold)"
  type        = "string"
  default     = 3200
}

variable "network_connections_threshold_critical" {
  description = "Number of network connections (critical threshold)"
  type        = "string"
  default     = 3600
}

variable "network_connections_silenced" {
  description = "Groups to mute for GCP Cloud SQL Network Connections monitor"
  type        = "map"
  default     = {}
}

#
# Replication Lag
#
variable "replication_lag_message" {
  description = "Custom message for the Replication Lag monitor"
  type        = "string"
  default     = ""
}

variable "replication_lag_timeframe" {
  description = "Timeframe for the Replication Lag monitor"
  type        = "string"
  default     = "last_10m"
}

variable "replication_lag_threshold_warning" {
  description = "Seconds behind the master (warning threshold)"
  type        = "string"
  default     = 2000
}

variable "replication_lag_threshold_critical" {
  description = "Seconds behind the master (critical threshold)"
  type        = "string"
  default     = 2700
}

variable "replication_lag_silenced" {
  description = "Groups to mute for GCP Cloud SQL Replication Lag monitor"
  type        = "map"
  default     = {}
}
