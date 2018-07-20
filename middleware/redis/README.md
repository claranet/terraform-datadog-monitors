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
- Redis too many ram memory used
- Redis memory ram fragmented
- Redis too many rejected connections
- Redis latency is too high
- Redis hitrate is too low

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
| hitrate_message | Custom message for Redis hitrate monitor | string | `` | no |
| hitrate_silenced | Groups to mute for Redis hitrate monitor | map | `<map>` | no |
| hitrate_threshold_critical | hitrate limit (critical threshold) | string | `90` | no |
| hitrate_threshold_warning | hitrate limit (warning threshold) | string | `70` | no |
| hitrate_time_aggregator | Monitor aggregator for Redis hitrate [available values: min, max or avg] | string | `min` | no |
| hitrate_timeframe | Monitor timeframe for Redis hitrate [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| keyspace_message | Custom message for Redis keyspace monitor | string | `` | no |
| keyspace_silenced | Groups to mute for Redis keyspace monitor | map | `<map>` | no |
| keyspace_threshold_critical | Keyspace changement (critical threshold) | string | `90` | no |
| keyspace_threshold_warning | Keyspace changement (warning threshold) | string | `70` | no |
| keyspace_time_aggregator | Monitor aggregator for Redis keyspace [available values: min, max or avg] | string | `min` | no |
| keyspace_timeframe | Monitor timeframe for Redis keyspace [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| latency_message | Custom message for Redis latency monitor | string | `` | no |
| latency_silenced | Groups to mute for Redis latency monitor | map | `<map>` | no |
| latency_threshold_critical | latency limit (critical threshold) | string | `90` | no |
| latency_threshold_warning | latency limit (warning threshold) | string | `70` | no |
| latency_time_aggregator | Monitor aggregator for Redis latency [available values: min, max or avg] | string | `min` | no |
| latency_timeframe | Monitor timeframe for Redis latency [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| mem_frag_message | Custom message for Redis memory RAM fragmentation monitor | string | `` | no |
| mem_frag_silenced | Groups to mute for Redis memory RAM fragmentation monitor | map | `<map>` | no |
| mem_frag_threshold_critical | memory RAM fragmentation limit (critical threshold) | string | `90` | no |
| mem_frag_threshold_warning | memory RAM fragmentation limit (warning threshold) | string | `70` | no |
| mem_frag_time_aggregator | Monitor aggregator for Redis memory RAM fragmentation [available values: min, max or avg] | string | `min` | no |
| mem_frag_timeframe | Monitor timeframe for Redis memory RAM fragmentation [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| mem_used_message | Custom message for Redis RAM memory used monitor | string | `` | no |
| mem_used_silenced | Groups to mute for Redis RAM memory used monitor | map | `<map>` | no |
| mem_used_threshold_critical | RAM memory used limit (critical threshold) | string | `90` | no |
| mem_used_threshold_warning | RAM memory used limit (warning threshold) | string | `70` | no |
| mem_used_time_aggregator | Monitor aggregator for Redis RAM memory used [available values: min, max or avg] | string | `min` | no |
| mem_used_timeframe | Monitor timeframe for Redis RAM memory used [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| message | Message sent when a Redis monitor is triggered | string | - | yes |
| redis_silenced | Groups to mute for Redis monitors | map | `<map>` | no |
| rejected_con_message | Custom message for Redis rejected connections errors monitor | string | `` | no |
| rejected_con_silenced | Groups to mute for Redis rejected connections errors monitor | map | `<map>` | no |
| rejected_con_threshold_critical | rejected connections errors limit (critical threshold) | string | `90` | no |
| rejected_con_threshold_warning | rejected connections errors limit (warning threshold) | string | `70` | no |
| rejected_con_time_aggregator | Monitor aggregator for Redis rejected connections errors [available values: min, max or avg] | string | `min` | no |
| rejected_con_timeframe | Monitor timeframe for Redis rejected connections errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |

## Outputs

| Name | Description |
|------|-------------|
| redis_blocked_clients_id | id for monitor redis_blocked_clients |
| redis_evictedkeys_id | id for monitor redis_evictedkeys |
| redis_expirations_id | id for monitor redis_expirations |
| redis_hitrate_id | id for monitor redis_hitrate |
| redis_keyspace_id | id for monitor redis_keyspace |
| redis_latency_id | id for monitor redis_latency |
| redis_mem_frag_id | id for monitor redis_mem_frag |
| redis_mem_used_id | id for monitor redis_mem_used |
| redis_rejected_con_id | id for monitor redis_rejected_con |

## Related documentation

[Datadog blog: How to monitor Redis](https://www.datadoghq.com/blog/how-to-monitor-redis-performance-metrics/)

[Datadog Redis integration doc](https://docs.datadoghq.com/integrations/redisdb/)
