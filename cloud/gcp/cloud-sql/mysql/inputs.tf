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
# Replication Lag
#
variable "replication_lag_enabled" {
  description = "Whether or not to create the monitor"
  type        = "string"
  default     = "true"
}

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
  default     = 90
}

variable "replication_lag_threshold_critical" {
  description = "Seconds behind the master (critical threshold)"
  type        = "string"
  default     = 180
}

variable "replication_lag_silenced" {
  description = "Groups to mute for GCP Cloud SQL Replication Lag monitor"
  type        = "map"
  default     = {}
}

variable "replication_lag_extra_tags" {
  description = "Extra tags for GCP Cloud SQL SQL Replication monitor"
  type        = "list"
  default     = []
}

#
# Queries Changing Abnormally
#
variable "queries_changing_anomaly_enabled" {
  description = "Whether or not to create the monitor"
  type        = "string"
  default     = "true"
}

variable "queries_changing_anomaly_message" {
  description = "Custom message for the Queries Changing monitor"
  type        = "string"
  default     = ""
}

variable "queries_changing_anomaly_timeframe" {
  description = "Timeframe for the Queries Changing mon monitor"
  type        = "string"
  default     = "last_1h"
}

variable "queries_changing_anomaly_detection_algorithm" {
  description = "Anomaly Detection Algorithm used"
  type        = "string"
  default     = "agile"
}

variable "queries_changing_anomaly_deviations" {
  description = "Deviations to detect the anomaly"
  type        = "string"
  default     = 4
}

variable "queries_changing_anomaly_direction" {
  description = "Direction of the anomaly. It can be both, below or above."
  type        = "string"
  default     = "both"
}

variable "queries_changing_anomaly_alert_window" {
  description = "Alert window."
  type        = "string"
  default     = "last_30m"
}

variable "queries_changing_anomaly_interval" {
  description = "Interval."
  type        = "string"
  default     = 20
}

variable "queries_changing_anomaly_count_default_zero" {
  description = "Count default zero."
  type        = "string"
  default     = "false"
}

variable "queries_changing_anomaly_seasonality" {
  description = "Seasonality of the algorithm"
  type        = "string"
  default     = "weekly"
}

variable "queries_changing_anomaly_threshold_warning" {
  description = "Queries Changing warning threshold"
  type        = "string"
  default     = 0.5
}

variable "queries_changing_anomaly_threshold_critical" {
  description = "Queries Changing critical threshold"
  type        = "string"
  default     = 1
}

variable "queries_changing_anomaly_threshold_critical_recovery" {
  description = "Queries Changing critical recovery threshold"
  type        = "string"
  default     = 0.99
}

variable "queries_changing_anomaly_silenced" {
  description = "Groups to mute for GCP Cloud SQL Queries Changing monitor"
  type        = "map"
  default     = {}
}

variable "queries_changing_anomaly_extra_tags" {
  description = "Extra tags for GCP Cloud SQL Queries Changing monitor"
  type        = "list"
  default     = []
}

#
# Questions Changing
#
variable "questions_changing_anomaly_enabled" {
  description = "Whether or not to create the monitor"
  type        = "string"
  default     = "true"
}

variable "questions_changing_anomaly_message" {
  description = "Custom message for the Questions Changing monitor"
  type        = "string"
  default     = ""
}

variable "questions_changing_anomaly_timeframe" {
  description = "Timeframe for the Questions Changing monitor"
  type        = "string"
  default     = "last_1h"
}

variable "questions_changing_anomaly_detection_algorithm" {
  description = "Anomaly Detection Algorithm used"
  type        = "string"
  default     = "agile"
}

variable "questions_changing_anomaly_alert_window" {
  description = "Alert window."
  type        = "string"
  default     = "last_30m"
}

variable "questions_changing_anomaly_interval" {
  description = "Interval."
  type        = "string"
  default     = 20
}

variable "questions_changing_anomaly_count_default_zero" {
  description = "Count default zero."
  type        = "string"
  default     = "false"
}

variable "questions_changing_anomaly_deviations" {
  description = "Deviations to detect the anomaly"
  type        = "string"
  default     = 4
}

variable "questions_changing_anomaly_direction" {
  description = "Direction of the anomaly. It can be both, below or above."
  type        = "string"
  default     = "both"
}

variable "questions_changing_anomaly_seasonality" {
  description = "Seasonality of the algorithm"
  type        = "string"
  default     = "weekly"
}

variable "questions_changing_anomaly_threshold_warning" {
  description = "Questions Changing warning threshold"
  type        = "string"
  default     = 0.5
}

variable "questions_changing_anomaly_threshold_critical" {
  description = "Questions Changing critical threshold"
  type        = "string"
  default     = 1
}

variable "questions_changing_anomaly_threshold_critical_recovery" {
  description = "Questions Changing critical recovery threshold"
  type        = "string"
  default     = 0.99
}

variable "questions_changing_anomaly_silenced" {
  description = "Groups to mute for GCP Cloud SQL Questions Changing monitor"
  type        = "map"
  default     = {}
}

variable "questions_changing_anomaly_extra_tags" {
  description = "Extra tags for GCP Cloud SQL Questions Changing monitor"
  type        = "list"
  default     = []
}
