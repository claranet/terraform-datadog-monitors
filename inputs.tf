variable "hno_escalation_group" {}
variable "ho_escalation_group" {}

variable env {}
variable region {}


##linux
variable "dd_linux_basics" {
  default = "disabled"
}
variable "linux_basics_config" {
  type = "map"
  default = {
    notify_no_data = false
    delay = 900
  }
}
variable "dd_custom_cpu" {
  type = "map"
  default = {
    status = "disabled"
  }
}


## RDS
variable "dd_aws_rds" {
  default = "disabled"
}
variable "rds_config" {
  type = "map"
  default = {
    notify_no_data = false
    delay = 900
  }
}
variable "rds_cpu_threshold" {
  type = "map"
  default = {
    warning   = 80
    critical  = 90
  }
}
variable "rds_mem_threshold" {
  default = {
    warning   = 20
    critical  = 10
  }
}





