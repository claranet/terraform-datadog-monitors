variable "environment" {
  description = "Environment"
  type        = string
}

variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 15
}

variable "new_host_delay" {
  description = "Delay in seconds for the metric evaluation"
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

# SQL Server specific

#################################
###   SQL Server availability      ###
#################################

variable "sqlserver_availability_enabled" {
  description = "Flag to enable SQL Server availability monitor"
  type        = string
  default     = "true"
}

variable "sqlserver_availability_extra_tags" {
  description = "Extra tags for SQL Server availability monitor"
  type        = list(string)
  default     = []
}

variable "sqlserver_availability_message" {
  description = "Custom message for SQL Server availability monitor"
  type        = string
  default     = ""
}

variable "sqlserver_availability_threshold_warning" {
  description = "SQL Server availability monitor (warning threshold)"
  type        = string
  default     = 3
}

variable "sqlserver_availability_no_data_timeframe" {
  description = "SQL Server availability monitor no data timeframe"
  type        = string
  default     = 10
}
