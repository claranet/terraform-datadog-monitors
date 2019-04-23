# Global Terraform
variable "environment" {
  description = "Environment"
  type        = "string"
}

# Global DataDog
variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
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

# Kinesis-Firehose

variable "incoming_records_silenced" {
  description = "Groups to mute for Kinesis Firehorse incoming records monitor"
  type        = "map"
  default     = {}
}

variable "incoming_records_enabled" {
  description = "Flag to enable Kinesis Firehorse incoming records monitor"
  type        = "string"
  default     = "true"
}

variable "incoming_records_extra_tags" {
  description = "Extra tags for Kinesis Firehorse incoming records monitor"
  type        = "list"
  default     = []
}

variable "incoming_records_message" {
  description = "Custom message for Kinesis Firehorse incoming records monitor"
  type        = "string"
  default     = ""
}

variable "incoming_records_timeframe" {
  description = "Monitor timeframe for incoming records metrics evaluation [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  default     = "last_15m"
}
