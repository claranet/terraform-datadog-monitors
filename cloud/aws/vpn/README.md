AWS VPN DataDog monitors
===============================

How to use this module
----------------------

```
module "vpn" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/aws/vpn?ref=MON-91-added-aws-vpn-state-check"
  
  environment        = "${var.environment}"
  message            = "${module.datadog-message-alerting.alerting-message}"
  vpn_tunnel_address = "${var.vpn_to_monitor}"
}
```

Purpose
-------
Creates a DataDog monitors with the following checks :
* VPN status

Inputs
-------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Architecture Environment | string | - | yes |
| evaluation_delay | Delay in seconds for the metric evaluation | string | `600` | no |
| message | Message sent when an alert is triggered | string | - | yes |
| vpn_status_critical | Both tunnels are down | string | `0` | no |
| vpn_status_ok | Both tunnels are up, everything is ok | string | `2` | no |
| vpn_status_warning | Only one tunnel is up | string | `1` | no |
| vpn_tunnel_address | List the VPN tunnels you want to monitor | list | `<list>` | no |
