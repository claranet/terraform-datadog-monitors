variable "environment" {
  description = "Architecture Environment"
  type        = string
}

variable "team" {
  type    = string
  default = "claranet"
}

variable "priority" {
  description = "Alert severity of monitors from 1 (high) to 5 (low)"
  type        = number
  default     = null

  validation {
    condition     = var.priority == null ? true : (var.priority >= 1 && var.priority <= 5)
    error_message = "Priority must be between 1 and 5."
  }
}
