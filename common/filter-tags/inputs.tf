variable "environment" {
  description = "Architecture Environment"
  type        = string
}

variable "resource" {
  description = "The dedicated tag for the resource"
  type        = string
}

variable "filter_tags_use_defaults" {
  description = "Use default filter tags convention"
  default     = "true"
}

variable "filter_tags_custom" {
  description = "Tags used for custom filtering when filter_tags_use_defaults is false (i.e. \"tag1:val1,tag2:val2\")"
  default     = "*"
}

variable "filter_tags_custom_excluded" {
  description = "Tags excluded for custom filtering when filter_tags_use_defaults is false (i.e. \"tag1:val1,tag2:val2\")"
  default     = ""
}

variable "filter_tags_separator" {
  description = "Set the query separator (, or AND)"
  type        = string
  default     = ","
}

variable "extra_tags" {
  description = "Extra optional tags added to include filtering in any case (i.e. [\"tag1:val1\", \"tag2:val2\"])"
  type        = list(string)
  default     = []
}

variable "extra_tags_excluded" {
  description = "Extra optional tags added to exclude filtering in any case (i.e. [\"tag1:val1\", \"tag2:val2\"])"
  type        = list(string)
  default     = []
}