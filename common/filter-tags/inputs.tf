variable "environment" {
  description = "Architecture Environment"
  type        = "string"
}

variable "resource" {
  description = "The dedicated tag for the resource"
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

variable "extra_tags" {
  description = "Extra optional tags (i.e. [\"tag1:val1\", \"tag2:val2\"])"
  type        = "list"
  default     = []
}
