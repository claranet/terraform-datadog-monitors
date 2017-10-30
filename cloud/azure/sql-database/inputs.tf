variable "subscription_id" {
  default = ""
}

variable "message" {
  description = "Message sent when a SQL DB monitor is triggered"
}

variable "environment" {}

variable "use_filter_tags" {
  default = "false"
}

variable "cpu_threshold_warning" {
  default = ""
}

variable "cpu_threshold_critical" {
  default = "90"
}

variable "diskspace_threshold_warning" {
  default = "80"
}

variable "diskspace_threshold_critical" {
  default = "90"
}

variable "dtu_threshold_warning" {
  default = "85"
}

variable "dtu_threshold_critical" {
  default = "90"
}

variable "deadlock_threshold_critical" {
  default = "1"
}

variable "delay" {
  default = "600"
}

variable "dd_azure_sqldb" {
  default = "disabled"
}
