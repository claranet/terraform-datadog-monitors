# MIDDLEWARE REDIS DataDog monitors

## How to use this module

```
module "datadog-monitors-middleware-redis" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//middleware/redis?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Redis too many evictedkeys
- Redis too many expired keys
- Redis too many blocked clients
- Redis keyspace seems full

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| blocked_clients_message | Custom message for Redis Blocked clients monitor | string | `` | no |
| blocked_clients_silenced | Groups to mute for Redis Blocked clients monitor | map | `<map>` | no |
| blocked_clients_threshold_critical | Blocked clients rate (critical threshold) | string | `90` | no |
| blocked_clients_threshold_warning | Blocked clients rate (warning threshold) | string | `70` | no |
| blocked_clients_time_aggregator | Monitor aggregator for Redis Blocked clients [available values: min, max or avg] | string | `min` | no |
| blocked_clients_timeframe | Monitor timeframe for Redis Blocked clients [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| delay | Delay in seconds for the metric evaluation | string | `900` | no |
| environment | Architecture environment | string | - | yes |
| evictedkeys_limit_message | Custom message for Redis evicted keys monitor | string | `` | no |
| evictedkeys_limit_silenced | Groups to mute for Redis evicted keys monitor | map | `<map>` | no |
| evictedkeys_limit_threshold_critical | Evicted keys limit (critical threshold) | string | `100` | no |
| evictedkeys_limit_threshold_warning | Evicted keys limit (warning threshold) | string | `0` | no |
| evictedkeys_limit_time_aggregator | Monitor aggregator for Redis evicted keys [available values: min, max or avg] | string | `avg` | no |
| evictedkeys_limit_timeframe | Monitor timeframe for Redis evicted keys [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| expirations_limit_message | Custom message for Redis keys expirations monitor | string | `` | no |
| expirations_limit_threshold_critical | Expirations percent (critical threshold) | string | `80` | no |
| expirations_limit_threshold_warning | Expirations percent (warning threshold) | string | `60` | no |
| expirations_limit_time_aggregator | Monitor aggregator for Redis keys expirations [available values: min, max or avg] | string | `min` | no |
| expirations_limit_timeframe | Monitor timeframe for Redis keys expirations [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| expirations_silenced | Groups to mute for Redis keys expirations monitor | map | `<map>` | no |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| keyspace_message | Custom message for Redis keyspace monitor | string | `` | no |
| keyspace_silenced | Groups to mute for Redis keyspace monitor | map | `<map>` | no |
| keyspace_threshold_critical | Keyspace changement (critical threshold) | string | `90` | no |
| keyspace_threshold_warning | Keyspace changement (warning threshold) | string | `70` | no |
| keyspace_time_aggregator | Monitor aggregator for Redis keyspace [available values: min, max or avg] | string | `min` | no |
| keyspace_timeframe | Monitor timeframe for Redis keyspace [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| message | Message sent when a Redis monitor is triggered | string | - | yes |
| redis_silenced | Groups to mute for Redis monitors | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| redis_blocked_clients_id | id for monitor redis_blocked_clients |
| redis_evictedkeys_id | id for monitor redis_evictedkeys |
| redis_expirations_id | id for monitor redis_expirations |
| redis_keyspace_id | id for monitor redis_keyspace |

## Related documentation

[Datadog blog: How to monitor Redis](https://www.datadoghq.com/blog/how-to-monitor-redis-performance-metrics/)

[Datadog Redis integration doc](https://docs.datadoghq.com/integrations/redisdb/)
