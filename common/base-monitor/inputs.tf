# Datadog global variables

variable "environment" {
  description = "Architecture environment"
  type        = "string"
}

variable "message" {
  description = "Message sent when a monitor is triggered"
}

variable "delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
}

# Base Template variables

variable "name_use_defaults" {
  description = "Use default name convention"
  default     = "true"
}

variable "name" {
  description = "Name of Datadog monitor."
  type        = "string"
}

variable "thresholds_unit" {
  description = "Unit of the values used as thresholds, used in monitor name."
  type        = "string"
  default     = ""
}

variable "query" {
  description = "Query to use for monitor evaluation."
  type        = "string"
}

variable "resource_kind" {
  description = "Kind of resource monitored (eg. storage, elasticsearch, apache, ec2)."
  type        = "string"
}

variable "extra_tags" {
  description = "Extra tags to add on this monitor in addition of the standard ones."
  type        = "map"
  default     = {}
}

variable "provider" {
  description = "Provider of the monitors resources (eg. azure, amazon)."
  type        = "string"
}

variable "type" {
  description = "Type of monitor query (metric alert or query alert)."
  type        = "string"
  default     = "metric alert"
}

variable "thresholds" {
  description = "Map of the monitors thresholds, possible keys are `critical` and `warning`."
  type        = "map"
  default     = {}
}

variable "silenced" {
  description = "Map of the scopes to mute for a given timestamp (or 0)."
  type        = "map"
  default     = {}
}

variable "notify_no_data" {
  description = "A boolean indicating whether this monitor will notify when data stops reporting."
  type        = "string"
}

variable "evaluation_delay" {
  description = "Time (in seconds) to delay evaluation, as a non-negative integer."
  type        = "string"
  default     = "600"
}

variable "new_host_delay" {
  description = "Time (in seconds) to allow a host to boot and applications to fully start before starting the evaluation of monitor results."
  type        = "string"
  default     = "300"
}

variable "timeout_h" {
  description = "The number of hours of the monitor not reporting data before it will automatically resolve from a triggered state."
  type        = "string"
  default     = "0"
}

variable "require_full_window" {
  description = "A boolean indicating whether this monitor needs a full window of data before it's evaluated."
  type = "string"
  default = "false"
}

variable "critical_threshold" {
  description = "Critical threshold to set, mandatory if `warning_threshold` is set"
  default = ""
}
variable "warning_threshold" {
  description = "Warning threshold to set"
  default = ""
}

variable "filter_tags_use_defaults" {
  description = "Use default filter tags convention"
  default     = "true"
}

variable "filter_tags_custom" {
  description = "Tags used for custom filtering when filter_tags_use_defaults is false"
  default     = "*"
}
