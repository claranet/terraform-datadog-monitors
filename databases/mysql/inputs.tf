variable "environment" {
  description = "Environment"
  type        = "string"
}

variable "filter_tags" {
  description = "Tags used for filtering"
  default     = "*"
}

variable "delay" {
  default = 900
}

variable "message" {
  description = "Message sent when a monitor is triggered"
}

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

#################################
###   MySQL threads           ###
#################################

variable "mysql_thread_threshold_critical" {
  default     = 500
  description = "Maximum critical acceptable percent of threads"
}

variable "mysql_thread_threshold_warning" {
  default     = 400
  description = "Maximum critical acceptable percent of threads"
}
