# Global Terraform
variable "environment" {
  description = "Architecture Environment"
  type        = string
}

# Global DataDog
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

# Cassandra specific

####################################
###    Cassandra availability    ###
####################################

variable "node_cassandra_enabled" {
  description = "Flag to enable Cassandra availability monitor"
  type        = string
  default     = "true"
}

variable "process_cassandra_enabled" {
  description = "Flag to enable Cassandra availability monitor"
  type        = string
  default     = "true"
}

variable "node_cassandra_availability_extra_tags" {
  description = "Extra tags for Cassandra availability monitor"
  type        = list(string)
  default     = []
}

variable "process_cassandra_availability_extra_tags" {
  description = "Extra tags for Cassandra availability monitor"
  type        = list(string)
  default     = []
}

variable "node_cassandra_status_message" {
  description = "Custom message for Cassandra availability monitor"
  type        = string
  default     = ""
}

variable "process_cassandra_status_message" {
  description = "Custom message for Cassandra connection monitor"
  type        = string
  default     = ""
}

variable "node_cassandra_status_time_aggregator" {
  description = "Monitor aggregator for Cassandra [available values: min, max, sum or avg]"
  type        = string
  default     = "min"
}

variable "node_cassandra_status_timeframe" {
  description = "Monitor timeframe for Cassandra [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}
