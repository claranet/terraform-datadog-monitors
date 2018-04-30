# Global Terraform
variable "environment" {
  description = "Architecture Environment"
  type        = "string"
}

# Global DataDog
variable "delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 15
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

variable "mongodb_replicaset_silenced" {
  description = "Groups to mute for Mongodb replicaset monitor"
  type        = "map"
  default     = {}
}

variable "mongodb_replicaset_message" {
  description = "Custom message for Mongodb replicaset monitor"
  type        = "string"
  default     = ""
}

variable "mongodb_replicaset_aggregator" {
  description = "Monitor aggregator for Mongodb replicaset [available values: min, max, sum or avg]"
  type        = "string"
  default     = "avg"
}

variable "mongodb_replicaset_timeframe" {
  description = "Monitor timeframe for Mongodb replicaset [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}
