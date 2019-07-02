# CLOUD AWS ELASTICACHE MEMCACHED DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-aws-elasticache-memcached" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//cloud/aws/elasticache/memcached?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Elasticache memcached cache hit ratio
- Elasticache memcached CPU

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cpu\_high\_enabled | Flag to enable Elasticache memcached cpu high monitor | string | `"true"` | no |
| cpu\_high\_extra\_tags | Extra tags for Elasticache memcached cpu high monitor | list | `[]` | no |
| cpu\_high\_message | Custom message for Elasticache memcached cpu high monitor | string | `""` | no |
| cpu\_high\_threshold\_critical | Elasticache memcached cpu high critical threshold in percentage | string | `"90"` | no |
| cpu\_high\_threshold\_warning | Elasticache memcached cpu high warning threshold in percentage | string | `"75"` | no |
| cpu\_high\_time\_aggregator | Monitor aggregator for Elasticache memcached cpu high [available values: min, max or avg] | string | `"min"` | no |
| cpu\_high\_timeframe | Monitor timeframe for Elasticache memcached cpu high [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_15m"` | no |
| environment | Infrastructure Environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"900"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| get\_hits\_enabled | Flag to enable Elasticache memcached get hits monitor | string | `"true"` | no |
| get\_hits\_extra\_tags | Extra tags for Elasticache memcached get hits monitor | list | `[]` | no |
| get\_hits\_message | Custom message for Elasticache memcached get hits monitor | string | `""` | no |
| get\_hits\_threshold\_critical | Elasticache memcached get hits critical threshold in percentage | string | `"60"` | no |
| get\_hits\_threshold\_warning | Elasticache memcached get hits warning threshold in percentage | string | `"80"` | no |
| get\_hits\_time\_aggregator | Monitor aggregator for Elasticache memcached get hits [available values: min, max or avg] | string | `"max"` | no |
| get\_hits\_timeframe | Monitor timeframe for Elasticache memcached get hits [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_15m"` | no |
| message | Message sent when an alert is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| memcached\_cpu\_high\_id | id for monitor memcached_cpu_high |
| memcached\_get\_hits\_id | id for monitor memcached_get_hits |

## Related documentation

DataDog documentation:

* [https://docs.datadoghq.com/integrations/amazon_elasticache/](https://docs.datadoghq.com/integrations/amazon_elasticache/)
* [https://www.datadoghq.com/blog/monitoring-elasticache-performance-metrics-with-redis-or-memcached/](https://www.datadoghq.com/blog/monitoring-elasticache-performance-metrics-with-redis-or-memcached/)


