#
# Datadog global variables
#
variable "environment" {
  description = "Architecture environment"
  type        = "string"
}

variable "filter_tags_use_defaults" {
  description = "Use default filter tags convention"
  default     = "true"
}

variable "filter_tags_custom" {
  description = "Tags used for custom filtering when filter_tags_use_defaults is false"
  default     = "*"
}

variable "message" {
  description = "Message sent when a monitor is triggered"
}

variable "delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
}

#
# Filter variables
#
variable "project_id" {
  type        = "string"
  description = "ID of the GCP Project"
}

#
# CPU
#
variable "cpu_message" {
  description = "Custom message for the CPU Utilization monitor"
  type        = "string"
  default     = ""
}

variable "cpu_timeframe" {
  description = "Timeframe for the CPU Utilization monitor"
  type        = "string"
  default     = "last_2h"
}

variable "cpu_threshold_warning" {
  description = "CPU Utilization in fraction (warning threshold)"
  type        = "string"
  default     = 0.85
}

variable "cpu_threshold_critical" {
  description = "CPU Utilization in fraction (critical threshold)"
  type        = "string"
  default     = 0.9
}

variable "cpu_silenced" {
  description = "Groups to mute for GCP Cloud SQL CPU Utilization monitor"
  type        = "map"
  default     = {}
}

variable "cpu_tags" {
  description = "Tags to add to the CPU Utilization monitors"
  type        = "map"
  default     = {}
}

#
# DISK
#
variable "disk_message" {
  description = "Custom message for the Disk Utilization monitor"
  type        = "string"
  default     = ""
}

variable "disk_timeframe" {
  description = "Timeframe for the Disk Utilization monitor"
  type        = "string"
  default     = "last_5m"
}

variable "disk_threshold_warning" {
  description = "Disk Utilization in fraction (warning threshold)"
  type        = "string"
  default     = 0.8
}

variable "disk_threshold_critical" {
  description = "Disk Utilization in fraction (critical threshold)"
  type        = "string"
  default     = 0.9
}

variable "disk_silenced" {
  description = "Groups to mute for GCP Cloud SQL Disk Utilization monitor"
  type        = "map"
  default     = {}
}

variable "disk_tags" {
  description = "Tags to add to the Disk Utilization monitors"
  type        = "map"
  default     = {}
}

#
# Network Connections
#
variable "network_connections_message" {
  description = "Custom message for the Netowork Connections monitor"
  type        = "string"
  default     = ""
}

variable "network_connections_timeframe" {
  description = "Timeframe for the Network Connections monitor"
  type        = "string"
  default     = "last_5m"
}

variable "network_connections_hard_limit" {
  description = "Max number of network connections"
  type        = "string"
}

variable "network_connections_threshold_warning" {
  description = "Fraction of network connections (warning threshold)"
  type        = "string"
  default     = 0.8
}

variable "network_connections_threshold_critical" {
  description = "Fraction of network connections (warning threshold)"
  type        = "string"
  default     = 0.9
}

variable "network_connections_silenced" {
  description = "Groups to mute for GCP Cloud SQL Network Connections monitor"
  type        = "map"
  default     = {}
}

variable "network_connections_tags" {
  description = "Tags to add to the Network Connections monitors"
  type        = "map"
  default     = {}
}
