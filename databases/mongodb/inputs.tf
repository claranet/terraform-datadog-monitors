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

variable "mongodb_primary_timeframe" {
  description = "Monitor timeframe for MongoDB wrong state for primary node [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_1m"
}

variable "mongodb_secondary_timeframe" {
  description = "Monitor timeframe for MongoDB wrong state for secondaries nodes [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_1m"
}

variable "mongodb_replication_timeframe" {
  description = "Monitor timeframe for MongoDB replication lag  [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_1m"
}

variable "mongodb_lag_warning" {
  description = "Warn replication lag in s"
  default     = 2
}

variable "mongodb_lag_critical" {
  description = "Critical replication lag in s"
  default     = 5
}

variable "mongodb_primary_silenced" {
  description = "Groups to mute for Mongodb primary state monitor"
  type        = "map"
  default     = {}
}

variable "mongodb_secondary_silenced" {
  description = "Groups to mute for Mongodb secondary state monitor"
  type        = "map"
  default     = {}
}

variable "mongodb_replication_silenced" {
  description = "Groups to mute for Mongodb replication lag monitor"
  type        = "map"
  default     = {}
}

variable "mongodb_primary_message" {
  description = "Custom message for MongoDB primary monitor"
  type        = "string"
  default     = ""
}

variable "mongodb_secondary_message" {
  description = "Custom message for MongoDB secondary monitor"
  type        = "string"
  default     = ""
}

variable "mongodb_replication_message" {
  description = "Custom message for MongoDB replication monitor"
  type        = "string"
  default     = ""
}

variable "mongodb_primary_aggregator" {
  description = "Monitor aggregator for Mongodb primary state [available values: min, max]"
  type        = "string"
  default     = "max"
}

variable "mongodb_secondary_aggregator" {
  description = "Monitor aggregator for Mongodb secondary state [available values: min, max]"
  type        = "string"
  default     = "max"
}

variable "mongodb_replication_aggregator" {
  description = "Monitor aggregator for Mongodb replication lag [available values: min, max, sum or avg]"
  type        = "string"
  default     = "avg"
}
