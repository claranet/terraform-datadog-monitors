# Global Terraform
variable "environment" {
  description = "Architecture Environment"
  type        = "string"
}

# Global DataDog
variable "delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 15
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

# Custom CPU instance specific

variable "cpu_high_silenced" {
  description = "Groups to mute for CPU high monitor"
  type        = "map"
  default     = {}
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
  default     = 80
}

variable "cpu_high_threshold_critical" {
  description = "CPU high critical threshold"
  default     = 95
}

variable "cpu_load_silenced" {
  description = "Groups to mute for CPU load ratio monitor"
  type        = "map"
  default     = {}
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
  default     = "last_5m"
}

variable "cpu_load_threshold_warning" {
  description = "CPU load ratio warning threshold"
  default     = 3
}

variable "cpu_load_threshold_critical" {
  description = "CPU load ratio critical threshold"
  default     = 4
}

variable "free_disk_space_silenced" {
  description = "Groups to mute for Free diskspace monitor"
  type        = "map"
  default     = {}
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
  default     = 10
}

variable "free_disk_space_threshold_critical" {
  description = "Free disk space critical threshold"
  default     = 5
}

variable "free_disk_inodes_silenced" {
  description = "Groups to mute for Free disk inodes monitor"
  type        = "map"
  default     = {}
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

variable "free_memory_message" {
  description = "Custom message for Free memory monitor"
  type        = "string"
}

variable "free_memory_time_aggregator" {
  description = "Monitor aggregator for Free memory [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "free_memory_timeframe" {
  description = "Monitor timeframe for Free memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_15m"
}

variable "free_memory_threshold_warning" {
  description = "Free disk space warning threshold"
  default     = 10
}

variable "free_memory_threshold_critical" {
  description = "Free disk space critical threshold"
  default     = 5
}
