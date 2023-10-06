# Global variables

variable "tags" {
  type    = list(string)
  default = ["type:docker", "provider:docker", "resource:docker"]
}

# Datadog monitors variables

#
# Not Responding
#
variable "not_responding_enabled" {
  description = "Flag to enable Docker does not respond monitor"
  type        = string
  default     = "true"
}

variable "not_responding_message" {
  description = "Custom message for Docker does not respond monitor"
  type        = string
  default     = ""
}

variable "not_responding_threshold_warning" {
  description = "Docker does not respond monitor (warning threshold)"
  type        = string
  default     = 3
}

variable "not_responding_no_data_timeframe" {
  description = "Docker does not respond monitor no data timeframe"
  type        = string
  default     = 10
}

variable "not_responding_extra_tags" {
  description = "Extra tags for Docker does not respond monitor"
  type        = list(string)
  default     = []
}

#
# Container Memory Usage
#
variable "memory_used_enabled" {
  description = "Flag to enable Container Memory Usage monitor"
  type        = string
  default     = "false"
}

variable "memory_used_message" {
  description = "Custom message for the Container Memory Usage monitor"
  type        = string
  default     = ""
}

variable "memory_used_time_aggregator" {
  description = "Time aggregator for the Container Memory Usage monitor"
  type        = string
  default     = "min"
}

variable "memory_used_timeframe" {
  description = "Timeframe for the Container Memory Usage monitor"
  type        = string
  default     = "last_5m"
}

variable "memory_used_threshold_warning" {
  description = "Container Memory Usage warning threshold"
  type        = string
  default     = 85
}

variable "memory_used_threshold_critical" {
  description = "Container Memory Usage critical threshold"
  type        = string
  default     = 90
}

variable "memory_used_extra_tags" {
  description = "Extra tags for Container Memory Usage monitor"
  type        = list(string)
  default     = []
}
