variable "oncall_24x7" {
  description = "Define PagerDuty NBH service name for alerts and nodata"
  type        = "string"
}

variable "oncall_office_hours" {
  description = "Define PagerDuty BH service name for warning alerts"
  type        = "string"
}

variable "prepend_text" {
  description = "Optional free text string to prepend to alert"
  type        = "string"
  default     = ""
}

variable "append_text" {
  description = "Optional free text string to append to alert"
  type        = "string"
  default     = ""
}
