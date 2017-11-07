# Global Terraform
variable "environment" {
  description = "Architecture Environment"
  type        = "string"
}

variable "subscription_id" {
  description = "Azure account id used as filter for monitors"
  type        = "string"
}

variable "provider" {
  description = "Cloud provider which the monitor and its based metric depend on"
  type        = "string"
  default     = "azure"
}

variable "service" {
  description = "Service monitored by this set of monitors"
  type        = "string"
  default     = "sql-database"
}

# Global DataDog
variable "delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 600
}

variable "message" {
  description = "Message sent when an alert is triggered"
}

variable "use_filter_tags" {
  description = "Filter the data with service tags if true"
  default     = "true"
}

# Azure SQL Database specific

variable "cpu_threshold_warning" {
  description = "CPU usage in percent (warning threshold)"
  default     = ""
}

variable "cpu_threshold_critical" {
  description = "CPU usage in percent (critical threshold)"
  default     = "90"
}

variable "diskspace_threshold_warning" {
  description = "Disk space used in percent (warning threshold)"
  default     = "80"
}

variable "diskspace_threshold_critical" {
  description = "Disk space used in percent (critical threshold)"
  default     = "90"
}

variable "dtu_threshold_warning" {
  description = "Amount of DTU used (warning threshold)"
  default     = "85"
}

variable "dtu_threshold_critical" {
  description = "Amount of DTU used (critical threshold)"
  default     = "90"
}

variable "deadlock_threshold_critical" {
  description = "Amount of Deadlocks (critical threshold)"
  default     = "1"
}
