# CLOUD AWS VPN DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-aws-vpn" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//cloud/aws/vpn?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- VPN tunnel down

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Architecture Environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"900"` | no |
| filter\_tags | Tags used for metrics filtering | string | `"*"` | no |
| message | Message sent when an alert is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | string | `""` | no |
| vpn\_status\_enabled | Flag to enable VPN status monitor | string | `"true"` | no |
| vpn\_status\_extra\_tags | Extra tags for VPN status monitor | list | `[]` | no |
| vpn\_status\_message | Custom message for VPN status monitor | string | `""` | no |
| vpn\_status\_time\_aggregator | Monitor aggregator for VPN status [available values: min, max or avg] | string | `"max"` | no |
| vpn\_status\_timeframe | Monitor timeframe for VPN status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| VPN\_status\_id | id for monitor VPN_status |

## Related documentation

DataDog documentation: [https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/vpn-metricscollected.html](https://docs.datadoghq.com/integrations/amazon_web_services/)

AWS VPN metrics documentation: [https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/vpn-metricscollected.html](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/vpn-metricscollected.html)
