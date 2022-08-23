variable "environment" {
  description = "Architecture Environment"
  type        = string
}

variable "default_tags" {
  description = "Default tags added to include in any case (i.e. [\"tag1:val1\", \"tag2:val2\"])"
  type        = list(string)
  default     = []
}

variable "extra_tags" {
  description = "Extra optional tags added to include in any case (i.e. [\"tag1:val1\", \"tag2:val2\"])"
  type        = list(string)
  default     = []
}
