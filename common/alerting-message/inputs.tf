variable "oncall_alert" {
  description = "Define a broadcast channel for critical alerts"
  type        = "string"
}

variable "oncall_warning" {
  description = "Define a broadcast channel for warning alerts"
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
