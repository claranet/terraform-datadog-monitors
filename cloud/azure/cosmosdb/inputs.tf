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

variable "message" {
  description = "Message sent when a monitor is triggered"
}

variable "delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
}

variable "subscription_id" {
  description = "ID of the subscription"
  type        = "string"
}

# Azure CosmosDB specific variables
variable "cosmos_db_4xx_requests_message" {
  description = "Custom message for Cosmos DB 4xx requests monitor"
  type        = "string"
  default     = ""
}

variable "cosmos_db_4xx_requests_silenced" {
  description = "Groups to mute for Cosmos DB 4xx requests monitor"
  type        = "map"
  default     = {}
}

variable "cosmos_db_4xx_request_rate_threshold_critical" {
  default = 80
}

variable "cosmos_db_4xx_request_rate_threshold_warning" {
  default = 50
}

variable "cosmos_db_5xx_requests_message" {
  description = "Custom message for Cosmos DB 5xx requests monitor"
  type        = "string"
  default     = ""
}

variable "cosmos_db_5xx_requests_silenced" {
  description = "Groups to mute for Cosmos DB 5xx requests monitor"
  type        = "map"
  default     = {}
}

variable "cosmos_db_5xx_request_rate_threshold_critical" {
  default = 80
}

variable "cosmos_db_5xx_request_rate_threshold_warning" {
  default = 50
}

variable "cosmos_db_no_request_message" {
  description = "Custom message for Cosmos DB no request monitor"
  type        = "string"
  default     = ""
}

variable "cosmos_db_no_request_silenced" {
  description = "Groups to mute for Cosmos DB no request monitor"
  type        = "map"
  default     = {}
}
