variable "environment" {
  description = "Environment"
  type        = "string"
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

# PostgreSQL specific
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

variable "postgresql_connection_silenced" {
  description = "Groups to mute for PostgreSQL connection monitor"
  type        = "map"
  default     = {}
}

variable "postgresql_connection_enabled" {
  description = "Flag to enable PostgreSQL connection monitor"
  type        = "string"
  default     = "true"
}

variable "postgresql_connection_message" {
  description = "Custom message for PostgreSQL connection monitor"
  type        = "string"
  default     = ""
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

variable "posgresql_lock_silenced" {
  description = "Groups to mute for PostgreSQL lock monitor"
  type        = "map"
  default     = {}
}

variable "postgresql_lock_enabled" {
  description = "Flag to enable PostgreSQL lock monitor"
  type        = "string"
  default     = "true"
}

variable "postgresql_lock_message" {
  description = "Custom message for PostgreSQL lock monitor"
  type        = "string"
  default     = ""
}
