variable "environment" {
  description = "Environment"
  type        = "string"
}

variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 15
}

variable "new_host_delay" {
  description = "Delay in seconds for the metric evaluation"
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

# MySQL specific
#################################
###   MySQL connections       ###
#################################

variable "mysql_connection_threshold_critical" {
  default     = 80
  description = "Maximum critical acceptable percent of connections"
}

variable "mysql_connection_threshold_warning" {
  default     = 70
  description = "Maximum warning acceptable percent of connections"
}

variable "mysql_connection_silenced" {
  description = "Groups to mute mysql connection monitor"
  type        = "map"
  default     = {}
}

variable "mysql_connection_message" {
  description = "Custom message for MySQL connection monitor"
  type        = "string"
  default     = ""
}

#################################
###   MySQL threads           ###
#################################

variable "mysql_thread_threshold_critical" {
  default     = 500
  description = "Maximum critical acceptable number of threads"
}

variable "mysql_thread_threshold_warning" {
  default     = 400
  description = "Maximum warning acceptable number of threads"
}

variable "mysql_thread_silenced" {
  description = "Groups to mute mysql threads monitor"
  type        = "map"
  default     = {}
}

variable "mysql_thread_message" {
  description = "Custom message for MySQL thread monitor"
  type        = "string"
  default     = ""
}
