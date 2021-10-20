#
# Datadog global variables
#
variable "environment" {
  description = "Architecture environment"
  type        = string
}

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
  description = "Delay in seconds for the new host evaluation"
  default     = 300
}

variable "prefix_slug" {
  description = "Prefix string to prepend between brackets on every monitors names"
  default     = ""
}

variable "notify_no_data" {
  description = "Will raise no data alert if set to true"
  default     = true
}

#
# oldest_unacked_message_age
#

variable "oldest_unacked_message_age_enabled" {
  description = "Flag to enable GCP Pub/Sub Subscription Oldest Unacked Message Age monitor"
  type        = string
  default     = "true"
}

variable "oldest_unacked_message_age_message" {
  description = "Custom message for the GCP Pub/Sub Subscription Oldest Unacked Message Age monitor"
  type        = string
  default     = ""
}

variable "oldest_unacked_message_age_time_aggregator" {
  description = "Time aggregator for the GCP Pub/Sub Subscription Oldest Unacked Message Age monitor"
  type        = string
  default     = "min"
}

variable "oldest_unacked_message_age_timeframe" {
  description = "Timeframe for the GCP Pub/Sub Subscription Oldest Unacked Message Age monitor"
  type        = string
  default     = "last_5m"
}

variable "oldest_unacked_message_age_threshold_warning" {
  description = "GCP Pub/Sub Subscription Oldest Unacked Message Age warning threshold"
  type        = string
  default     = 30
}

variable "oldest_unacked_message_age_threshold_critical" {
  description = "GCP Pub/Sub Subscription Oldest Unacked Message Age critical threshold"
  type        = string
  default     = 120
}

variable "oldest_unacked_message_age_extra_tags" {
  description = "Extra tags for GCP Pub/Sub Subscription Oldest Unacked Message Age monitor"
  type        = list(string)
  default     = []
}

#
# subscription_push_latency
#
variable "subscription_push_latency_enabled" {
  description = "Flag to enable GCP Pub/Sub Subscription Push Latency High monitor"
  type        = string
  default     = "true"
}

variable "subscription_push_latency_message" {
  description = "Custom message for the GCP Pub/Sub Subscription Push Latency High monitor"
  type        = string
  default     = ""
}

variable "subscription_push_latency_time_aggregator" {
  description = "Time aggregator for the GCP Pub/Sub Subscription Push Latency High monitor"
  type        = string
  default     = "avg"
}

variable "subscription_push_latency_timeframe" {
  description = "Timeframe for the GCP Pub/Sub Subscription Push Latency High monitor"
  type        = string
  default     = "last_10m"
}

variable "subscription_push_latency_threshold_warning" {
  description = "GCP Pub/Sub Subscription Push Latency High warning threshold"
  type        = string
  default     = 1000
}

variable "subscription_push_latency_threshold_critical" {
  description = "GCP Pub/Sub Subscription Push Latency High critical threshold"
  type        = string
  default     = 5000
}

variable "subscription_push_latency_extra_tags" {
  description = "Extra tags for GCP Pub/Sub Subscription Push Latency High monitor"
  type        = list(string)
  default     = []
}

#
# subscription_push_latency_anomaly
#
variable "subscription_push_latency_anomaly_enabled" {
  description = "Flag to enable GCP Pub/Sub Subscription Push Latency Anomaly monitor"
  type        = string
  default     = "false"
}

variable "subscription_push_latency_anomaly_message" {
  description = "Custom message for the GCP Pub/Sub Subscription Push Latency Anomaly monitor"
  type        = string
  default     = ""
}

variable "subscription_push_latency_anomaly_time_aggregator" {
  description = "Time aggregator for the GCP Pub/Sub Subscription Push Latency Anomaly monitor"
  type        = string
  default     = "avg"
}

variable "subscription_push_latency_anomaly_timeframe" {
  description = "Timeframe for the GCP Pub/Sub Subscription Push Latency Anomaly monitor"
  type        = string
  default     = "last_10m"
}

variable "subscription_push_latency_anomaly_detection_algorithm" {
  description = "Anomaly Detection Algorithm used"
  type        = string
  default     = "basic"
}

variable "subscription_push_latency_anomaly_direction" {
  description = "Direction of the anomaly. It can be both, below or above."
  type        = string
  default     = "above"
}

variable "subscription_push_latency_anomaly_alert_window" {
  description = "Alert window."
  type        = string
  default     = "last_15m"
}

variable "subscription_push_latency_anomaly_interval" {
  description = "Interval."
  type        = string
  default     = 60
}

variable "subscription_push_latency_anomaly_count_default_zero" {
  description = "Count default zero."
  type        = string
  default     = "true"
}

variable "subscription_push_latency_anomaly_seasonality" {
  description = "Seasonality of the algorithm"
  type        = string
  default     = "daily"
}

variable "subscription_push_latency_anomaly_threshold_warning" {
  description = "GCP Pub/Sub Subscription Push Latency Anomaly warning threshold"
  type        = string
  default     = 1
}

variable "subscription_push_latency_anomaly_threshold_critical" {
  description = "GCP Pub/Sub Subscription Push Latency Anomaly critical threshold"
  type        = string
  default     = 2
}

variable "subscription_push_latency_anomaly_extra_tags" {
  description = "Extra tags for GCP Pub/Sub Subscription Push Latency Anomaly monitor"
  type        = list(string)
  default     = []
}



