# CLOUD AZURE REDIS DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-redis" {
  source      = "claranet/monitors/datadog//cloud/azure/redis"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Redis {{name}} is down
- Redis processor time too high
- Redis server load too high
- Redis too many evictedkeys

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.31 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | Architecture environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `900` | no |
| evictedkeys\_limit\_enabled | Flag to enable Redis evicted keys monitor | `string` | `"true"` | no |
| evictedkeys\_limit\_extra\_tags | Extra tags for Redis evicted keys monitor | `list(string)` | `[]` | no |
| evictedkeys\_limit\_message | Custom message for Redis evicted keys monitor | `string` | `""` | no |
| evictedkeys\_limit\_threshold\_critical | Evicted keys limit (critical threshold) | `number` | `100` | no |
| evictedkeys\_limit\_threshold\_warning | Evicted keys limit (warning threshold) | `number` | `0` | no |
| evictedkeys\_limit\_time\_aggregator | Monitor aggregator for Redis evicted keys [available values: min, max or avg] | `string` | `"avg"` | no |
| evictedkeys\_limit\_timeframe | Monitor timeframe for Redis evicted keys [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| message | Message sent when a Redis monitor is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| percent\_processor\_time\_enabled | Flag to enable Redis processor monitor | `string` | `"true"` | no |
| percent\_processor\_time\_extra\_tags | Extra tags for Redis processor monitor | `list(string)` | `[]` | no |
| percent\_processor\_time\_message | Custom message for Redis processor monitor | `string` | `""` | no |
| percent\_processor\_time\_threshold\_critical | Processor time percent (critical threshold) | `number` | `80` | no |
| percent\_processor\_time\_threshold\_warning | Processor time percent (warning threshold) | `number` | `60` | no |
| percent\_processor\_time\_time\_aggregator | Monitor aggregator for Redis processor [available values: min, max or avg] | `string` | `"min"` | no |
| percent\_processor\_time\_timeframe | Monitor timeframe for Redis processor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| server\_load\_rate\_enabled | Flag to enable Redis server load monitor | `string` | `"true"` | no |
| server\_load\_rate\_extra\_tags | Extra tags for Redis server load monitor | `list(string)` | `[]` | no |
| server\_load\_rate\_message | Custom message for Redis server load monitor | `string` | `""` | no |
| server\_load\_rate\_threshold\_critical | Server CPU load rate (critical threshold) | `number` | `90` | no |
| server\_load\_rate\_threshold\_warning | Server CPU load rate (warning threshold) | `number` | `70` | no |
| server\_load\_rate\_time\_aggregator | Monitor aggregator for Redis server load [available values: min, max or avg] | `string` | `"min"` | no |
| server\_load\_rate\_timeframe | Monitor timeframe for Redis server load [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| status\_enabled | Flag to enable Redis status monitor | `string` | `"true"` | no |
| status\_extra\_tags | Extra tags for Redis status monitor | `list(string)` | `[]` | no |
| status\_message | Custom message for Redis status monitor | `string` | `""` | no |
| status\_no\_data\_timeframe | Number of minutes before reporting no data | `string` | `10` | no |
| status\_time\_aggregator | Monitor aggregator for Redis status [available values: min, max or avg] | `string` | `"max"` | no |
| status\_timeframe | Monitor timeframe for Redis status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| evictedkeys\_id | id for monitor evictedkeys |
| percent\_processor\_time\_id | id for monitor percent\_processor\_time |
| server\_load\_id | id for monitor server\_load |
| status\_id | id for monitor status |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_redis_cache/](https://docs.datadoghq.com/integrations/azure_redis_cache/)

Azure Redis metrics documentation: [https://docs.microsoft.com/en-us/azure/redis-cache/cache-how-to-monitor](https://docs.microsoft.com/en-us/azure/redis-cache/cache-how-to-monitor)
