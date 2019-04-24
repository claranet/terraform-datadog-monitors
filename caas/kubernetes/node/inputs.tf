# Datadog global variables

variable "environment" {
  description = "Architecture environment"
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

variable "prefix_slug" {
  description = "Prefix string to prepend between brackets on every monitors names"
  default     = ""
}

# Datadog monitors variables

variable "disk_pressure_silenced" {
  description = "Groups to mute for Disk pressure monitor"
  type        = "map"
  default     = {}
}

variable "disk_pressure_enabled" {
  description = "Flag to enable Disk pressure monitor"
  type        = "string"
  default     = "true"
}

variable "disk_pressure_extra_tags" {
  description = "Extra tags for Disk pressure monitor"
  type        = "list"
  default     = []
}

variable "disk_pressure_message" {
  description = "Custom message for Disk pressure monitor"
  type        = "string"
  default     = ""
}

variable "disk_pressure_threshold_warning" {
  description = "Disk pressure monitor (warning threshold)"
  type        = "string"
  default     = 3
}

variable "disk_out_silenced" {
  description = "Groups to mute for Out of disk monitor"
  type        = "map"
  default     = {}
}

variable "disk_out_enabled" {
  description = "Flag to enable Out of disk monitor"
  type        = "string"
  default     = "true"
}

variable "disk_out_extra_tags" {
  description = "Extra tags for Out of disk monitor"
  type        = "list"
  default     = []
}

variable "disk_out_message" {
  description = "Custom message for Out of disk monitor"
  type        = "string"
  default     = ""
}

variable "disk_out_threshold_warning" {
  description = "Out of disk monitor (warning threshold)"
  type        = "string"
  default     = 3
}

variable "memory_pressure_silenced" {
  description = "Groups to mute for Memory pressure monitor"
  type        = "map"
  default     = {}
}

variable "memory_pressure_enabled" {
  description = "Flag to enable Memory pressure monitor"
  type        = "string"
  default     = "true"
}

variable "memory_pressure_extra_tags" {
  description = "Extra tags for Memory pressure monitor"
  type        = "list"
  default     = []
}

variable "memory_pressure_message" {
  description = "Custom message for Memory pressure monitor"
  type        = "string"
  default     = ""
}

variable "memory_pressure_threshold_warning" {
  description = "Memory pressure monitor (warning threshold)"
  type        = "string"
  default     = 3
}

variable "ready_silenced" {
  description = "Groups to mute for Node ready monitor"
  type        = "map"
  default     = {}
}

variable "ready_enabled" {
  description = "Flag to enable Node ready monitor"
  type        = "string"
  default     = "true"
}

variable "ready_extra_tags" {
  description = "Extra tags for Node ready monitor"
  type        = "list"
  default     = []
}

variable "ready_message" {
  description = "Custom message for Node ready monitor"
  type        = "string"
  default     = ""
}

variable "ready_threshold_warning" {
  description = "Node ready monitor (warning threshold)"
  type        = "string"
  default     = 3
}

variable "kubelet_ping_silenced" {
  description = "Groups to mute for Kubelet ping monitor"
  type        = "map"
  default     = {}
}

variable "kubelet_ping_enabled" {
  description = "Flag to enable Kubelet ping monitor"
  type        = "string"
  default     = "true"
}

variable "kubelet_ping_extra_tags" {
  description = "Extra tags for Kubelet ping monitor"
  type        = "list"
  default     = []
}

variable "kubelet_ping_message" {
  description = "Custom message for Kubelet ping monitor"
  type        = "string"
  default     = ""
}

variable "kubelet_ping_threshold_warning" {
  description = "Kubelet ping monitor (warning threshold)"
  type        = "string"
  default     = 3
}

variable "kubelet_syncloop_silenced" {
  description = "Groups to mute for Kubelet sync loop monitor"
  type        = "map"
  default     = {}
}

variable "kubelet_syncloop_enabled" {
  description = "Flag to enable Kubelet sync loop monitor"
  type        = "string"
  default     = "true"
}

variable "kubelet_syncloop_extra_tags" {
  description = "Extra tags for Kubelet sync loop monitor"
  type        = "list"
  default     = []
}

variable "kubelet_syncloop_message" {
  description = "Custom message for Kubelet sync loop monitor"
  type        = "string"
  default     = ""
}

variable "kubelet_syncloop_threshold_warning" {
  description = "Kubelet sync loop monitor (warning threshold)"
  type        = "string"
  default     = 3
}

variable "unregister_net_device_silenced" {
  description = "Groups to mute for Unregister net device monitor"
  type        = "map"
  default     = {}
}

variable "unregister_net_device_enabled" {
  description = "Flag to enable Unregister net device monitor"
  type        = "string"
  default     = "true"
}

variable "unregister_net_device_extra_tags" {
  description = "Extra tags for Unregister net device monitor"
  type        = "list"
  default     = []
}

variable "unregister_net_device_message" {
  description = "Custom message for Unregister net device monitor"
  type        = "string"
  default     = ""
}

variable "unregister_net_device_time_aggregator" {
  description = "Monitor aggregator for Unregister net device [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "unregister_net_device_timeframe" {
  description = "Monitor timeframe for Unregister net device [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "15m"
}

variable "unregister_net_device_threshold_critical" {
  default     = 3
  description = "Unregister net device critical threshold"
}

variable "node_unschedulable_silenced" {
  description = "Groups to mute for node unschedulable monitor"
  type        = "map"
  default     = {}
}

variable "node_unschedulable_enabled" {
  description = "Flag to enable node unschedulable monitor"
  type        = "string"
  default     = "true"
}

variable "node_unschedulable_extra_tags" {
  description = "Extra tags for node unschedulable monitor"
  type        = "list"
  default     = []
}

variable "node_unschedulable_message" {
  description = "Custom message for node unschedulable monitor"
  type        = "string"
  default     = ""
}

variable "node_unschedulable_time_aggregator" {
  description = "Monitor aggregator for node unschedulable [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "node_unschedulable_timeframe" {
  description = "Monitor timeframe for node unschedulable [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_1h"
}
