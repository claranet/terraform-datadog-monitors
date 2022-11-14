# Datadog global variables

variable "environment" {
  description = "Architecture environment"
}

variable "default_tags" {
  description = "Default list of tags that will be associate to all monitor"
  type        = list(string)
  default     = ["type:caas", "provider:kubernetes", "resource:kubernetes-workload"]
}

variable "extra_tags" {
  description = "Extra optional list of tags to associate to all monitor"
  type        = list(string)
  default     = ["team:claranet"]
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

variable "message" {
  description = "Message sent when a monitor is triggered"
}

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

variable "name_prefix" {
  description = "Prefix string to prepend before every monitors names. Sustitute to the prefix_slug variable"
  default     = ""
}

variable "notify_no_data" {
  description = "Will raise no data alert if set to true"
  default     = true
}

# Datadog monitors variables

variable "job_enabled" {
  description = "Flag to enable Job monitor"
  type        = string
  default     = "true"
}

variable "job_extra_tags" {
  description = "Extra tags for Job monitor"
  type        = list(string)
  default     = []
}

variable "job_message" {
  description = "Custom message for Job monitor"
  type        = string
  default     = ""
}

variable "job_threshold_warning" {
  description = "Job monitor (warning threshold)"
  type        = string
  default     = 3
}

variable "cronjob_enabled" {
  description = "Flag to enable Cronjob monitor"
  type        = string
  default     = "true"
}

variable "cronjob_extra_tags" {
  description = "Extra tags for Cronjob monitor"
  type        = list(string)
  default     = []
}

variable "cronjob_message" {
  description = "Custom message for Cronjob monitor"
  type        = string
  default     = ""
}

variable "cronjob_threshold_warning" {
  description = "Cronjob monitor (warning threshold)"
  type        = string
  default     = 3
}

variable "replica_available_enabled" {
  description = "Flag to enable Available replica monitor"
  type        = string
  default     = "true"
}

variable "replica_available_extra_tags" {
  description = "Extra tags for Available replicamonitor"
  type        = list(string)
  default     = []
}

variable "replica_available_message" {
  description = "Custom message for Available replica monitor"
  type        = string
  default     = ""
}

variable "replica_available_time_aggregator" {
  description = "Monitor aggregator for Available replica [available values: min, max or avg]"
  type        = string
  default     = "max"
}

variable "replica_available_timeframe" {
  description = "Monitor timeframe for Available replica [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "replica_available_threshold_critical" {
  default     = 1
  description = "Available replica critical threshold"
}

variable "replica_ready_enabled" {
  description = "Flag to enable Ready replica monitor"
  type        = string
  default     = "true"
}

variable "replica_ready_extra_tags" {
  description = "Extra tags for Ready replica monitor"
  type        = list(string)
  default     = []
}

variable "replica_ready_message" {
  description = "Custom message for Ready replica monitor"
  type        = string
  default     = ""
}

variable "replica_ready_time_aggregator" {
  description = "Monitor aggregator for Ready replica [available values: min, max or avg]"
  type        = string
  default     = "max"
}

variable "replica_ready_timeframe" {
  description = "Monitor timeframe for Ready replica [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "replica_ready_threshold_critical" {
  default     = 1
  description = "Ready replica critical threshold"
}

variable "replica_current_enabled" {
  description = "Flag to enable Current replica monitor"
  type        = string
  default     = "true"
}

variable "replica_current_extra_tags" {
  description = "Extra tags for Current replica monitor"
  type        = list(string)
  default     = []
}

variable "replica_current_message" {
  description = "Custom message for Current replica monitor"
  type        = string
  default     = ""
}

variable "replica_current_time_aggregator" {
  description = "Monitor aggregator for Current replica [available values: min, max or avg]"
  type        = string
  default     = "max"
}

variable "replica_current_timeframe" {
  description = "Monitor timeframe for Current replica [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "replica_current_threshold_critical" {
  default     = 1
  description = "Current replica critical threshold"
}

variable "replica_group_by" {
  default     = ["namespace", "replicaset"]
  description = "Select group by element on monitors"
}

variable "job_group_by" {
  default     = "job_name"
  description = "Group by element for job monitor"
}

