# CLOUD AWS VPN DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-vpn" {
  source      = "claranet/monitors/datadog//cloud/aws/vpn"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- VPN tunnel down

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.31 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | >= 3.1.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | >= 3.1.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.VPN_status](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture Environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_filter_tags"></a> [filter\_tags](#input\_filter\_tags) | Tags used for metrics filtering | `string` | `"*"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when an alert is triggered | `any` | n/a | yes |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_vpn_status_enabled"></a> [vpn\_status\_enabled](#input\_vpn\_status\_enabled) | Flag to enable VPN status monitor | `string` | `"true"` | no |
| <a name="input_vpn_status_extra_tags"></a> [vpn\_status\_extra\_tags](#input\_vpn\_status\_extra\_tags) | Extra tags for VPN status monitor | `list(string)` | `[]` | no |
| <a name="input_vpn_status_message"></a> [vpn\_status\_message](#input\_vpn\_status\_message) | Custom message for VPN status monitor | `string` | `""` | no |
| <a name="input_vpn_status_no_data_timeframe"></a> [vpn\_status\_no\_data\_timeframe](#input\_vpn\_status\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `10` | no |
| <a name="input_vpn_status_time_aggregator"></a> [vpn\_status\_time\_aggregator](#input\_vpn\_status\_time\_aggregator) | Monitor aggregator for VPN status [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_vpn_status_timeframe"></a> [vpn\_status\_timeframe](#input\_vpn\_status\_timeframe) | Monitor timeframe for VPN status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_VPN_status_id"></a> [VPN\_status\_id](#output\_VPN\_status\_id) | id for monitor VPN\_status |
## Related documentation

DataDog documentation: [https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/vpn-metricscollected.html](https://docs.datadoghq.com/integrations/amazon_web_services/)

AWS VPN metrics documentation: [https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/vpn-metricscollected.html](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/vpn-metricscollected.html)
