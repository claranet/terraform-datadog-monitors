# CLOUD AWS ELASTICACHE COMMON DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-aws-elasticache-common" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/aws/elasticache/common?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Elasticache connections
- Elasticache eviction
- Elasticache evictions is growing
- Elasticache free memory
- Elasticache max connections reached
- Elasticache swap

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Infrastructure Environment | string | - | yes |
| evaluation_delay | Delay in seconds for the metric evaluation | string | `900` | no |
| eviction_enabled | Flag to enable Elasticache eviction monitor | string | `true` | no |
| eviction_extra_tags | Extra tags for Elasticache eviction monitor | list | `<list>` | no |
| eviction_growing_condition_timeframe | Monitor condition timeframe for Elasticache eviction growing [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | - | yes |
| eviction_growing_enabled | Flag to enable Elasticache eviction growing monitor | string | `true` | no |
| eviction_growing_extra_tags | Extra tags for Elasticache eviction growing monitor | list | `<list>` | no |
| eviction_growing_message | Custom message for Elasticache eviction growing monitor | string | - | yes |
| eviction_growing_silenced | Groups to mute for Elasticache eviction growing monitor | map | - | yes |
| eviction_growing_threshold_critical | Elasticache eviction growing critical threshold in percentage | string | - | yes |
| eviction_growing_threshold_warning | Elasticache eviction growing warning threshold in percentage | string | - | yes |
| eviction_growing_timeframe | Monitor timeframe for Elasticache eviction growing [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | - | yes |
| eviction_message | Custom message for Elasticache eviction monitor | string | - | yes |
| eviction_silenced | Groups to mute for Elasticache eviction monitor | map | - | yes |
| eviction_time_aggregator | Monitor aggregator for Elasticache eviction [available values: min, max or avg] | string | - | yes |
| eviction_timeframe | Monitor timeframe for Elasticache eviction [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | - | yes |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| free_memory_condition_timeframe | Monitor condition timeframe for Elasticache free memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | - | yes |
| free_memory_enabled | Flag to enable Elasticache free memory monitor | string | `true` | no |
| free_memory_extra_tags | Extra tags for Elasticache free memory monitor | list | `<list>` | no |
| free_memory_message | Custom message for Elasticache free memory monitor | string | - | yes |
| free_memory_silenced | Groups to mute for Elasticache free memory monitor | map | - | yes |
| free_memory_threshold_critical | Elasticache free memory critical threshold in percentage | string | - | yes |
| free_memory_threshold_warning | Elasticache free memory warning threshold in percentage | string | - | yes |
| free_memory_timeframe | Monitor timeframe for Elasticache free memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | - | yes |
| max_connection_enabled | Flag to enable Elasticache max connection monitor | string | `true` | no |
| max_connection_extra_tags | Extra tags for Elasticache max connection monitor | list | `<list>` | no |
| max_connection_message | Custom message for Elasticache max connection monitor | string | - | yes |
| max_connection_silenced | Groups to mute for Elasticache max connection monitor | map | - | yes |
| max_connection_time_aggregator | Monitor aggregator for Elasticache max connection [available values: min, max or avg] | string | - | yes |
| max_connection_timeframe | Monitor timeframe for Elasticache max connection [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | - | yes |
| message | Message sent when an alert is triggered | string | - | yes |
| new_host_delay | Delay in seconds before monitor new resource | string | `300` | no |
| no_connection_enabled | Flag to enable Elasticache no connection monitor | string | `true` | no |
| no_connection_extra_tags | Extra tags for Elasticache no connection monitor | list | `<list>` | no |
| no_connection_message | Custom message for Elasticache no connection monitor | string | - | yes |
| no_connection_silenced | Groups to mute for Elasticache no connection monitor | map | - | yes |
| no_connection_time_aggregator | Monitor aggregator for Elasticache no connection [available values: min, max or avg] | string | - | yes |
| no_connection_timeframe | Monitor timeframe for Elasticache no connection [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | - | yes |
| swap_enabled | Flag to enable Elasticache swap monitor | string | `true` | no |
| swap_extra_tags | Extra tags for Elasticache swap monitor | list | `<list>` | no |
| swap_message | Custom message for Elasticache swap monitor | string | - | yes |
| swap_silenced | Groups to mute for Elasticache swap monitor | map | - | yes |
| swap_threshold_critical | Elasticache swap critical threshold in percentage | string | - | yes |
| swap_threshold_warning | Elasticache swap warning threshold in percentage | string | - | yes |
| swap_time_aggregator | Monitor aggregator for Elasticache memcached swap [available values: min, max or avg] | string | - | yes |
| swap_timeframe | Monitor timeframe for Elasticache swap [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| elasticache_eviction_growing_id | id for monitor elasticache_eviction_growing |
| elasticache_eviction_id | id for monitor elasticache_eviction |
| elasticache_free_memory_id | id for monitor elasticache_free_memory |
| elasticache_max_connection_id | id for monitor elasticache_max_connection |
| elasticache_no_connection_id | id for monitor elasticache_no_connection |
| elasticache_swap_id | id for monitor elasticache_swap |

Related documentation
---------------------

DataDog documentation: [https://docs.datadoghq.com/integrations/amazon_elasticache/](https://docs.datadoghq.com/integrations/amazon_elasticache/)

