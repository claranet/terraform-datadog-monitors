# Datadog global variables

variable "environment" {
  description = "Architecture environment"
}

variable "default_tags" {
  description = "Default list of tags that will be associate to all monitor"
  type        = list(string)
  default     = ["type:caas", "provider:openmetrics", "resource:velero"]
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

variable "velero_scheduled_backup_missing_monitor_message" {
  description = "Custom message for Velero scheduled backup missing monitor"
  type        = string
  default     = ""
}

variable "velero_scheduled_backup_missing_monitor_timeframe" {
  description = "Monitor timeframe for Velero scheduled backup missing monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_1d"
}

variable "velero_scheduled_backup_missing_enabled" {
  description = "Flag to enable Velero scheduled backup missing monitor"
  type        = string
  default     = "true"
}

variable "velero_scheduled_backup_missing_extra_tags" {
  description = "Extra tags for Velero scheduled backup missing monitor"
  type        = list(string)
  default     = []
}

variable "velero_scheduled_backup_missing_monitor_no_data_timeframe" {
  description = "No data timeframe in minutes"
  default     = 2880
}

variable "velero_backup_failure_monitor_message" {
  description = "Custom message for Velero backup failure monitor"
  type        = string
  default     = ""
}

variable "velero_backup_failure_monitor_timeframe" {
  description = "Monitor timeframe for Velero backup failure monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_1d"
}

variable "velero_backup_failure_enabled" {
  description = "Flag to enable Velero backup failure monitor"
  type        = string
  default     = "true"
}

variable "velero_backup_failure_extra_tags" {
  description = "Extra tags for Velero backup failure monitor"
  type        = list(string)
  default     = []
}

variable "velero_backup_partial_failure_monitor_message" {
  description = "Custom message for Velero backup partial failure monitor"
  type        = string
  default     = ""
}

variable "velero_backup_partial_failure_monitor_timeframe" {
  description = "Monitor timeframe for Velero backup partial failure monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_1d"
}

variable "velero_backup_partial_failure_enabled" {
  description = "Flag to enable Velero backup partial failure monitor"
  type        = string
  default     = "true"
}

variable "velero_backup_partial_failure_extra_tags" {
  description = "Extra tags for Velero backup partial failure monitor"
  type        = list(string)
  default     = []
}

variable "velero_backup_deletion_failure_monitor_message" {
  description = "Custom message for Velero backup deletion failure monitor"
  type        = string
  default     = ""
}

variable "velero_backup_deletion_failure_monitor_timeframe" {
  description = "Monitor timeframe for Velero backup deletion failure monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_1d"
}

variable "velero_backup_deletion_failure_enabled" {
  description = "Flag to enable Velero backup deletion failure monitor"
  type        = string
  default     = "true"
}

variable "velero_backup_deletion_failure_extra_tags" {
  description = "Extra tags for Velero backup deletion failure monitor"
  type        = list(string)
  default     = []
}

variable "velero_volume_snapshot_failure_monitor_message" {
  description = "Custom message for Velero volume snapshot failure monitor"
  type        = string
  default     = ""
}

variable "velero_volume_snapshot_failure_monitor_timeframe" {
  description = "Monitor timeframe for Velero volume snapshot failure monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_1d"
}

variable "velero_volume_snapshot_failure_enabled" {
  description = "Flag to enable Velero volume snapshot failure monitor"
  type        = string
  default     = "true"
}

variable "velero_volume_snapshot_failure_extra_tags" {
  description = "Extra tags for Velero volume snapshot failure monitor"
  type        = list(string)
  default     = []
}
