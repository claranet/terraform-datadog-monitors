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
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when an alert is triggered | string | - | yes |
| vpn_status_message | Custom message for VPN status monitor | string | `` | no |
| vpn_status_silenced | Groups to mute for VPN status monitor | map | `<map>` | no |