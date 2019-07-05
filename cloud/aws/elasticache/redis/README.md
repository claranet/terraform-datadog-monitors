# CLOUD AWS ELASTICACHE REDIS DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-aws-elasticache-redis" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//cloud/aws/elasticache/redis?ref={revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Elasticache redis cache hit ratio
- Elasticache redis CPU
- Elasticache redis is receiving no commands
- Elasticache redis replication lag

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cache\_hits\_enabled | Flag to enable Elasticache redis cache hits monitor | string | `"true"` | no |
| cache\_hits\_extra\_tags | Extra tags for Elasticache redis cache hits monitor | list(string) | `[]` | no |
| cache\_hits\_message | Custom message for Elasticache redis cache hits monitor | string | `""` | no |
| cache\_hits\_threshold\_critical | Elasticache redis cache hits critical threshold in percentage | string | `"60"` | no |
| cache\_hits\_threshold\_warning | Elasticache redis cache hits warning threshold in percentage | string | `"80"` | no |
| cache\_hits\_time\_aggregator | Monitor aggregator for Elasticache redis cache hits [available values: min, max or avg] | string | `"max"` | no |
| cache\_hits\_timeframe | Monitor timeframe for Elasticache redis cache hits [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_15m"` | no |
| commands\_enabled | Flag to enable Elasticache redis commands monitor | string | `"true"` | no |
| commands\_extra\_tags | Extra tags for Elasticache redis commands monitor | list(string) | `[]` | no |
| commands\_message | Custom message for Elasticache redis commands monitor | string | `""` | no |
| commands\_timeframe | Monitor timeframe for Elasticache redis commands [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| cpu\_high\_enabled | Flag to enable Elasticache redis cpu high monitor | string | `"true"` | no |
| cpu\_high\_extra\_tags | Extra tags for Elasticache redis cpu high monitor | list(string) | `[]` | no |
| cpu\_high\_message | Custom message for Elasticache redis cpu high monitor | string | `""` | no |
| cpu\_high\_threshold\_critical | Elasticache redis cpu high critical threshold in percentage | string | `"90"` | no |
| cpu\_high\_threshold\_warning | Elasticache redis cpu high warning threshold in percentage | string | `"75"` | no |
| cpu\_high\_time\_aggregator | Monitor aggregator for Elasticache redis cpu high [available values: min, max or avg] | string | `"min"` | no |
| cpu\_high\_timeframe | Monitor timeframe for Elasticache redis cpu high [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_15m"` | no |
| environment | Infrastructure Environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"900"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| message | Message sent when an alert is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | string | `""` | no |
| replication\_lag\_enabled | Flag to enable Elasticache redis replication lag monitor | string | `"true"` | no |
| replication\_lag\_extra\_tags | Extra tags for Elasticache redis replication lag monitor | list(string) | `[]` | no |
| replication\_lag\_message | Custom message for Elasticache redis replication lag monitor | string | `""` | no |
| replication\_lag\_threshold\_critical | Elasticache redis replication lag critical threshold in seconds | string | `"180"` | no |
| replication\_lag\_threshold\_warning | Elasticache redis replication lag warning threshold in seconds | string | `"90"` | no |
| replication\_lag\_time\_aggregator | Monitor aggregator for Elasticache redis replication lag [available values: min, max or avg] | string | `"min"` | no |
| replication\_lag\_timeframe | Monitor timeframe for Elasticache redis replication lag [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_10m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| redis\_cache\_hits\_id | id for monitor redis_cache_hits |
| redis\_commands\_id | id for monitor redis_commands |
| redis\_cpu\_high\_id | id for monitor redis_cpu_high |
| redis\_replication\_lag\_id | id for monitor redis_replication_lag |

## Related documentation

* [https://docs.datadoghq.com/integrations/amazon_elasticache/](https://docs.datadoghq.com/integrations/amazon_elasticache/)
* [https://www.datadoghq.com/blog/monitoring-elasticache-performance-metrics-with-redis-or-memcached/](https://www.datadoghq.com/blog/monitoring-elasticache-performance-metrics-with-redis-or-memcached/)


