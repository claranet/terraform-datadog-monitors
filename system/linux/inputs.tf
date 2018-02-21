# Global Terraform
variable "environment" {
  description = "Architecture Environment"
  type        = "string"
}

# Global DataDog
variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 600
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

# Custom CPU instance specific

variable "custom_cpu_period" {
  description = "Set up period for the query"
  default     = "last_5m"
}

variable "cpu_high_threshold_warning" {
  description = "CPU high warning threshold"
  default     = 80
}

variable "cpu_high_threshold_critical" {
  description = "CPU high critical threshold"
  default     = 95
}

variable "free_disk_space_threshold_warning" {
  description = "Free disk space warning threshold"
  default     = 10
}

variable "free_disk_space_threshold_critical" {
  description = "Free disk space critical threshold"
  default     = 5
}

variable "free_disk_inodes_threshold_warning" {
  description = "Free disk space warning threshold"
  default     = 10
}

variable "free_disk_inodes_threshold_critical" {
  description = "Free disk space critical threshold"
  default     = 5
}

variable "free_memory_threshold_warning" {
  description = "Free disk space warning threshold"
  default     = 10
}

variable "free_memory_threshold_critical" {
  description = "Free disk space critical threshold"
  default     = 5
}
