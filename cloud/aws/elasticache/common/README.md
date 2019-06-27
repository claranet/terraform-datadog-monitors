# CLOUD AWS ELASTICACHE COMMON DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-aws-elasticache-common" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//cloud/aws/elasticache/common?ref={revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Elasticache eviction
- Elasticache free memory
- Elasticache evictions is growing
- Elasticache max connections reached

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Infrastructure Environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"900"` | no |
| eviction\_enabled | Flag to enable Elasticache eviction monitor | string | `"true"` | no |
| eviction\_extra\_tags | Extra tags for Elasticache eviction monitor | list(string) | `[]` | no |
| eviction\_growing\_condition\_timeframe | Monitor condition timeframe for Elasticache eviction growing [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| eviction\_growing\_enabled | Flag to enable Elasticache eviction growing monitor | string | `"true"` | no |
| eviction\_growing\_extra\_tags | Extra tags for Elasticache eviction growing monitor | list(string) | `[]` | no |
| eviction\_growing\_message | Custom message for Elasticache eviction growing monitor | string | `""` | no |
| eviction\_growing\_threshold\_critical | Elasticache eviction growing critical threshold in percentage | string | `"30"` | no |
| eviction\_growing\_threshold\_warning | Elasticache eviction growing warning threshold in percentage | string | `"10"` | no |
| eviction\_growing\_timeframe | Monitor timeframe for Elasticache eviction growing [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| eviction\_message | Custom message for Elasticache eviction monitor | string | `""` | no |
| eviction\_threshold\_critical | Elasticache free memory critical threshold in percentage | string | `"30"` | no |
| eviction\_threshold\_warning | Elasticache free memory warning threshold in percentage | string | `"0"` | no |
| eviction\_timeframe | Monitor timeframe for Elasticache eviction [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_15m"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| free\_memory\_condition\_timeframe | Monitor condition timeframe for Elasticache free memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_15m"` | no |
| free\_memory\_enabled | Flag to enable Elasticache free memory monitor | string | `"true"` | no |
| free\_memory\_extra\_tags | Extra tags for Elasticache free memory monitor | list(string) | `[]` | no |
| free\_memory\_message | Custom message for Elasticache free memory monitor | string | `""` | no |
| free\_memory\_threshold\_critical | Elasticache free memory critical threshold in percentage | string | `"-70"` | no |
| free\_memory\_threshold\_warning | Elasticache free memory warning threshold in percentage | string | `"-50"` | no |
| free\_memory\_timeframe | Monitor timeframe for Elasticache free memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_15m"` | no |
| max\_connection\_enabled | Flag to enable Elasticache max connection monitor | string | `"true"` | no |
| max\_connection\_extra\_tags | Extra tags for Elasticache max connection monitor | list(string) | `[]` | no |
| max\_connection\_message | Custom message for Elasticache max connection monitor | string | `""` | no |
| max\_connection\_time\_aggregator | Monitor aggregator for Elasticache max connection [available values: min, max or avg] | string | `"max"` | no |
| max\_connection\_timeframe | Monitor timeframe for Elasticache max connection [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| message | Message sent when an alert is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |
| no\_connection\_enabled | Flag to enable Elasticache no connection monitor | string | `"true"` | no |
| no\_connection\_extra\_tags | Extra tags for Elasticache no connection monitor | list(string) | `[]` | no |
| no\_connection\_message | Custom message for Elasticache no connection monitor | string | `""` | no |
| no\_connection\_time\_aggregator | Monitor aggregator for Elasticache no connection [available values: min, max or avg] | string | `"min"` | no |
| no\_connection\_timeframe | Monitor timeframe for Elasticache no connection [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | string | `""` | no |
| swap\_enabled | Flag to enable Elasticache swap monitor | string | `"true"` | no |
| swap\_extra\_tags | Extra tags for Elasticache swap monitor | list(string) | `[]` | no |
| swap\_message | Custom message for Elasticache swap monitor | string | `""` | no |
| swap\_threshold\_critical | Elasticache swap critical threshold in bytes | string | `"50000000"` | no |
| swap\_threshold\_warning | Elasticache swap warning threshold in bytes | string | `"0"` | no |
| swap\_time\_aggregator | Monitor aggregator for Elasticache memcached swap [available values: min, max or avg] | string | `"min"` | no |
| swap\_timeframe | Monitor timeframe for Elasticache swap [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| elasticache\_eviction\_growing\_id | id for monitor elasticache_eviction_growing |
| elasticache\_eviction\_id | id for monitor elasticache_eviction |
| elasticache\_free\_memory\_id | id for monitor elasticache_free_memory |
| elasticache\_max\_connection\_id | id for monitor elasticache_max_connection |
| elasticache\_no\_connection\_id | id for monitor elasticache_no_connection |
| elasticache\_swap\_id | id for monitor elasticache_swap |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/amazon_elasticache/](https://docs.datadoghq.com/integrations/amazon_elasticache/)

