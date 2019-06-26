variable "environment" {
  description = "Architecture environment"
  type        = "string"
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

variable "message" {
  description = "Message sent when a monitor is triggered"
}

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

# Azure CosmosDB specific variables
variable "status_enabled" {
  description = "Flag to enable Cosmos DB status monitor"
  type        = "string"
  default     = "true"
}

variable "status_extra_tags" {
  description = "Extra tags for Cosmos DB status monitor"
  type        = "list"
  default     = []
}

variable "status_message" {
  description = "Custom message for Cosmos DB status monitor"
  type        = "string"
  default     = ""
}

variable "status_time_aggregator" {
  description = "Monitor aggregator for Cosmos DB status [available values: min, max or avg]"
  type        = "string"
  default     = "max"
}

variable "status_timeframe" {
  description = "Monitor timeframe for Cosmos DB status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "cosmos_db_4xx_requests_message" {
  description = "Custom message for Cosmos DB 4xx requests monitor"
  type        = "string"
  default     = ""
}

variable "cosmos_db_4xx_requests_enabled" {
  description = "Flag to enable Cosmos DB 4xx requests monitor"
  type        = "string"
  default     = "true"
}

variable "cosmos_db_4xx_request_rate_threshold_critical" {
  description = "Critical threshold for Cosmos DB 4xx requests monitor"
  default     = 80
}

variable "cosmos_db_4xx_request_rate_threshold_warning" {
  description = "Warning threshold for Cosmos DB 4xx requests monitor"
  default     = 50
}

variable "cosmos_db_4xx_request_extra_tags" {
  description = "Extra tags for Cosmos DB 4xx requests monitor"
  type        = "list"
  default     = []
}

variable "cosmos_db_4xx_request_time_aggregator" {
  description = "Monitor aggregator for Cosmos DB 4xx requests [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "cosmos_db_4xx_request_timeframe" {
  description = "Monitor timeframe for Cosmos DB 4xx requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "cosmos_db_5xx_requests_message" {
  description = "Custom message for Cosmos DB 5xx requests monitor"
  type        = "string"
  default     = ""
}

variable "cosmos_db_5xx_requests_enabled" {
  description = "Flag to enable Cosmos DB 5xx requests monitor"
  type        = "string"
  default     = "true"
}

variable "cosmos_db_5xx_request_rate_threshold_critical" {
  description = "Critical threshold for Cosmos DB 5xx requests monitor"
  default     = 80
}

variable "cosmos_db_5xx_request_rate_threshold_warning" {
  description = "Warning threshold for Cosmos DB 5xx requests monitor"
  default     = 50
}

variable "cosmos_db_5xx_request_rate_extra_tags" {
  description = "Extra tags for Cosmos DB 5xx requests monitor"
  type        = "list"
  default     = []
}

variable "cosmos_db_5xx_request_time_aggregator" {
  description = "Monitor aggregator for Cosmos DB 5xx requests [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "cosmos_db_5xx_request_timeframe" {
  description = "Monitor timeframe for Cosmos DB 5xx requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "cosmos_db_scaling_message" {
  description = "Custom message for Cosmos DB scaling monitor"
  type        = "string"
  default     = ""
}

variable "cosmos_db_scaling_enabled" {
  description = "Flag to enable Cosmos DB scaling monitor"
  type        = "string"
  default     = "true"
}

variable "cosmos_db_scaling_error_rate_threshold_critical" {
  description = "Critical threshold for Cosmos DB scaling monitor"
  default     = 10
}

variable "cosmos_db_scaling_error_rate_threshold_warning" {
  description = "Warning threshold for Cosmos DB scaling monitor"
  default     = 5
}

variable "cosmos_db_scaling_extra_tags" {
  description = "Extra tags for Cosmos DB scaling monitor"
  type        = "list"
  default     = []
}

variable "cosmos_db_scaling_time_aggregator" {
  description = "Monitor aggregator for Cosmos DB scaling [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "cosmos_db_scaling_timeframe" {
  description = "Monitor timeframe for Cosmos DB scaling [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}
