# Global Terraform
variable "environment" {
  description = "Architecture Environment"
  type        = string
}

# Global DataDog
variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
}

variable "new_host_delay" {
  description = "Delay in seconds before monitor new resource"
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

variable "es_cluster_status_no_data_timeframe" {
  description = "Number of minutes before reporting no data"
  type        = string
  default     = 10
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

# AWS ElasticSearch Service specific

variable "es_cluster_status_enabled" {
  description = "Flag to enable ES cluster status monitor"
  type        = string
  default     = "true"
}

variable "es_cluster_status_extra_tags" {
  description = "Extra tags for ES cluster status monitor"
  type        = list(string)
  default     = []
}

variable "es_cluster_status_message" {
  description = "Custom message for ES cluster status monitor"
  type        = string
  default     = ""
}

variable "es_cluster_status_timeframe" {
  description = "Monitor timeframe for ES cluster status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_30m"
}

variable "es_cluster_volume_size" {
  description = "ElasticSearch Domain volume size (in GB)"
}

variable "diskspace_enabled" {
  description = "Flag to enable ES cluster diskspace monitor"
  type        = string
  default     = "true"
}

variable "diskspace_extra_tags" {
  description = "Extra tags for ES cluster diskspace monitor"
  type        = list(string)
  default     = []
}

variable "diskspace_message" {
  description = "Custom message for ES cluster diskspace monitor"
  type        = string
  default     = ""
}

variable "diskspace_time_aggregator" {
  description = "Monitor aggregator for ES cluster diskspace [available values: min, max or avg]"
  type        = string
  default     = "max"
}

variable "diskspace_timeframe" {
  description = "Monitor timeframe for ES cluster diskspace [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "diskspace_threshold_warning" {
  description = "Disk free space in percent (warning threshold)"
  default     = "20"
}

variable "diskspace_threshold_critical" {
  description = "Disk free space in percent (critical threshold)"
  default     = "10"
}

variable "cpu_enabled" {
  description = "Flag to enable ES cluster cpu monitor"
  type        = string
  default     = "true"
}

variable "cpu_extra_tags" {
  description = "Extra tags for ES cluster cpu monitor"
  type        = list(string)
  default     = []
}

variable "cpu_message" {
  description = "Custom message for ES cluster cpu monitor"
  type        = string
  default     = ""
}

variable "cpu_time_aggregator" {
  description = "Monitor aggregator for ES cluster cpu [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "cpu_timeframe" {
  description = "Monitor timeframe for ES cluster cpu [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "cpu_threshold_warning" {
  description = "CPU usage in percent (warning threshold)"
  default     = "80"
}

variable "cpu_threshold_critical" {
  description = "CPU usage in percent (critical threshold)"
  default     = "90"
}

