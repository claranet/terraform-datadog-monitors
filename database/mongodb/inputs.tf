# Global Terraform
variable "environment" {
  description = "Architecture Environment"
  type        = "string"
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

variable "mongodb_desired_servers_count" {
  description = "Number of servers that should be instanciated for this cluster"
  default     = 3
}

variable "mongodb_primary_timeframe" {
  description = "Monitor timeframe for MongoDB wrong state for primary node [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_1m"
}

variable "mongodb_secondary_timeframe" {
  description = "Monitor timeframe for MongoDB wrong state for secondaries nodes [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "mongodb_server_count_timeframe" {
  description = "Monitor timeframe for MongoDB wrong server count [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_15m"
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
  description = "Groups to mute for MongoDB primary state monitor"
  type        = "map"
  default     = {}
}

variable "mongodb_primary_extra_tags" {
  description = "Extra tags for MongoDB primary state monitor"
  type        = "list"
  default     = []
}

variable "mongodb_secondary_silenced" {
  description = "Groups to mute for MongoDB secondary state monitor"
  type        = "map"
  default     = {}
}

variable "mongodb_secondary_extra_tags" {
  description = "Extra tags for MongoDB secondary state monitor"
  type        = "list"
  default     = []
}

variable "mongodb_server_count_silenced" {
  description = "Groups to mute for MongoDB server count monitor"
  type        = "map"
  default     = {}
}

variable "mongodb_replication_silenced" {
  description = "Groups to mute for MongoDB replication lag monitor"
  type        = "map"
  default     = {}
}

variable "mongodb_replication_extra_tags" {
  description = "Extra tags for MongoDB replication lag monitor"
  type        = "list"
  default     = []
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

variable "mongodb_server_count_message" {
  description = "Custom message for MongoDB server count"
  type        = "string"
  default     = ""
}

variable "mongodb_replication_message" {
  description = "Custom message for MongoDB replication monitor"
  type        = "string"
  default     = ""
}

variable "mongodb_primary_aggregator" {
  description = "Monitor aggregator for MongoDB primary state [available values: min, max]"
  type        = "string"
  default     = "max"
}

variable "mongodb_secondary_aggregator" {
  description = "Monitor aggregator for MongoDB secondary state [available values: min, max]"
  type        = "string"
  default     = "max"
}

variable "mongodb_server_count_aggregator" {
  description = "Monitor aggregator for MongoDB server count [available values: min, max]"
  type        = "string"
  default     = "min"
}

variable "mongodb_replication_aggregator" {
  description = "Monitor aggregator for MongoDB replication lag [available values: min, max, sum or avg]"
  type        = "string"
  default     = "avg"
}
