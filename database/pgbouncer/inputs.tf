variable "environment" {
  description = "Environment"
  type        = string
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

# PGBouncer specific
##################################
###   PGBouncer availability  ###
##################################

variable "pgbouncer_availability_enabled" {
  description = "Flag to enable PGBouncer availability monitor"
  type        = bool
  default     = true
}

variable "pgbouncer_availability_extra_tags" {
  description = "Extra tags for PGBouncer availability monitor"
  type        = list(string)
  default     = []
}

variable "pgbouncer_availability_message" {
  description = "Custom message for PGBouncer availability monitor"
  type        = string
  default     = ""
}

variable "pgbouncer_availability_threshold_warning" {
  description = "PGBouncer availability monitor (warning threshold)"
  type        = string
  default     = 3
}

variable "pgbouncer_availability_no_data_timeframe" {
  description = "PGBouncer availability monitor no data timeframe"
  type        = string
  default     = 10
}

############################################
###   PGBouncer pool connections limit   ###
############################################

variable "pgbouncer_pool_connection_limit_threshold_critical" {
  default     = 100
  description = "Critical number of connection limit monitor"
}

variable "pgbouncer_pool_connection_limit_threshold_warning" {
  default     = 70
  description = "Warning number of connections limit monitor"
}

variable "pgbouncer_pool_connection_limit_enabled" {
  description = "Flag to enable PGBouncer connection limit monitor"
  type        = bool
  default     = true
}

variable "pgbouncer_pool_connection_limit_extra_tags" {
  description = "Extra tags for PGBouncer connection limit monitor"
  type        = list(string)
  default     = []
}

variable "pgbouncer_pool_connection_limit_message" {
  description = "Custom message for PGBouncer connection monitor"
  type        = string
  default     = ""
}

variable "pgbouncer_pool_connection_limit_time_aggregator" {
  description = "Monitor time aggregator for PGBouncer connection monitor [available values: min, max or avg]"
  type        = string
  default     = "avg"
}

variable "pgbouncer_pool_connection_limit_timeframe" {
  description = "Monitor timeframe for PGBouncer connection monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

################################################
###   PGBouncer database connections limit   ###
################################################

variable "pgbouncer_database_connection_limit_threshold_critical" {
  default     = 100
  description = "Critical number of connection limit monitor"
}

variable "pgbouncer_database_connection_limit_threshold_warning" {
  default     = 70
  description = "Warning number of connections limit monitor"
}

variable "pgbouncer_database_connection_limit_enabled" {
  description = "Flag to enable PGBouncer connection limit monitor"
  type        = bool
  default     = true
}

variable "pgbouncer_database_connection_limit_extra_tags" {
  description = "Extra tags for PGBouncer connection limit monitor"
  type        = list(string)
  default     = []
}

variable "pgbouncer_database_connection_limit_message" {
  description = "Custom message for PGBouncer connection monitor"
  type        = string
  default     = ""
}

variable "pgbouncer_database_connection_limit_time_aggregator" {
  description = "Monitor time aggregator for PGBouncer connection monitor [available values: min, max or avg]"
  type        = string
  default     = "avg"
}

variable "pgbouncer_database_connection_limit_timeframe" {
  description = "Monitor timeframe for PGBouncer connection monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}
