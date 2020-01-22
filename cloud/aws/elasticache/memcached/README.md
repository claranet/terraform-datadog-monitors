# CLOUD AWS ELASTICACHE MEMCACHED DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-elasticache-memcached" {
  source      = "claranet/monitors/datadog//cloud/aws/elasticache/memcached"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Elasticache memcached cache hit ratio
- Elasticache memcached CPU

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| cpu\_high\_enabled | Flag to enable Elasticache memcached cpu high monitor | `string` | `"true"` | no |
| cpu\_high\_extra\_tags | Extra tags for Elasticache memcached cpu high monitor | `list(string)` | `[]` | no |
| cpu\_high\_message | Custom message for Elasticache memcached cpu high monitor | `string` | `""` | no |
| cpu\_high\_threshold\_critical | Elasticache memcached cpu high critical threshold in percentage | `string` | `90` | no |
| cpu\_high\_threshold\_warning | Elasticache memcached cpu high warning threshold in percentage | `string` | `75` | no |
| cpu\_high\_time\_aggregator | Monitor aggregator for Elasticache memcached cpu high [available values: min, max or avg] | `string` | `"min"` | no |
| cpu\_high\_timeframe | Monitor timeframe for Elasticache memcached cpu high [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| environment | Infrastructure Environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `900` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| get\_hits\_enabled | Flag to enable Elasticache memcached get hits monitor | `string` | `"true"` | no |
| get\_hits\_extra\_tags | Extra tags for Elasticache memcached get hits monitor | `list(string)` | `[]` | no |
| get\_hits\_message | Custom message for Elasticache memcached get hits monitor | `string` | `""` | no |
| get\_hits\_threshold\_critical | Elasticache memcached get hits critical threshold in percentage | `string` | `60` | no |
| get\_hits\_threshold\_warning | Elasticache memcached get hits warning threshold in percentage | `string` | `80` | no |
| get\_hits\_time\_aggregator | Monitor aggregator for Elasticache memcached get hits [available values: min, max or avg] | `string` | `"max"` | no |
| get\_hits\_timeframe | Monitor timeframe for Elasticache memcached get hits [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| memcached\_cpu\_high\_no\_data\_timeframe | Number of minutes before reporting no data | `string` | `10` | no |
| message | Message sent when an alert is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| memcached\_cpu\_high\_id | id for monitor memcached\_cpu\_high |
| memcached\_get\_hits\_id | id for monitor memcached\_get\_hits |

## Related documentation

DataDog documentation:

* [https://docs.datadoghq.com/integrations/amazon_elasticache/](https://docs.datadoghq.com/integrations/amazon_elasticache/)
* [https://www.datadoghq.com/blog/monitoring-elasticache-performance-metrics-with-redis-or-memcached/](https://www.datadoghq.com/blog/monitoring-elasticache-performance-metrics-with-redis-or-memcached/)


