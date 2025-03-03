# Global variables
variable "tags" {
  type    = list(string)
  default = ["type:cloud", "provider:gcp", "resource:cloud-sql", "engine:mysql"]
}

# Global DataDog
variable "filter_tags" {
  description = "Tags used for filtering"
  default     = "*"
}

variable "message" {
  description = "Message sent when a monitor is triggered"
}

variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
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

variable "replication_lag_no_data_timeframe" {
  description = "Number of minutes before reporting no data"
  type        = string
  default     = 20
}

#
# Replication Lag
#

variable "replication_lag_message" {
  description = "Custom message for the Replication Lag monitor"
  type        = string
  default     = ""
}

variable "replication_lag_time_aggregator" {
  description = "Time aggregator for the Replication Lag monitor"
  type        = string
  default     = "min"
}

variable "replication_lag_timeframe" {
  description = "Timeframe for the Replication Lag monitor"
  type        = string
  default     = "last_10m"
}

variable "replication_lag_threshold_warning" {
  description = "Seconds behind the master (warning threshold)"
  type        = string
  default     = 90
}

variable "replication_lag_threshold_critical" {
  description = "Seconds behind the master (critical threshold)"
  type        = string
  default     = 180
}

variable "replication_lag_enabled" {
  description = "Flag to enable GCP Cloud SQL Replication Lag monitor"
  type        = string
  default     = "true"
}

variable "replication_lag_extra_tags" {
  description = "Extra tags for GCP Cloud SQL SQL Replication monitor"
  type        = list(string)
  default     = []
}

