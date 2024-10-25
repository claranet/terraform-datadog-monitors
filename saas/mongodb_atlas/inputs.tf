# Global variables
variable "tags" {
  type    = list(string)
  default = ["type:database", "provider:mongodb_atlas", "resource:mongodb"]
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

variable "mongodb_primary_no_data_timeframe" {
  description = "Number of minutes before reporting no data"
  type        = string
  default     = 10
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

variable "filter_tags_separator" {
  description = "Set the filter tags separator (, or AND)"
  default     = ","
}

variable "mongodb_desired_servers_count" {
  description = "Number of servers that should be instanciated for this cluster"
  default     = 3
}

variable "mongodb_primary_timeframe" {
  description = "Monitor timeframe for MongoDB wrong state for primary node [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_1m"
}

variable "mongodb_secondary_timeframe" {
  description = "Monitor timeframe for MongoDB wrong state for secondaries nodes [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "mongodb_server_count_timeframe" {
  description = "Monitor timeframe for MongoDB wrong server count [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "mongodb_replication_timeframe" {
  description = "Monitor timeframe for MongoDB replication lag  [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "mongodb_lag_warning" {
  description = "Warn replication lag in s"
  default     = 2
}

variable "mongodb_lag_critical" {
  description = "Critical replication lag in s"
  default     = 5
}

variable "mongodb_primary_enabled" {
  description = "Flag to enable MongoDB primary state monitor"
  type        = string
  default     = "true"
}

variable "mongodb_primary_extra_tags" {
  description = "Extra tags for MongoDB primary state monitor"
  type        = list(string)
  default     = []
}

variable "mongodb_secondary_enabled" {
  description = "Flag to enable MongoDB secondary state monitor"
  type        = string
  default     = "true"
}

variable "mongodb_secondary_extra_tags" {
  description = "Extra tags for MongoDB secondary state monitor"
  type        = list(string)
  default     = []
}

variable "mongodb_server_count_enabled" {
  description = "Flag to enable MongoDB server count monitor"
  type        = string
  default     = "true"
}

variable "mongodb_replication_enabled" {
  description = "Flag to enable MongoDB replication lag monitor"
  type        = string
  default     = "true"
}

variable "mongodb_replication_extra_tags" {
  description = "Extra tags for MongoDB replication lag monitor"
  type        = list(string)
  default     = []
}

variable "mongodb_primary_message" {
  description = "Custom message for MongoDB primary monitor"
  type        = string
  default     = ""
}

variable "mongodb_secondary_message" {
  description = "Custom message for MongoDB secondary monitor"
  type        = string
  default     = ""
}

variable "mongodb_server_count_message" {
  description = "Custom message for MongoDB server count"
  type        = string
  default     = ""
}

variable "mongodb_replication_message" {
  description = "Custom message for MongoDB replication monitor"
  type        = string
  default     = ""
}

variable "mongodb_primary_aggregator" {
  description = "Monitor aggregator for MongoDB primary state [available values: min, max]"
  type        = string
  default     = "max"
}

variable "mongodb_secondary_aggregator" {
  description = "Monitor aggregator for MongoDB secondary state [available values: min, max]"
  type        = string
  default     = "max"
}

variable "mongodb_server_count_aggregator" {
  description = "Monitor aggregator for MongoDB server count [available values: min, max]"
  type        = string
  default     = "min"
}

variable "mongodb_replication_aggregator" {
  description = "Monitor aggregator for MongoDB replication lag [available values: min, max, sum or avg]"
  type        = string
  default     = "avg"
}

#
# High file system storage usage
#
variable "mongodb_high_disk_usage_enabled" {
  description = "Flag to enable MongoDB high disk usage monitor"
  type        = string
  default     = "true"
}

variable "mongodb_high_disk_usage_message" {
  description = "Custom message for MongoDB high disk usage monitor"
  type        = string
  default     = ""
}

variable "mongodb_high_disk_usage_aggregator" {
  description = "Monitor aggregator for MongoDB high disk usage [available values: min, max]"
  type        = string
  default     = "avg"
}

variable "mongodb_high_disk_usage_timeframe" {
  description = "Timeframe for MongoDB high disk usage monitor"
  type        = string
  default     = "last_60m"
}

variable "mongodb_high_disk_usage_critical" {
  description = "Critical threshold for MongoDB high disk usage"
  default     = 80
}

variable "mongodb_high_disk_usage_warning" {
  description = "Warning threshold for MongoDB high disk usage"
  default     = 70
}

variable "mongodb_high_disk_usage_extra_tags" {
  description = "Extra tags for MongoDB high disk usage monitor"
  type        = list(string)
  default     = []
}

#
# Low oplog window
#
variable "mongodb_oplog_low_enabled" {
  description = "Flag to enable MongoDB low oplog window monitor"
  type        = string
  default     = "true"
}

variable "mongodb_oplog_low_message" {
  description = "Custom message for MongoDB low oplog window monitor"
  type        = string
  default     = ""
}

variable "mongodb_oplog_low_aggregator" {
  description = "Monitor aggregator for MongoDB low oplog window [available values: min, max]"
  type        = string
  default     = "avg"
}

variable "mongodb_oplog_low_timeframe" {
  description = "Timeframe for MongoDB low oplog window monitor"
  type        = string
  default     = "last_60m"
}

variable "mongodb_oplog_low_critical" {
  description = "Critical threshold for MongoDB low oplog window"
  default     = 3600
}

variable "mongodb_oplog_low_warning" {
  description = "Warning threshold for MongoDB low oplog window"
  default     = 7200
}

variable "mongodb_oplog_low_extra_tags" {
  description = "Extra tags for MongoDB low oplog window monitor"
  type        = list(string)
  default     = []
}

#
# Unhealthy replica set
#
variable "mongodb_replicaset_member_unhealthy_enabled" {
  description = "Flag to enable MongoDB unhealthy replica set member monitor"
  type        = string
  default     = "true"
}

variable "mongodb_replicaset_member_unhealthy_message" {
  description = "Custom message for MongoDB unhealthy replica set member monitor"
  type        = string
  default     = ""
}

variable "mongodb_replicaset_member_unhealthy_aggregator" {
  description = "Monitor aggregator for MongoDB unhealthy replica set member [available values: min, max]"
  type        = string
  default     = "max"
}

variable "mongodb_replicaset_member_unhealthy_timeframe" {
  description = "Timeframe for MongoDB unhealthy replica set member monitor"
  type        = string
  default     = "last_5m"
}

variable "mongodb_replicaset_member_unhealthy_critical" {
  description = "Critical threshold for MongoDB unhealthy replica set member"
  default     = 1
}

variable "mongodb_replicaset_member_unhealthy_extra_tags" {
  description = "Extra tags for MongoDB unhealthy replica set member monitor"
  type        = list(string)
  default     = []
}

#
# CPU usage
#
variable "mongodb_cpu_high_enabled" {
  description = "Flag to enable MongoDB high CPU usage monitor"
  type        = string
  default     = "true"
}

variable "mongodb_cpu_high_message" {
  description = "Custom message for MongoDB high CPU usage monitor"
  type        = string
  default     = ""
}

variable "mongodb_cpu_high_aggregator" {
  description = "Monitor aggregator for MongoDB high CPU usage [available values: min, max]"
  type        = string
  default     = "avg"
}

variable "mongodb_cpu_high_timeframe" {
  description = "Timeframe for MongoDB high CPU usage monitor"
  type        = string
  default     = "last_4h"
}

variable "mongodb_cpu_high_alert_window" {
  description = "Alert window for MongoDB high CPU usage"
  type        = string
  default     = "last_15m"
}

variable "mongodb_cpu_high_critical" {
  description = "Critical threshold for MongoDB high CPU usage"
  default     = 1
}

variable "mongodb_cpu_high_critical_recovery" {
  description = "Recovery threshold for MongoDB high CPU usage"
  default     = 0
}

variable "mongodb_cpu_high_recovery_window" {
  description = "Recovery window for MongoDB high CPU usage"
  type        = string
  default     = "last_15m"
}

variable "mongodb_cpu_high_trigger_window" {
  description = "Trigger window for MongoDB high CPU usage alert"
  type        = string
  default     = "last_15m"
}

variable "mongodb_cpu_high_extra_tags" {
  description = "Extra tags for MongoDB high CPU usage monitor"
  type        = list(string)
  default     = []
}

#
# Query efficiency
#
variable "mongodb_query_efficiency_enabled" {
  description = "Flag to enable MongoDB query efficiency monitor"
  type        = string
  default     = "true"
}

variable "mongodb_query_efficiency_message" {
  description = "Custom message for MongoDB query efficiency monitor"
  type        = string
  default     = ""
}

variable "mongodb_query_efficiency_aggregator" {
  description = "Monitor aggregator for MongoDB query efficiency [available values: min, max]"
  type        = string
  default     = "avg"
}

variable "mongodb_query_efficiency_timeframe" {
  description = "Timeframe for MongoDB query efficiency monitor"
  type        = string
  default     = "last_4h"
}

variable "mongodb_query_efficiency_alert_window" {
  description = "Alert window for MongoDB query efficiency"
  type        = string
  default     = "last_30m"
}

variable "mongodb_query_efficiency_critical" {
  description = "Critical threshold for MongoDB query efficiency"
  default     = 1
}

variable "mongodb_query_efficiency_critical_recovery" {
  description = "Recovery threshold for MongoDB query efficiency"
  default     = 0
}

variable "mongodb_query_efficiency_recovery_window" {
  description = "Recovery window for MongoDB query efficiency"
  type        = string
  default     = "last_15m"
}

variable "mongodb_query_efficiency_trigger_window" {
  description = "Trigger window for MongoDB query efficiency alert"
  type        = string
  default     = "last_30m"
}

variable "mongodb_query_efficiency_extra_tags" {
  description = "Extra tags for MongoDB query efficiency monitor"
  type        = list(string)
  default     = []
}

#
# Memory usage
#
variable "mongodb_mem_usage_enabled" {
  description = "Flag to enable MongoDB memory usage monitor"
  type        = string
  default     = "true"
}

variable "mongodb_mem_usage_message" {
  description = "Custom message for MongoDB memory usage monitor"
  type        = string
  default     = ""
}

variable "mongodb_mem_usage_aggregator" {
  description = "Monitor aggregator for MongoDB memory usage [available values: min, max]"
  type        = string
  default     = "avg"
}

variable "mongodb_mem_usage_timeframe" {
  description = "Timeframe for MongoDB memory usage monitor"
  type        = string
  default     = "last_4h"
}

variable "mongodb_mem_usage_alert_window" {
  description = "Alert window for MongoDB memory usage"
  type        = string
  default     = "last_30m"
}

variable "mongodb_mem_usage_critical" {
  description = "Critical threshold for MongoDB memory usage"
  default     = 1
}

variable "mongodb_mem_usage_critical_recovery" {
  description = "Recovery threshold for MongoDB memory usage"
  default     = 0
}

variable "mongodb_mem_usage_recovery_window" {
  description = "Recovery window for MongoDB memory usage"
  type        = string
  default     = "last_15m"
}

variable "mongodb_mem_usage_trigger_window" {
  description = "Trigger window for MongoDB memory usage alert"
  type        = string
  default     = "last_30m"
}

variable "mongodb_mem_usage_extra_tags" {
  description = "Extra tags for MongoDB memory usage monitor"
  type        = list(string)
  default     = []
}

#
# Read latency
#
variable "mongodb_read_latency_enabled" {
  description = "Flag to enable MongoDB read latency monitor"
  type        = string
  default     = "true"
}

variable "mongodb_read_latency_message" {
  description = "Custom message for MongoDB read latency monitor"
  type        = string
  default     = ""
}

variable "mongodb_read_latency_aggregator" {
  description = "Monitor aggregator for MongoDB read latency [available values: min, max]"
  type        = string
  default     = "avg"
}

variable "mongodb_read_latency_timeframe" {
  description = "Timeframe for MongoDB read latency monitor"
  type        = string
  default     = "last_4h"
}

variable "mongodb_read_latency_alert_window" {
  description = "Alert window for MongoDB read latency"
  type        = string
  default     = "last_30m"
}

variable "mongodb_read_latency_critical" {
  description = "Critical threshold for MongoDB read latency"
  default     = 1
}

variable "mongodb_read_latency_critical_recovery" {
  description = "Recovery threshold for MongoDB read latency"
  default     = 0
}

variable "mongodb_read_latency_recovery_window" {
  description = "Recovery window for MongoDB read latency"
  type        = string
  default     = "last_15m"
}

variable "mongodb_read_latency_trigger_window" {
  description = "Trigger window for MongoDB read latency alert"
  type        = string
  default     = "last_30m"
}

variable "mongodb_read_latency_extra_tags" {
  description = "Extra tags for MongoDB read latency monitor"
  type        = list(string)
  default     = []
}

#
# Write latency
#
variable "mongodb_write_latency_enabled" {
  description = "Flag to enable MongoDB write latency monitor"
  type        = string
  default     = "true"
}

variable "mongodb_write_latency_message" {
  description = "Custom message for MongoDB write latency monitor"
  type        = string
  default     = ""
}

variable "mongodb_write_latency_aggregator" {
  description = "Monitor aggregator for MongoDB write latency [available values: min, max]"
  type        = string
  default     = "avg"
}

variable "mongodb_write_latency_timeframe" {
  description = "Timeframe for MongoDB write latency monitor"
  type        = string
  default     = "last_4h"
}

variable "mongodb_write_latency_alert_window" {
  description = "Alert window for MongoDB write latency"
  type        = string
  default     = "last_30m"
}

variable "mongodb_write_latency_critical" {
  description = "Critical threshold for MongoDB write latency"
  default     = 1
}

variable "mongodb_write_latency_critical_recovery" {
  description = "Recovery threshold for MongoDB write latency"
  default     = 0
}

variable "mongodb_write_latency_recovery_window" {
  description = "Recovery window for MongoDB write latency"
  type        = string
  default     = "last_15m"
}

variable "mongodb_write_latency_trigger_window" {
  description = "Trigger window for MongoDB write latency alert"
  type        = string
  default     = "last_30m"
}

variable "mongodb_write_latency_extra_tags" {
  description = "Extra tags for MongoDB write latency monitor"
  type        = list(string)
  default     = []
}
