# DATABASE REDIS DataDog monitors

## How to use this module

```
module "datadog-monitors-database-redis" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//database/redis?ref={revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Redis blocked clients
- Redis does not respond
- Redis evicted keys
- Redis expired keys
- Redis hitrate
- Redis keyspace seems full (no changes since ${var.keyspace_timeframe})
- Redis latency
- Redis memory fragmented
- Redis memory used
- Redis rejected connections

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| blocked\_clients\_enabled | Flag to enable Redis Blocked clients monitor | string | `"true"` | no |
| blocked\_clients\_extra\_tags | Extra tags for Redis Blocked clients monitor | list(string) | `[]` | no |
| blocked\_clients\_message | Custom message for Redis Blocked clients monitor | string | `""` | no |
| blocked\_clients\_threshold\_critical | Blocked clients rate (critical threshold) | string | `"30"` | no |
| blocked\_clients\_threshold\_warning | Blocked clients rate (warning threshold) | string | `"10"` | no |
| blocked\_clients\_time\_aggregator | Monitor aggregator for Redis Blocked clients [available values: min, max or avg] | string | `"min"` | no |
| blocked\_clients\_timeframe | Monitor timeframe for Redis Blocked clients [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| environment | Architecture environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"15"` | no |
| evictedkeys\_change\_enabled | Flag to enable Redis evicted keys monitor | string | `"true"` | no |
| evictedkeys\_change\_extra\_tags | Extra tags for Redis evicted keys monitor | list(string) | `[]` | no |
| evictedkeys\_change\_message | Custom message for Redis evicted keys monitor | string | `""` | no |
| evictedkeys\_change\_threshold\_critical | Evicted keys change (critical threshold) | string | `"100"` | no |
| evictedkeys\_change\_threshold\_warning | Evicted keys change (warning threshold) | string | `"20"` | no |
| evictedkeys\_change\_time\_aggregator | Monitor aggregator for Redis evicted keys [available values: min, max or avg] | string | `"avg"` | no |
| evictedkeys\_change\_timeframe | Monitor timeframe for Redis evicted keys [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| expirations\_rate\_enabled | Flag to enable Redis keys expirations monitor | string | `"true"` | no |
| expirations\_rate\_extra\_tags | Extra tags for Redis keys expirations monitor | list(string) | `[]` | no |
| expirations\_rate\_message | Custom message for Redis keys expirations monitor | string | `""` | no |
| expirations\_rate\_threshold\_critical | Expirations percent (critical threshold) | string | `"20"` | no |
| expirations\_rate\_threshold\_warning | Expirations percent (warning threshold) | string | `"40"` | no |
| expirations\_rate\_time\_aggregator | Monitor aggregator for Redis keys expirations [available values: min, max or avg] | string | `"min"` | no |
| expirations\_rate\_timeframe | Monitor timeframe for Redis keys expirations [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| hitrate\_enabled | Flag to enable Redis hitrate monitor | string | `"true"` | no |
| hitrate\_extra\_tags | Extra tags for Redis hitrate monitor | list(string) | `[]` | no |
| hitrate\_message | Custom message for Redis hitrate monitor | string | `""` | no |
| hitrate\_threshold\_critical | hitrate limit (critical threshold) | string | `"10"` | no |
| hitrate\_threshold\_warning | hitrate limit (warning threshold) | string | `"30"` | no |
| hitrate\_time\_aggregator | Monitor aggregator for Redis hitrate [available values: min, max or avg] | string | `"max"` | no |
| hitrate\_timeframe | Monitor timeframe for Redis hitrate [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| keyspace\_enabled | Flag to enable Redis keyspace monitor | string | `"true"` | no |
| keyspace\_extra\_tags | Extra tags for Redis keyspace monitor | list(string) | `[]` | no |
| keyspace\_message | Custom message for Redis keyspace monitor | string | `""` | no |
| keyspace\_threshold\_critical | Keyspace no changement (critical threshold) | string | `"0"` | no |
| keyspace\_threshold\_warning | Keyspace no changement (warning threshold) | string | `"1"` | no |
| keyspace\_time\_aggregator | Monitor aggregator for Redis keyspace [available values: min, max or avg] | string | `"min"` | no |
| keyspace\_timeframe | Monitor timeframe for Redis keyspace [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| latency\_enabled | Flag to enable Redis latency monitor | string | `"true"` | no |
| latency\_extra\_tags | Extra tags for Redis latency monitor | list(string) | `[]` | no |
| latency\_message | Custom message for Redis latency monitor | string | `""` | no |
| latency\_threshold\_critical | latency limit (critical threshold) | string | `"100"` | no |
| latency\_threshold\_warning | latency limit (warning threshold) | string | `"50"` | no |
| latency\_time\_aggregator | Monitor aggregator for Redis latency [available values: min, max or avg] | string | `"min"` | no |
| latency\_timeframe | Monitor timeframe for Redis latency [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| mem\_frag\_enabled | Flag to enable Redis memory RAM fragmentation monitor | string | `"true"` | no |
| mem\_frag\_extra\_tags | Extra tags for Redis memory RAM fragmentation monitor | list(string) | `[]` | no |
| mem\_frag\_message | Custom message for Redis memory RAM fragmentation monitor | string | `""` | no |
| mem\_frag\_threshold\_critical | memory RAM fragmentation limit (critical threshold) | string | `"150"` | no |
| mem\_frag\_threshold\_warning | memory RAM fragmentation limit (warning threshold) | string | `"130"` | no |
| mem\_frag\_time\_aggregator | Monitor aggregator for Redis memory RAM fragmentation [available values: min, max or avg] | string | `"min"` | no |
| mem\_frag\_timeframe | Monitor timeframe for Redis memory RAM fragmentation [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| mem\_used\_enabled | Flag to enable Redis RAM memory used monitor | string | `"true"` | no |
| mem\_used\_extra\_tags | Extra tags for Redis RAM memory used monitor | list(string) | `[]` | no |
| mem\_used\_message | Custom message for Redis RAM memory used monitor | string | `""` | no |
| mem\_used\_threshold\_critical | RAM memory used limit (critical threshold) | string | `"95"` | no |
| mem\_used\_threshold\_warning | RAM memory used limit (warning threshold) | string | `"85"` | no |
| mem\_used\_time\_aggregator | Monitor aggregator for Redis RAM memory used [available values: min, max or avg] | string | `"min"` | no |
| mem\_used\_timeframe | Monitor timeframe for Redis RAM memory used [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| message | Message sent when a Redis monitor is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds for the metric evaluation | string | `"300"` | no |
| not\_responding\_enabled | Flag to enable Redis does not respond monitor | string | `"true"` | no |
| not\_responding\_extra\_tags | Extra tags for Redis does not respond monitor | list(string) | `[]` | no |
| not\_responding\_message | Custom message for Redis does not respond monitor | string | `""` | no |
| not\_responding\_no\_data\_timeframe | Redis does not respond monitor no data timeframe | string | `"10"` | no |
| not\_responding\_threshold\_warning | Redis does not respond monitor (warning threshold) | string | `"3"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | string | `""` | no |
| rejected\_con\_enabled | Flag to enable Redis rejected connections errors monitor | string | `"true"` | no |
| rejected\_con\_extra\_tags | Extra tags for Redis rejected connections errors monitor | list(string) | `[]` | no |
| rejected\_con\_message | Custom message for Redis rejected connections errors monitor | string | `""` | no |
| rejected\_con\_threshold\_critical | rejected connections errors limit (critical threshold) | string | `"50"` | no |
| rejected\_con\_threshold\_warning | rejected connections errors limit (warning threshold) | string | `"10"` | no |
| rejected\_con\_time\_aggregator | Monitor aggregator for Redis rejected connections errors [available values: min, max or avg] | string | `"min"` | no |
| rejected\_con\_timeframe | Monitor timeframe for Redis rejected connections errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| blocked\_clients\_id | id for monitor blocked_clients |
| evicted\_keys\_id | id for monitor evicted_keys |
| expirations\_id | id for monitor expirations |
| hitrate\_id | id for monitor hitrate |
| keyspace\_full\_id | id for monitor keyspace_full |
| latency\_id | id for monitor latency |
| memory\_frag\_id | id for monitor memory_frag |
| memory\_used\_id | id for monitor memory_used |
| not\_responding\_id | id for monitor not_responding |
| rejected\_connections\_id | id for monitor rejected_connections |

## Related documentation

[Datadog blog: How to monitor Redis](https://www.datadoghq.com/blog/how-to-monitor-redis-performance-metrics/)

[Datadog Redis integration doc](https://docs.datadoghq.com/integrations/redisdb/)
