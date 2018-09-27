# Global Terraform
variable "environment" {
  description = "Architecture Environment"
  type        = "string"
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

# System generic specific

variable "cpu_high_silenced" {
  description = "Groups to mute for CPU high monitor"
  type        = "map"
  default     = {}
}

variable "cpu_high_enabled" {
  description = "Flag to enable CPU high monitor"
  type        = "string"
  default     = "true"
}

variable "cpu_high_extra_tags" {
  description = "Extra tags for CPU high monitor"
  type        = "list"
  default     = []
}

variable "cpu_high_message" {
  description = "Custom message for CPU high monitor"
  type        = "string"
  default     = ""
}

variable "cpu_high_time_aggregator" {
  description = "Monitor aggregator for CPU high [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "cpu_high_timeframe" {
  description = "Monitor timeframe for CPU high [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_10m"
}

variable "cpu_high_threshold_warning" {
  description = "CPU high warning threshold"
  default     = 85
}

variable "cpu_high_threshold_critical" {
  description = "CPU high critical threshold"
  default     = 90
}

variable "cpu_load_silenced" {
  description = "Groups to mute for CPU load ratio monitor"
  type        = "map"
  default     = {}
}

variable "cpu_load_enabled" {
  description = "Flag to enable CPU load ratio monitor"
  type        = "string"
  default     = "true"
}

variable "cpu_load_extra_tags" {
  description = "Extra tags for CPU load ratio monitor"
  type        = "list"
  default     = []
}

variable "cpu_load_message" {
  description = "Custom message for CPU load ratio monitor"
  type        = "string"
  default     = ""
}

variable "cpu_load_time_aggregator" {
  description = "Monitor aggregator for CPU load ratio [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "cpu_load_timeframe" {
  description = "Monitor timeframe for CPU load ratio [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_15m"
}

variable "cpu_load_threshold_warning" {
  description = "CPU load ratio warning threshold"
  default     = 2
}

variable "cpu_load_threshold_critical" {
  description = "CPU load ratio critical threshold"
  default     = 2.5
}

variable "free_disk_space_silenced" {
  description = "Groups to mute for Free diskspace monitor"
  type        = "map"
  default     = {}
}

variable "free_disk_space_enabled" {
  description = "Flag to enable Free diskspace monitor"
  type        = "string"
  default     = "true"
}

variable "free_disk_space_extra_tags" {
  description = "Extra tags for Free diskspace monitor"
  type        = "list"
  default     = []
}

variable "free_disk_space_message" {
  description = "Custom message for Free diskspace monitor"
  type        = "string"
  default     = ""
}

variable "free_disk_space_time_aggregator" {
  description = "Monitor aggregator for Free diskspace [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "free_disk_space_timeframe" {
  description = "Monitor timeframe for Free diskspace [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "free_disk_space_threshold_warning" {
  description = "Free disk space warning threshold"
  default     = 20
}

variable "free_disk_space_threshold_critical" {
  description = "Free disk space critical threshold"
  default     = 10
}

variable "free_disk_space_forecast_silenced" {
  description = "Groups to mute for Free diskspace forecast monitor"
  type        = "map"
  default     = {}
}

variable "free_disk_space_forecast_enabled" {
  description = "Flag to enable Free diskspace forecast monitor"
  type        = "string"
  default     = "true"
}

variable "free_disk_space_forecast_extra_tags" {
  description = "Extra tags for Free diskspace forecast monitor"
  type        = "list"
  default     = []
}

variable "free_disk_space_forecast_message" {
  description = "Custom message for Free diskspace forecast monitor"
  type        = "string"
  default     = ""
}

variable "free_disk_space_forecast_time_aggregator" {
  description = "Monitor aggregator for Free diskspace forecast [available values: min, max or avg]"
  type        = "string"
  default     = "max"
}

variable "free_disk_space_forecast_timeframe" {
  description = "Monitor timeframe for Free diskspace forecast [available values: `next_12h`, `next_#d` (1, 2, or 3), `next_#w` (1 or 2) or `next_#mo` (1, 2 or 3)]"
  type        = "string"
  default     = "next_1w"
}

variable "free_disk_space_forecast_algorithm" {
  description = "Algorithm for the Free diskspace Forecast monitor [available values: `linear` or `seasonal`]"
  type        = "string"
  default     = "linear"
}

variable "free_disk_space_forecast_deviations" {
  description = "Deviations for the Free diskspace Forecast monitor [available values: `1`, `2`, `3`, `4` or `5`]"
  type        = "string"
  default     = 1
}

variable "free_disk_space_forecast_interval" {
  description = "Interval for the Free diskspace Forecast monitor [available values: `30m`, `60m` or `120m`]"
  type        = "string"
  default     = "60m"
}

variable "free_disk_space_forecast_linear_history" {
  description = "History for the Free diskspace Forecast monitor [available values: `12h`, `#d` (1, 2, or 3), `#w` (1, or 2) or `#mo` (1, 2 or 3)]"
  type        = "string"
  default     = "1w"
}

variable "free_disk_space_forecast_linear_model" {
  description = "Model for the Free diskspace Forecast monitor [available values: `default`, `simple` or `reactive`]"
  type        = "string"
  default     = "default"
}

variable "free_disk_space_forecast_seasonal_seasonality" {
  description = "Seasonality for the Free diskspace Forecast monitor"
  type        = "string"
  default     = "weekly"
}

variable "free_disk_space_forecast_threshold_critical_recovery" {
  description = "Free disk space forecast recovery threshold"
  default     = 72
}

variable "free_disk_space_forecast_threshold_critical" {
  description = "Free disk space forecast critical threshold"
  default     = 80
}

variable "free_disk_inodes_silenced" {
  description = "Groups to mute for Free disk inodes monitor"
  type        = "map"
  default     = {}
}

variable "free_disk_inodes_enabled" {
  description = "Flag to enable Free disk inodes monitor"
  type        = "string"
  default     = "true"
}

variable "free_disk_inodes_extra_tags" {
  description = "Extra tags for Free disk inodes monitor"
  type        = "list"
  default     = []
}

variable "free_disk_inodes_message" {
  description = "Custom message for Free disk inodes monitor"
  type        = "string"
  default     = ""
}

variable "free_disk_inodes_time_aggregator" {
  description = "Monitor aggregator for Free disk inodes [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "free_disk_inodes_timeframe" {
  description = "Monitor timeframe for Free disk inodes [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "free_disk_inodes_threshold_warning" {
  description = "Free disk space warning threshold"
  default     = 10
}

variable "free_disk_inodes_threshold_critical" {
  description = "Free disk space critical threshold"
  default     = 5
}

variable "free_memory_silenced" {
  description = "Groups to mute for Free memory monitor"
  type        = "map"
  default     = {}
}

variable "free_memory_enabled" {
  description = "Flag to enable Free memory monitor"
  type        = "string"
  default     = "true"
}

variable "free_memory_extra_tags" {
  description = "Extra tags for Free memory monitor"
  type        = "list"
  default     = []
}

variable "free_memory_message" {
  description = "Mandatory message for Free memory monitor to avoid NBH alerting by default"
  type        = "string"
}

variable "free_memory_time_aggregator" {
  description = "Monitor aggregator for Free memory [available values: min, max or avg]"
  type        = "string"
  default     = "max"
}

variable "free_memory_timeframe" {
  description = "Monitor timeframe for Free memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "free_memory_threshold_warning" {
  description = "Free disk space warning threshold"
  default     = 10
}

variable "free_memory_threshold_critical" {
  description = "Free disk space critical threshold"
  default     = 5
}
