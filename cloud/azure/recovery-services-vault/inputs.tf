# Global variables
variable "tags" {
  type    = list(string)
  default = ["type:cloud", "provider:azure", "resource:recovery_services_vault"]
}

# Datadog variables
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


variable "no_data_timeframe" {
  description = "Number of minutes before reporting no data on Backup Unhealthy Event monitor"
  type        = string
  default     = 1440
}

# Azure Recovery Services Vault Backup Backup Unhealthy Event monitor
variable "backup_unhealthy_event_enabled" {
  description = "Flag to enable Recovery Services Vault Backup Unhealthy Event monitor"
  type        = string
  default     = "true"
}

variable "backup_unhealthy_event_message" {
  description = "Custom message for Recovery Services Vault Backup Unhealthy Event monitor"
  type        = string
  default     = ""
}

variable "backup_unhealthy_event_time_aggregator" {
  description = "Monitor aggregator for Recovery Services Vault Backup Unhealthy Event [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "backup_unhealthy_event_timeframe" {
  description = "Monitor timeframe for Recovery Services Vault Backup Unhealthy Event [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  default     = "last_1d"
}

variable "backup_unhealthy_event_extra_tags" {
  description = "Extra tags for Recovery Services Vault Backup Unhealthy Event monitor"
  type        = list(string)
  default     = []
}

# Azure Recovery Services Vault Backup Restore Unhealthy Event monitor
variable "restore_unhealthy_event_enabled" {
  description = "Flag to enable Recovery Services Vault Restore Unhealthy Event monitor"
  type        = string
  default     = "true"
}

variable "restore_unhealthy_event_message" {
  description = "Custom message for Recovery Services Vault Restore Unhealthy Event monitor"
  type        = string
  default     = ""
}

variable "restore_unhealthy_event_time_aggregator" {
  description = "Monitor aggregator for Recovery Services Vault Restore Unhealthy Event [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "restore_unhealthy_event_timeframe" {
  description = "Monitor timeframe for Recovery Services Vault Restore Unhealthy Event [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  default     = "last_1d"
}

variable "restore_unhealthy_event_extra_tags" {
  description = "Extra tags for Recovery Services Vault Restore Unhealthy Event monitor"
  type        = list(string)
  default     = []
}
