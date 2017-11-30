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
    delay          = 900
  }
}

variable "dd_custom_cpu" {
  type = "map"

  default = {
    status = "disabled"
  }
}

#cpu threshold

variable "cpu_5_critical" {
  default = 95
}

variable "cpu_15_critical" {
  default = 80
}

## RDS
variable "dd_aws_rds" {
  default = "disabled"
}

variable "rds_config" {
  type = "map"

  default = {
    notify_no_data = false
    delay          = 900
  }
}

variable "rds_cpu_threshold" {
  type = "map"

  default = {
    warning  = 80
    critical = 90
  }
}

variable "rds_mem_threshold" {
  type = "map"

  default = {
    warning  = 20
    critical = 10
  }
}

## ELB
variable "dd_aws_elb" {
  default = "disable"
}

variable "elb_config" {
  type = "map"

  default = {
    notify_no_data = false
    delay          = 900
  }
}

variable "elb_5xx_threshold" {
  type = "map"

  default = {
    warning  = 5
    critical = 10
  }
}

variable "elb_4xx_threshold" {
  type = "map"

  default = {
    warning  = 5
    critical = 10
  }
}

variable "elb_backend_latency" {
  description = "Average time elapsed after the request leaves the load balancer until a response is received. In seconds"
  
  default = {
    warning  = 1
    critical = 5
  }
}

## VPN
variable "vpn_tunnel_address" {
  description = "List the VPN tunnels you want to monitor"
  type        = "list"
  default     = []
}

variable "vpn_config" {
  description = "Ok means that both tunnels are up, warning means only one tunnel is up and critical means that both tunnels are down "
  type        = "map"

  default = {
    delay    = 900
    warning  = 1
    critical = 0
    ok       = 2
  }
}

##apache nginx php
variable "dd_nginx" {
  default = "disabled"
}

variable "dd_php_fpm" {
  default = "disabled"
}

variable "dd_apache" {
  default = "disabled"
}

variable "apache_nginx_fpm_config" {
  type = "map"

  default = {
    notify_no_data = false
    delay          = 900
  }
}

variable "php_fpm_busy_threshold" {
  type = "map"

  default = {
    warning  = 0.8
    critical = 0.9
  }
}
