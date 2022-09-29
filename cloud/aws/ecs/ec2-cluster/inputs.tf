#
# Datadog global variables
#
variable "environment" {
  description = "Architecture environment"
  type        = string
}

variable "message" {
  description = "Message sent when a monitor is triggered"
}

variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
}

variable "new_host_delay" {
  description = "Delay in seconds before monitor new resource"
  default     = 300
}

variable "new_group_delay" {
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

#
# Agent Status
#
variable "agent_status_enabled" {
  description = "Flag to enable Agent Status monitor"
  type        = string
  default     = "true"
}

variable "agent_status_extra_tags" {
  description = "Extra tags for Agent Status monitor"
  type        = list(string)
  default     = []
}

variable "agent_status_message" {
  description = "Custom message for the Agent Status monitor"
  type        = string
  default     = ""
}

variable "agent_status_threshold_warning" {
  description = "Warning threshold for the Agent Status monitor"
  type        = string
  default     = 3
}

variable "agent_status_no_data_timeframe" {
  description = "Agent status does not respond monitor no data timeframe"
  type        = string
  default     = 10
}

#
# Cluster CPU Utilization
#
variable "cluster_cpu_utilization_enabled" {
  description = "Flag to enable Cluster CPU utilization monitor"
  type        = string
  default     = "false"
}

variable "cluster_cpu_utilization_extra_tags" {
  description = "Extra tags for Cluster CPU utilization monitor"
  type        = list(string)
  default     = []
}

variable "cluster_cpu_utilization_message" {
  description = "Custom message for the Cluster CPU Utilization monitor"
  type        = string
  default     = ""
}

variable "cluster_cpu_utilization_time_aggregator" {
  description = "Monitor aggregator for Cluster CPU Utilization [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "cluster_cpu_utilization_timeframe" {
  description = "Timeframe for the Cluster CPU Utilization monitor"
  type        = string
  default     = "last_5m"
}

variable "cluster_cpu_utilization_threshold_critical" {
  description = "Critical threshold for the Cluster CPU Utilization monitor"
  type        = string
  default     = 90
}

variable "cluster_cpu_utilization_threshold_warning" {
  description = "Warning threshold for the Cluster CPU Utilization monitor"
  type        = string
  default     = 85
}


#
# Cluster Memory Reservation
#
variable "cluster_memory_reservation_enabled" {
  description = "Flag to enable Cluster memory reservation monitor"
  type        = string
  default     = "false"
}

variable "cluster_memory_reservation_extra_tags" {
  description = "Extra tags for Cluster Memory Reservation monitor"
  type        = list(string)
  default     = []
}

variable "cluster_memory_reservation_message" {
  description = "Custom message for the Cluster Memory Reservation monitor"
  type        = string
  default     = ""
}

variable "cluster_memory_reservation_time_aggregator" {
  description = "Monitor aggregator for Cluster Memory Reservation [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "cluster_memory_reservation_timeframe" {
  description = "Timeframe for the Cluster Memory Reservation monitor"
  type        = string
  default     = "last_5m"
}

variable "cluster_memory_reservation_threshold_critical" {
  description = "Critical threshold for the Cluster Memory Reservation monitor"
  type        = string
  default     = 90
}

variable "cluster_memory_reservation_threshold_warning" {
  description = "Warning threshold for the Cluster Memory Reservation monitor"
  type        = string
  default     = 85
}
