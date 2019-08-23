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

variable "host_basic_anomaly_message" {
  description = "Custom message for Host estimated usage basic anomaly monitor"
  type        = string
  default     = ""
}

variable "host_basic_anomaly_time_aggregator" {
  description = "Time aggregator for Host estimated usage basic anomaly monitor"
  type        = string
  default     = "avg"
}

variable "host_basic_anomaly_timeframe" {
  description = "Timeframe for Host estimated usage basic anomaly monitor"
  type        = string
  default     = "last_1w"
}

variable "host_basic_anomaly_detection_algorithm" {
  description = "Anomaly Detection Algorithm used"
  type        = string
  default     = "basic"
}

variable "host_basic_anomaly_deviations" {
  description = "Deviations to detect the anomaly"
  type        = string
  default     = 3
}

variable "host_basic_anomaly_direction" {
  description = "Direction of the anomaly. It can be both, below or above."
  type        = string
  default     = "above"
}

variable "host_basic_anomaly_alert_window" {
  description = "Alert window."
  type        = string
  default     = "last_1d"
}

variable "host_basic_anomaly_interval" {
  description = "Interval."
  type        = string
  default     = 3600
}

variable "host_basic_anomaly_count_default_zero" {
  description = "Count default zero."
  type        = string
  default     = "true"
}

variable "host_basic_anomaly_threshold_critical" {
  description = "Host estimated usage basic anomaly critical threshold"
  type        = string
  default     = 1
}

variable "host_basic_anomaly_enabled" {
  description = "Flag to enable Host estimated usage basic anomaly monitor"
  type        = string
  default     = "true"
}

variable "host_basic_anomaly_extra_tags" {
  description = "Extra tags for Host estimated usage basic anomaly monitor"
  type        = list(string)
  default     = []
}

variable "host_agile_anomaly_message" {
  description = "Custom message for Host estimated usage agile anomaly monitor"
  type        = string
  default     = ""
}

variable "host_agile_anomaly_time_aggregator" {
  description = "Time aggregator for Host estimated usage agile anomaly monitor"
  type        = string
  default     = "avg"
}

variable "host_agile_anomaly_timeframe" {
  description = "Timeframe for Host estimated usage agile anomaly monitor"
  type        = string
  default     = "last_1w"
}

variable "host_agile_anomaly_detection_algorithm" {
  description = "Anomaly Detection Algorithm used"
  type        = string
  default     = "agile"
}

variable "host_agile_anomaly_deviations" {
  description = "Deviations to detect the anomaly"
  type        = string
  default     = 2
}

variable "host_agile_anomaly_direction" {
  description = "Direction of the anomaly. It can be both, below or above."
  type        = string
  default     = "above"
}

variable "host_agile_anomaly_alert_window" {
  description = "Alert window."
  type        = string
  default     = "last_4h"
}

variable "host_agile_anomaly_interval" {
  description = "Interval."
  type        = string
  default     = 3600
}

variable "host_agile_anomaly_count_default_zero" {
  description = "Count default zero"
  type        = string
  default     = "true"
}

variable "host_agile_anomaly_seasonality" {
  description = "Seasonality of the algorithm"
  type        = string
  # TODO probably to replace by weekly when enough data history to test
  default = "daily"
}

variable "host_agile_anomaly_threshold_critical" {
  description = "Host estimated usage agile anomaly  critical threshold"
  type        = string
  default     = 1
}

variable "host_agile_anomaly_enabled" {
  description = "Flag to enable Host estimated usage agile anomaly monitor"
  type        = string
  default     = "true"
}

variable "host_agile_anomaly_extra_tags" {
  description = "Extra tags for Host estimated usage agile anomaly monitor"
  type        = list(string)
  default     = []
}

variable "host_change_message" {
  description = "Custom message for Host estimated usage change monitor"
  type        = string
  default     = ""
}

variable "host_change_time_aggregator" {
  description = "Time aggregator for Host estimated usage change monitor"
  type        = string
  default     = "max"
}

variable "host_change_timeframe" {
  description = "Timeframe for Host estimated usage change monitor"
  type        = string
  default     = "last_15m"
}

variable "host_change_threshold_warning" {
  description = "Host estimated usage change warning threshold"
  type        = string
  default     = 40
}

variable "host_change_threshold_critical" {
  description = "Host estimated usage change critical threshold"
  type        = string
  default     = 60
}

variable "host_change_enabled" {
  description = "Flag to enable Host estimated usage change monitor"
  type        = string
  default     = "true"
}

variable "host_change_extra_tags" {
  description = "Extra tags for Host estimated usage change monitor"
  type        = list(string)
  default     = []
}

variable "host_timeshift_message" {
  description = "Custom message for Host estimated usage timeshift monitor"
  type        = string
  default     = ""
}

variable "host_timeshift_time_aggregator" {
  description = "Time aggregator for Host estimated usage timeshift monitor"
  type        = string
  default     = "max"
}

variable "host_timeshift_timeframe" {
  description = "Timeframe for Host estimated usage timeshift monitor"
  type        = string
  default     = "last_1d"
}

variable "host_timeshift_threshold_warning" {
  description = "Host estimated usage timeshift warning threshold"
  type        = string
  default     = 40
}

variable "host_timeshift_threshold_critical" {
  description = "Host estimated usage timeshift critical threshold"
  type        = string
  default     = 60
}

variable "host_timeshift_enabled" {
  description = "Flag to enable Host estimated usage timeshift monitor"
  type        = string
  default     = "true"
}

variable "host_timeshift_extra_tags" {
  description = "Extra tags for Host estimated usage timeshift monitor"
  type        = list(string)
  default     = []
}

