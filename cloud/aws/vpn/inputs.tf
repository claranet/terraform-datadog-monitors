variable env {}

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
