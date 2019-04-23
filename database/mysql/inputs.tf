variable "environment" {
  description = "Environment"
  type        = "string"
}

variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 15
}

variable "new_host_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 300
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

# MySQL specific

#################################
###   MySQL availability      ###
#################################

variable "mysql_availability_silenced" {
  description = "Groups to mute for Mysql availability monitor"
  type        = "map"
  default     = {}
}

variable "mysql_availability_enabled" {
  description = "Flag to enable Mysql availability monitor"
  type        = "string"
  default     = "true"
}

variable "mysql_availability_extra_tags" {
  description = "Extra tags for Mysql availability monitor"
  type        = "list"
  default     = []
}

variable "mysql_availability_message" {
  description = "Custom message for Mysql availability monitor"
  type        = "string"
  default     = ""
}

variable "mysql_availability_threshold_warning" {
  description = "Mysql availability monitor (warning threshold)"
  type        = "string"
  default     = 3
}

variable "mysql_availability_no_data_timeframe" {
  description = "Mysql availability monitor no data timeframe"
  type        = "string"
  default     = 10
}

#################################
###   MySQL connections       ###
#################################

variable "mysql_connection_silenced" {
  description = "Groups to mute for MySQL connection monitor"
  type        = "map"
  default     = {}
}

variable "mysql_connection_enabled" {
  description = "Flag to enable MySQL connection monitor"
  type        = "string"
  default     = "true"
}

variable "mysql_connection_extra_tags" {
  description = "Extra tags for MySQL connection monitor"
  type        = "list"
  default     = []
}

variable "mysql_connection_message" {
  description = "Custom message for MySQL connection monitor"
  type        = "string"
  default     = ""
}

variable "mysql_connection_threshold_critical" {
  default     = 80
  description = "Maximum critical acceptable percent of connections"
}

variable "mysql_connection_threshold_warning" {
  default     = 70
  description = "Maximum warning acceptable percent of connections"
}

variable "mysql_connection_time_aggregator" {
  description = "Monitor time aggregator for MySQL connection monitor [available values: min, max or avg]"
  type        = "string"
  default     = "avg"
}

variable "mysql_connection_timeframe" {
  description = "Monitor timeframe for MySQL connection monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_10m"
}

#################################
###   MySQL aborted connects  ###
#################################

variable "mysql_aborted_silenced" {
  description = "Groups to mute for MySQL aborted connects monitor"
  type        = "map"
  default     = {}
}

variable "mysql_aborted_enabled" {
  description = "Flag to enable MySQL aborted connects monitor"
  type        = "string"
  default     = "true"
}

variable "mysql_aborted_extra_tags" {
  description = "Extra tags for MySQL aborted connects monitor"
  type        = "list"
  default     = []
}

variable "mysql_aborted_message" {
  description = "Custom message for MySQL aborted connects monitor"
  type        = "string"
  default     = ""
}

variable "mysql_aborted_threshold_critical" {
  default     = 10
  description = "Maximum critical acceptable percent of aborted connects"
}

variable "mysql_aborted_threshold_warning" {
  default     = 5
  description = "Maximum warning acceptable percent of aborted connects"
}

variable "mysql_aborted_time_aggregator" {
  description = "Monitor time aggregator for MySQL aborted connects monitor [available values: min, max or avg]"
  type        = "string"
  default     = "avg"
}

variable "mysql_aborted_timeframe" {
  description = "Monitor timeframe for MySQL aborted connects monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_10m"
}

#################################
###   MySQL slow queries      ###
#################################

variable "mysql_slow_silenced" {
  description = "Groups to mute for MySQL slow queries monitor"
  type        = "map"
  default     = {}
}

variable "mysql_slow_enabled" {
  description = "Flag to enable MySQL slow queries monitor"
  type        = "string"
  default     = "true"
}

variable "mysql_slow_extra_tags" {
  description = "Extra tags for MySQL slow queries monitor"
  type        = "list"
  default     = []
}

variable "mysql_slow_message" {
  description = "Custom message for MySQL slow queries monitor"
  type        = "string"
  default     = ""
}

variable "mysql_slow_threshold_critical" {
  default     = 20
  description = "Maximum critical acceptable percent of slow queries"
}

variable "mysql_slow_threshold_warning" {
  default     = 5
  description = "Maximum warning acceptable percent of slow queries"
}

variable "mysql_slow_time_aggregator" {
  description = "Monitor time aggregator for MySQL slow queries monitor [available values: min, max or avg]"
  type        = "string"
  default     = "avg"
}

variable "mysql_slow_timeframe" {
  description = "Monitor timeframe for MySQL slow queries monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_15m"
}

#################################
# MySQL innodb pool efficiency  #
#################################

variable "mysql_pool_efficiency_silenced" {
  description = "Groups to mute for MySQL innodb buffer pool efficiency monitor"
  type        = "map"
  default     = {}
}

variable "mysql_pool_efficiency_enabled" {
  description = "Flag to enable MySQL innodb buffer pool efficiency monitor"
  type        = "string"
  default     = "true"
}

variable "mysql_pool_efficiency_extra_tags" {
  description = "Extra tags for MySQL innodb buffer pool efficiency monitor"
  type        = "list"
  default     = []
}

variable "mysql_pool_efficiency_message" {
  description = "Custom message for MySQL innodb buffer pool efficiency monitor"
  type        = "string"
  default     = ""
}

variable "mysql_pool_efficiency_threshold_critical" {
  default     = 30
  description = "Maximum critical acceptable percent of innodb buffer pool efficiency"
}

variable "mysql_pool_efficiency_threshold_warning" {
  default     = 20
  description = "Maximum warning acceptable percent of innodb buffer pool efficiency"
}

variable "mysql_pool_efficiency_time_aggregator" {
  description = "Monitor time aggregator for MySQL innodb buffer pool efficiency monitor [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "mysql_pool_efficiency_timeframe" {
  description = "Monitor timeframe for MySQL innodb buffer pool efficiency monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_1h"
}

#################################
# MySQL innodb pool utilization #
#################################

variable "mysql_pool_utilization_silenced" {
  description = "Groups to mute for MySQL innodb buffer pool utilization monitor"
  type        = "map"
  default     = {}
}

variable "mysql_pool_utilization_enabled" {
  description = "Flag to enable MySQL innodb buffer pool utilization monitor"
  type        = "string"
  default     = "true"
}

variable "mysql_pool_utilization_extra_tags" {
  description = "Extra tags for MySQL innodb buffer pool utilization monitor"
  type        = "list"
  default     = []
}

variable "mysql_pool_utilization_message" {
  description = "Custom message for MySQL innodb buffer pool utilization monitor"
  type        = "string"
  default     = ""
}

variable "mysql_pool_utilization_threshold_critical" {
  default     = 95
  description = "Maximum critical acceptable percent of innodb buffer pool utilization"
}

variable "mysql_pool_utilization_threshold_warning" {
  default     = 80
  description = "Maximum warning acceptable percent of innodb buffer pool utilization"
}

variable "mysql_pool_utilization_time_aggregator" {
  description = "Monitor time aggregator for MySQL innodb buffer pool utilization monitor [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "mysql_pool_utilization_timeframe" {
  description = "Monitor timeframe for MySQL innodb buffer pool utilization monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_1h"
}

#################################
###   MySQL threads           ###
#################################

variable "mysql_threads_silenced" {
  description = "Groups to mute for mysql threads monitor"
  type        = "map"
  default     = {}
}

variable "mysql_threads_enabled" {
  description = "Flag to enable mysql threads monitor"
  type        = "string"
  default     = "true"
}

variable "mysql_threads_extra_tags" {
  description = "Extra tags for MySQL threads monitor"
  type        = "list"
  default     = []
}

variable "mysql_threads_message" {
  description = "Custom message for MySQL threads monitor"
  type        = "string"
  default     = ""
}

variable "mysql_threads_threshold_critical" {
  default     = 1
  description = "Maximum critical acceptable number of threads"
}

variable "mysql_threads_detection_algorithm" {
  description = "Anomaly Detection Algorithm used"
  type        = "string"
  default     = "basic"
}

variable "mysql_threads_deviations" {
  description = "Deviations to detect the anomaly"
  type        = "string"
  default     = 2
}

variable "mysql_threads_direction" {
  description = "Direction of the anomaly. It can be both, below or above."
  type        = "string"
  default     = "above"
}

variable "mysql_threads_alert_window" {
  description = "Alert window."
  type        = "string"
  default     = "last_15m"
}

variable "mysql_threads_interval" {
  description = "Interval."
  type        = "string"
  default     = 60
}

variable "mysql_threads_count_default_zero" {
  description = "Count default zero."
  type        = "string"
  default     = "true"
}

variable "mysql_threads_seasonality" {
  description = "Seasonality of the algorithm"
  type        = "string"
  default     = "daily"
}

variable "mysql_threads_time_aggregator" {
  description = "Monitor time aggregator for MySQL threads monitor [available values: min, max or avg]"
  type        = "string"
  default     = "avg"
}

variable "mysql_threads_timeframe" {
  description = "Monitor timeframe for MySQL threads monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_4h"
}

#################################
###   MySQL queries           ###
#################################

variable "mysql_questions_silenced" {
  description = "Groups to mute for mysql queries monitor"
  type        = "map"
  default     = {}
}

variable "mysql_questions_enabled" {
  description = "Flag to enable mysql queries monitor"
  type        = "string"
  default     = "true"
}

variable "mysql_questions_extra_tags" {
  description = "Extra tags for MySQL queries monitor"
  type        = "list"
  default     = []
}

variable "mysql_questions_message" {
  description = "Custom message for MySQL queries monitor"
  type        = "string"
  default     = ""
}

variable "mysql_questions_threshold_critical" {
  default     = 1
  description = "Maximum critical acceptable number of queries"
}

variable "mysql_questions_detection_algorithm" {
  description = "Anomaly Detection Algorithm used"
  type        = "string"
  default     = "agile"
}

variable "mysql_questions_deviations" {
  description = "Deviations to detect the anomaly"
  type        = "string"
  default     = 5
}

variable "mysql_questions_direction" {
  description = "Direction of the anomaly. It can be both, below or above."
  type        = "string"
  default     = "both"
}

variable "mysql_questions_alert_window" {
  description = "Alert window."
  type        = "string"
  default     = "last_15m"
}

variable "mysql_questions_interval" {
  description = "Interval."
  type        = "string"
  default     = 60
}

variable "mysql_questions_count_default_zero" {
  description = "Count default zero."
  type        = "string"
  default     = "true"
}

variable "mysql_questions_seasonality" {
  description = "Seasonality of the algorithm"
  type        = "string"
  default     = "daily"
}

variable "mysql_questions_time_aggregator" {
  description = "Monitor time aggregator for MySQL queries monitor [available values: min, max or avg]"
  type        = "string"
  default     = "avg"
}

variable "mysql_questions_timeframe" {
  description = "Monitor timeframe for MySQL queries monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_4h"
}
