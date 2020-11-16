# CLOUD AWS FSX DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-fsx" {
  source      = "claranet/monitors/datadog//cloud/aws/fsx"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- FSX Free Storage Capacity
- FSX Bandwith

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.26 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| artificial\_requests\_count | Number of false requests used to mitigate false positive in case of low trafic | `number` | `5` | no |
| environment | Architecture environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `900` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| fsx\_windows\_free\_storage\_capacity\_enabled | Flag to enable FSX free storage capacity monitor | `string` | `"true"` | no |
| fsx\_windows\_free\_storage\_capacity\_extra\_tags | Extra tags for FSX free storage capacity monitor | `list(string)` | `[]` | no |
| fsx\_windows\_free\_storage\_capacity\_message | Custom message for FSX free storage capacity monitor | `string` | `""` | no |
| fsx\_windows\_free\_storage\_capacity\_no\_data\_timeframe | Number of minutes before reporting no data | `string` | `10` | no |
| fsx\_windows\_free\_storage\_capacity\_threshold\_critical | FSX free storage capacity critical threshold in gigabytes | `number` | `10` | no |
| fsx\_windows\_free\_storage\_capacity\_threshold\_warning | FSX free storage capacity warning threshold in gigabytes | `number` | `20` | no |
| fsx\_windows\_free\_storage\_capacity\_time\_aggregator | Monitor aggregator for FSX free storage capacity [available values: min, max or avg] | `string` | `"min"` | no |
| fsx\_windows\_free\_storage\_capacity\_timeframe | Monitor timeframe for FSX free storage capacity [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` |
 `"last_5m"` | no |
| fsx\_windows\_throughput\_enabled | Flag to enable FSX throughput monitor | `string` | `"true"` | no |
| fsx\_windows\_throughput\_extra\_tags | Extra tags for FSX throughput monitor | `list(string)` | `[]` | no |
| fsx\_windows\_throughput\_message | Custom message for FSX throughput monitor | `string` | `""` | no |
| fsx\_windows\_throughput\_threshold\_critical | FSX throughput critical threshold in megabytes | `number` | `4` | no |
| fsx\_windows\_throughput\_threshold\_warning | FSX throughput warning threshold in megabytes | `number` | `2` | no |
| fsx\_windows\_throughput\_time\_aggregator | Monitor aggregator for FSX throughput [available values: min, max or avg] | `string` | `"min"` | no |
| fsx\_windows\_throughput\_timeframe | Monitor timeframe for FSX throughput [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| message | Message sent when a monitor is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| fsx\_windows\_free\_storage\_capacity\_id | id for monitor fsx\_windows\_free\_storage\_capacity |
| fsx\_windows\_throughput\_id | id for monitor fsx\_windows\_throughput |


## Related documentation

[AWS FSX metrics documentation](https://aws.amazon.com/blogs/storage/monitor-performance-of-amazon-fsx-for-windows-file-server-with-amazon-cloudwatch/)
