variable "environment" {
  description = "Architecture environment"
  type        = "string"
}

variable "resource_kind" {
  description = "Kind of resource monitored (eg. storage, elasticsearch, apache, ec2)."
  type        = "string"
}

variable "provider" {
  description = "Provider of the monitors resources (eg. azure, amazon)."
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
