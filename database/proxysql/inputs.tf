# Global variables
variable "tags" {
  type    = list(string)
  default = ["type:database", "provider:proxysql", "resource:proxysql"]
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
  default     = false
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

# ProxySQL specific

##################################
###   ProxySQL thread worker   ###
##################################

variable "proxysql_thread_worker_enabled" {
  description = "Flag to enable ProxySQL thread worker monitor"
  type        = string
  default     = "true"
}

variable "proxysql_thread_worker_extra_tags" {
  description = "Extra tags for ProxySQL thread worker monitor"
  type        = list(string)
  default     = []
}

variable "proxysql_thread_worker_message" {
  description = "Custom message for ProxySQL thread worker monitor"
  type        = string
  default     = ""
}

variable "proxysql_thread_worker_threshold_critical" {
  description = "Minimum critical acceptable of thread worker running"
  default     = 1
}

variable "proxysql_thread_worker_threshold_warning" {
  description = "Minimum warning acceptable of thread worker running"
  default     = 4
}

variable "proxysql_thread_worker_time_aggregator" {
  description = "Monitor time aggregator for ProxySQL thread worker monitor [available values: min, max or avg]"
  type        = string
  default     = "avg"
}

variable "proxysql_thread_worker_timeframe" {
  description = "Monitor timeframe for ProxySQL thread worker monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

#################################
###   ProxySQL slow queries   ###
#################################

variable "proxysql_slow_enabled" {
  description = "Flag to enable ProxySQL slow queries monitor"
  type        = string
  default     = "true"
}

variable "proxysql_slow_extra_tags" {
  description = "Extra tags for ProxySQL slow queries monitor"
  type        = list(string)
  default     = []
}

variable "proxysql_slow_message" {
  description = "Custom message for ProxySQL slow queries monitor"
  type        = string
  default     = ""
}

variable "proxysql_slow_threshold_critical" {
  description = "Maximum critical acceptable of slow queries"
  default     = 20
}

variable "proxysql_slow_threshold_warning" {
  description = "Maximum warning acceptable of slow queries"
  default     = 1
}

variable "proxysql_slow_time_aggregator" {
  description = "Monitor time aggregator for ProxySQL slow queries monitor [available values: min, max or avg]"
  type        = string
  default     = "avg"
}

variable "proxysql_slow_timeframe" {
  description = "Monitor timeframe for ProxySQL slow queries monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

##########################################
###  ProxySQL Client aborted connects  ###
##########################################

variable "proxysql_client_conn_aborted_enabled" {
  description = "Flag to enable ProxySQL client connections aborted monitor"
  type        = string
  default     = "true"
}

variable "proxysql_client_conn_aborted_extra_tags" {
  description = "Extra tags for ProxySQL client connections aborted monitor"
  type        = list(string)
  default     = []
}

variable "proxysql_client_conn_aborted_message" {
  description = "Custom message for ProxySQL client connections aborted monitor"
  type        = string
  default     = ""
}

variable "proxysql_client_conn_aborted_threshold_critical" {
  description = "Maximum critical acceptable percent of aborted connects"
  default     = 10
}

variable "proxysql_client_conn_aborted_threshold_warning" {
  description = "Maximum warning acceptable percent of aborted connects"
  default     = 1
}

variable "proxysql_client_conn_aborted_time_aggregator" {
  description = "Monitor time aggregator for ProxySQL client connections aborted monitor [available values: min, max or avg]"
  type        = string
  default     = "avg"
}

variable "proxysql_client_conn_aborted_timeframe" {
  description = "Monitor timeframe for ProxySQL client connections aborted monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_10m"
}

##########################################
###  ProxySQL Server aborted connects  ###
##########################################

variable "proxysql_server_conn_aborted_enabled" {
  description = "Flag to enable ProxySQL server connections aborted monitor"
  type        = string
  default     = "true"
}

variable "proxysql_server_conn_aborted_extra_tags" {
  description = "Extra tags for ProxySQL server connections aborted monitor"
  type        = list(string)
  default     = []
}

variable "proxysql_server_conn_aborted_message" {
  description = "Custom message for ProxySQL server connections aborted monitor"
  type        = string
  default     = ""
}

variable "proxysql_server_conn_aborted_threshold_critical" {
  description = "Maximum critical acceptable percent of aborted connects"
  default     = 10
}

variable "proxysql_server_conn_aborted_threshold_warning" {
  description = "Maximum warning acceptable percent of aborted connects"
  default     = 1
}

variable "proxysql_server_conn_aborted_time_aggregator" {
  description = "Monitor time aggregator for ProxySQL server connections aborted monitor [available values: min, max or avg]"
  type        = string
  default     = "avg"
}

variable "proxysql_server_conn_aborted_timeframe" {
  description = "Monitor timeframe for ProxySQL server connections aborted monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_10m"
}


##########################################
###  ProxySQL Pool Connection Failure  ###
##########################################

variable "proxysql_pool_conn_failure_enabled" {
  description = "Flag to enable ProxySQL pool connections failure monitor"
  type        = string
  default     = "true"
}

variable "proxysql_pool_conn_failure_extra_tags" {
  description = "Extra tags for ProxySQL pool connections failure monitor"
  type        = list(string)
  default     = []
}

variable "proxysql_pool_conn_failure_message" {
  description = "Custom message for ProxySQL pool connections failure monitor"
  type        = string
  default     = ""
}

variable "proxysql_pool_conn_failure_threshold_critical" {
  description = "Maximum critical acceptable of pool connections failure"
  default     = 20
}

variable "proxysql_pool_conn_failure_threshold_warning" {
  description = "Maximum warning acceptable of pool connections failure"
  default     = 1
}

variable "proxysql_pool_conn_failure_time_aggregator" {
  description = "Monitor time aggregator for ProxySQL pool connections failure monitor [available values: min, max or avg]"
  type        = string
  default     = "avg"
}

variable "proxysql_pool_conn_failure_timeframe" {
  description = "Monitor timeframe for ProxySQL pool connections failure monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}
