# Global variables
variable "tags" {
  type    = list(string)
  default = ["type:database", "provider:postgres", "resource:postgresql"]
}

# Global DataDog
variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 15
}

variable "new_host_delay" {
  description = "Delay in seconds for the metric evaluation"
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

variable "notify_no_data" {
  description = "Will raise no data alert if set to true"
  default     = true
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

# PostgreSQL specific
##################################
###   PostgreSQL availability  ###
##################################

variable "postgresql_availability_enabled" {
  description = "Flag to enable PostgreSQL availability monitor"
  type        = string
  default     = "true"
}

variable "postgresql_availability_extra_tags" {
  description = "Extra tags for PostgreSQL availability monitor"
  type        = list(string)
  default     = []
}

variable "postgresql_availability_message" {
  description = "Custom message for PostgreSQL availability monitor"
  type        = string
  default     = ""
}

variable "postgresql_availability_threshold_warning" {
  description = "PostgreSQL availability monitor (warning threshold)"
  type        = string
  default     = 3
}

variable "postgresql_availability_no_data_timeframe" {
  description = "PostgreSQL availability monitor no data timeframe"
  type        = string
  default     = 10
}

##################################
###   PostgreSQL connections   ###
##################################

variable "postgresql_connection_threshold_critical" {
  default     = 80
  description = "Maximum critical acceptable percent of connections"
}

variable "postgresql_connection_threshold_warning" {
  default     = 70
  description = "Maximum warning acceptable percent of connections"
}

variable "postgresql_connection_enabled" {
  description = "Flag to enable PostgreSQL connection monitor"
  type        = string
  default     = "true"
}

variable "postgresql_connection_extra_tags" {
  description = "Extra tags for PostgreSQL connection connects monitor"
  type        = list(string)
  default     = []
}

variable "postgresql_connection_message" {
  description = "Custom message for PostgreSQL connection monitor"
  type        = string
  default     = ""
}

variable "postgresql_connection_time_aggregator" {
  description = "Monitor time aggregator for PostgreSQL connection monitor [available values: min, max or avg]"
  type        = string
  default     = "avg"
}

variable "postgresql_connection_timeframe" {
  description = "Monitor timeframe for PostgreSQL connection monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

############################
###   PostgreSQL locks   ###
############################

variable "postgresql_lock_threshold_critical" {
  default     = 99
  description = "Maximum critical acceptable number of locks"
}

variable "postgresql_lock_threshold_warning" {
  default     = 70
  description = "Maximum warning acceptable number of locks"
}

variable "postgresql_lock_enabled" {
  description = "Flag to enable PostgreSQL lock monitor"
  type        = string
  default     = "true"
}

variable "postgresql_lock_extra_tags" {
  description = "Extra tags for PostgreSQL lock connects monitor"
  type        = list(string)
  default     = []
}

variable "postgresql_lock_message" {
  description = "Custom message for PostgreSQL lock monitor"
  type        = string
  default     = ""
}

variable "postgresql_lock_time_aggregator" {
  description = "Monitor time aggregator for PostgreSQL lock monitor [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "postgresql_lock_timeframe" {
  description = "Monitor timeframe for PostgreSQL lock monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

#################################
###   PostgreSQL disk queue   ###
#################################

variable "postgresql_disk_queue_aggregator" {
  description = "Monitor time aggregator for PostgreSQL disk queue depth [available values: min, max or avg]"
  type        = string
  default     = "avg"
}

variable "postgresql_disk_queue_timeframe" {
  description = "Monitor timeframe for PostgreSQL disk queue depth [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "postgresql_disk_queue_threshold_critical" {
  default     = 64
  description = "Maximum critical acceptable number of locks"
}

variable "postgresql_disk_queue_threshold_warning" {
  default     = 48
  description = "Maximum warning acceptable number of disk queue"
}

variable "postgresql_disk_queue_enabled" {
  description = "Flag to enable PostgreSQL disk queue"
  type        = bool
  default     = true
}

variable "postgresql_disk_queue_extra_tags" {
  description = "Extra tags for PostgreSQL lock connects monitor"
  type        = list(string)
  default     = []
}

variable "postgresql_disk_queue_message" {
  description = "Custom message for PostgreSQL disk queue monitor"
  type        = string
  default     = ""
}

########################################
###   PostgreSQL replication delay   ###
########################################

variable "postgresql_replication_delay_aggregator" {
  description = "Monitor time aggregator for PostgreSQL replication delay [available values: min, max or avg]"
  type        = string
  default     = "avg"
}

variable "postgresql_replication_delay_timeframe" {
  description = "Monitor timeframe for PostgreSQL replication delay [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "postgresql_replication_delay_threshold_critical" {
  default     = 200
  description = "Critical threshold in seconds"
}

variable "postgresql_replication_delay_threshold_warning" {
  default     = 100
  description = "Warning threshold in seconds"
}

variable "postgresql_replication_delay_enabled" {
  description = "Flag to enable PostgreSQL replication delay monitor"
  type        = bool
  default     = true
}

variable "postgresql_replication_delay_extra_tags" {
  description = "Extra tags for PostgreSQL replication delay monitor"
  type        = list(string)
  default     = []
}

variable "postgresql_replication_delay_message" {
  description = "Custom message for PostgreSQL replication delay monitor"
  type        = string
  default     = ""
}
