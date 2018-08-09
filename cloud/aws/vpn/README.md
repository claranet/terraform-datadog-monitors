# CLOUD AWS VPN DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-aws-vpn" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/aws/vpn?ref={revision}"

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
| delay | Delay in seconds for the metric evaluation | string | `900` | no |
| environment | Architecture Environment | string | - | yes |
| filter_tags | Tags used for metrics filtering | string | `*` | no |
| message | Message sent when an alert is triggered | string | - | yes |
| vpn_status_message | Custom message for VPN status monitor | string | `` | no |
| vpn_status_silenced | Groups to mute for VPN status monitor | map | `<map>` | no |
| vpn_status_time_aggregator | Monitor aggregator for VPN status [available values: min, max or avg] | string | `max` | no |
| vpn_status_timeframe | Monitor timeframe for VPN status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |

## Outputs

| Name | Description |
|------|-------------|
| VPN_status_id | id for monitor VPN_status |

## Related documentation

DataDog documentation: [https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/vpn-metricscollected.html](https://docs.datadoghq.com/integrations/amazon_web_services/)

AWS VPN metrics documentation: [https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/vpn-metricscollected.html](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/vpn-metricscollected.html)
