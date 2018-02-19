# Global Terraform
variable "environment" {
  description = "Architecture Environment"
  type        = "string"
}

# Global DataDog
variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 600
}

variable "message" {
  description = "Message sent when an alert is triggered"
}

# AWS VPN Service specific
variable "vpn_tunnel_address" {
  description = "List the VPN tunnels you want to monitor"
  type        = "list"
  default     = []
}

variable "vpn_status_ok" {
  description = "Both tunnels are up, everything is ok"
  default     = 2
}

variable "vpn_status_warning" {
  description = "Only one tunnel is up"
  default     = 1
}

variable "vpn_status_critical" {
  description = "Both tunnels are down"
  default     = 0
}
