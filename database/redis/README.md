# DATABASE REDIS DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-database-redis" {
  source      = "claranet/monitors/datadog//database/redis"
  version     = "{revision}"

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

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.31 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | >= 3.1.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | >= 3.1.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_filter-tags"></a> [filter-tags](#module\_filter-tags) | ../../common/filter-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.blocked_clients](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.evicted_keys](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.expirations](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.hitrate](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.keyspace_full](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.latency](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.memory_frag](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.memory_used](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.not_responding](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.rejected_connections](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_blocked_clients_enabled"></a> [blocked\_clients\_enabled](#input\_blocked\_clients\_enabled) | Flag to enable Redis Blocked clients monitor | `string` | `"true"` | no |
| <a name="input_blocked_clients_extra_tags"></a> [blocked\_clients\_extra\_tags](#input\_blocked\_clients\_extra\_tags) | Extra tags for Redis Blocked clients monitor | `list(string)` | `[]` | no |
| <a name="input_blocked_clients_message"></a> [blocked\_clients\_message](#input\_blocked\_clients\_message) | Custom message for Redis Blocked clients monitor | `string` | `""` | no |
| <a name="input_blocked_clients_threshold_critical"></a> [blocked\_clients\_threshold\_critical](#input\_blocked\_clients\_threshold\_critical) | Blocked clients rate (critical threshold) | `number` | `30` | no |
| <a name="input_blocked_clients_threshold_warning"></a> [blocked\_clients\_threshold\_warning](#input\_blocked\_clients\_threshold\_warning) | Blocked clients rate (warning threshold) | `number` | `10` | no |
| <a name="input_blocked_clients_time_aggregator"></a> [blocked\_clients\_time\_aggregator](#input\_blocked\_clients\_time\_aggregator) | Monitor aggregator for Redis Blocked clients [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_blocked_clients_timeframe"></a> [blocked\_clients\_timeframe](#input\_blocked\_clients\_timeframe) | Monitor timeframe for Redis Blocked clients [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture Environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `15` | no |
| <a name="input_evictedkeys_change_enabled"></a> [evictedkeys\_change\_enabled](#input\_evictedkeys\_change\_enabled) | Flag to enable Redis evicted keys monitor | `string` | `"true"` | no |
| <a name="input_evictedkeys_change_extra_tags"></a> [evictedkeys\_change\_extra\_tags](#input\_evictedkeys\_change\_extra\_tags) | Extra tags for Redis evicted keys monitor | `list(string)` | `[]` | no |
| <a name="input_evictedkeys_change_message"></a> [evictedkeys\_change\_message](#input\_evictedkeys\_change\_message) | Custom message for Redis evicted keys monitor | `string` | `""` | no |
| <a name="input_evictedkeys_change_threshold_critical"></a> [evictedkeys\_change\_threshold\_critical](#input\_evictedkeys\_change\_threshold\_critical) | Evicted keys change (critical threshold) | `number` | `100` | no |
| <a name="input_evictedkeys_change_threshold_warning"></a> [evictedkeys\_change\_threshold\_warning](#input\_evictedkeys\_change\_threshold\_warning) | Evicted keys change (warning threshold) | `number` | `20` | no |
| <a name="input_evictedkeys_change_time_aggregator"></a> [evictedkeys\_change\_time\_aggregator](#input\_evictedkeys\_change\_time\_aggregator) | Monitor aggregator for Redis evicted keys [available values: min, max or avg] | `string` | `"avg"` | no |
| <a name="input_evictedkeys_change_timeframe"></a> [evictedkeys\_change\_timeframe](#input\_evictedkeys\_change\_timeframe) | Monitor timeframe for Redis evicted keys [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_expirations_rate_enabled"></a> [expirations\_rate\_enabled](#input\_expirations\_rate\_enabled) | Flag to enable Redis keys expirations monitor | `string` | `"true"` | no |
| <a name="input_expirations_rate_extra_tags"></a> [expirations\_rate\_extra\_tags](#input\_expirations\_rate\_extra\_tags) | Extra tags for Redis keys expirations monitor | `list(string)` | `[]` | no |
| <a name="input_expirations_rate_message"></a> [expirations\_rate\_message](#input\_expirations\_rate\_message) | Custom message for Redis keys expirations monitor | `string` | `""` | no |
| <a name="input_expirations_rate_threshold_critical"></a> [expirations\_rate\_threshold\_critical](#input\_expirations\_rate\_threshold\_critical) | Expirations percent (critical threshold) | `number` | `80` | no |
| <a name="input_expirations_rate_threshold_warning"></a> [expirations\_rate\_threshold\_warning](#input\_expirations\_rate\_threshold\_warning) | Expirations percent (warning threshold) | `number` | `60` | no |
| <a name="input_expirations_rate_time_aggregator"></a> [expirations\_rate\_time\_aggregator](#input\_expirations\_rate\_time\_aggregator) | Monitor aggregator for Redis keys expirations [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_expirations_rate_timeframe"></a> [expirations\_rate\_timeframe](#input\_expirations\_rate\_timeframe) | Monitor timeframe for Redis keys expirations [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_hitrate_enabled"></a> [hitrate\_enabled](#input\_hitrate\_enabled) | Flag to enable Redis hitrate monitor | `string` | `"true"` | no |
| <a name="input_hitrate_extra_tags"></a> [hitrate\_extra\_tags](#input\_hitrate\_extra\_tags) | Extra tags for Redis hitrate monitor | `list(string)` | `[]` | no |
| <a name="input_hitrate_message"></a> [hitrate\_message](#input\_hitrate\_message) | Custom message for Redis hitrate monitor | `string` | `""` | no |
| <a name="input_hitrate_threshold_critical"></a> [hitrate\_threshold\_critical](#input\_hitrate\_threshold\_critical) | hitrate limit (critical threshold) | `number` | `10` | no |
| <a name="input_hitrate_threshold_warning"></a> [hitrate\_threshold\_warning](#input\_hitrate\_threshold\_warning) | hitrate limit (warning threshold) | `number` | `30` | no |
| <a name="input_hitrate_time_aggregator"></a> [hitrate\_time\_aggregator](#input\_hitrate\_time\_aggregator) | Monitor aggregator for Redis hitrate [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_hitrate_timeframe"></a> [hitrate\_timeframe](#input\_hitrate\_timeframe) | Monitor timeframe for Redis hitrate [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_keyspace_enabled"></a> [keyspace\_enabled](#input\_keyspace\_enabled) | Flag to enable Redis keyspace monitor | `string` | `"true"` | no |
| <a name="input_keyspace_extra_tags"></a> [keyspace\_extra\_tags](#input\_keyspace\_extra\_tags) | Extra tags for Redis keyspace monitor | `list(string)` | `[]` | no |
| <a name="input_keyspace_message"></a> [keyspace\_message](#input\_keyspace\_message) | Custom message for Redis keyspace monitor | `string` | `""` | no |
| <a name="input_keyspace_threshold_critical"></a> [keyspace\_threshold\_critical](#input\_keyspace\_threshold\_critical) | Keyspace no changement (critical threshold) | `number` | `0` | no |
| <a name="input_keyspace_threshold_warning"></a> [keyspace\_threshold\_warning](#input\_keyspace\_threshold\_warning) | Keyspace no changement (warning threshold) | `number` | `1` | no |
| <a name="input_keyspace_time_aggregator"></a> [keyspace\_time\_aggregator](#input\_keyspace\_time\_aggregator) | Monitor aggregator for Redis keyspace [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_keyspace_timeframe"></a> [keyspace\_timeframe](#input\_keyspace\_timeframe) | Monitor timeframe for Redis keyspace [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_latency_enabled"></a> [latency\_enabled](#input\_latency\_enabled) | Flag to enable Redis latency monitor | `string` | `"true"` | no |
| <a name="input_latency_extra_tags"></a> [latency\_extra\_tags](#input\_latency\_extra\_tags) | Extra tags for Redis latency monitor | `list(string)` | `[]` | no |
| <a name="input_latency_message"></a> [latency\_message](#input\_latency\_message) | Custom message for Redis latency monitor | `string` | `""` | no |
| <a name="input_latency_threshold_critical"></a> [latency\_threshold\_critical](#input\_latency\_threshold\_critical) | latency limit (critical threshold) | `number` | `100` | no |
| <a name="input_latency_threshold_warning"></a> [latency\_threshold\_warning](#input\_latency\_threshold\_warning) | latency limit (warning threshold) | `number` | `50` | no |
| <a name="input_latency_time_aggregator"></a> [latency\_time\_aggregator](#input\_latency\_time\_aggregator) | Monitor aggregator for Redis latency [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_latency_timeframe"></a> [latency\_timeframe](#input\_latency\_timeframe) | Monitor timeframe for Redis latency [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_mem_frag_enabled"></a> [mem\_frag\_enabled](#input\_mem\_frag\_enabled) | Flag to enable Redis memory RAM fragmentation monitor | `string` | `"true"` | no |
| <a name="input_mem_frag_extra_tags"></a> [mem\_frag\_extra\_tags](#input\_mem\_frag\_extra\_tags) | Extra tags for Redis memory RAM fragmentation monitor | `list(string)` | `[]` | no |
| <a name="input_mem_frag_message"></a> [mem\_frag\_message](#input\_mem\_frag\_message) | Custom message for Redis memory RAM fragmentation monitor | `string` | `""` | no |
| <a name="input_mem_frag_threshold_critical"></a> [mem\_frag\_threshold\_critical](#input\_mem\_frag\_threshold\_critical) | memory RAM fragmentation limit (critical threshold) | `number` | `150` | no |
| <a name="input_mem_frag_threshold_warning"></a> [mem\_frag\_threshold\_warning](#input\_mem\_frag\_threshold\_warning) | memory RAM fragmentation limit (warning threshold) | `number` | `130` | no |
| <a name="input_mem_frag_time_aggregator"></a> [mem\_frag\_time\_aggregator](#input\_mem\_frag\_time\_aggregator) | Monitor aggregator for Redis memory RAM fragmentation [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_mem_frag_timeframe"></a> [mem\_frag\_timeframe](#input\_mem\_frag\_timeframe) | Monitor timeframe for Redis memory RAM fragmentation [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_mem_used_enabled"></a> [mem\_used\_enabled](#input\_mem\_used\_enabled) | Flag to enable Redis RAM memory used monitor | `string` | `"true"` | no |
| <a name="input_mem_used_extra_tags"></a> [mem\_used\_extra\_tags](#input\_mem\_used\_extra\_tags) | Extra tags for Redis RAM memory used monitor | `list(string)` | `[]` | no |
| <a name="input_mem_used_message"></a> [mem\_used\_message](#input\_mem\_used\_message) | Custom message for Redis RAM memory used monitor | `string` | `""` | no |
| <a name="input_mem_used_threshold_critical"></a> [mem\_used\_threshold\_critical](#input\_mem\_used\_threshold\_critical) | RAM memory used limit (critical threshold) | `number` | `95` | no |
| <a name="input_mem_used_threshold_warning"></a> [mem\_used\_threshold\_warning](#input\_mem\_used\_threshold\_warning) | RAM memory used limit (warning threshold) | `number` | `85` | no |
| <a name="input_mem_used_time_aggregator"></a> [mem\_used\_time\_aggregator](#input\_mem\_used\_time\_aggregator) | Monitor aggregator for Redis RAM memory used [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_mem_used_timeframe"></a> [mem\_used\_timeframe](#input\_mem\_used\_timeframe) | Monitor timeframe for Redis RAM memory used [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a Redis monitor is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds for the metric evaluation | `number` | `300` | no |
| <a name="input_not_responding_enabled"></a> [not\_responding\_enabled](#input\_not\_responding\_enabled) | Flag to enable Redis does not respond monitor | `string` | `"true"` | no |
| <a name="input_not_responding_extra_tags"></a> [not\_responding\_extra\_tags](#input\_not\_responding\_extra\_tags) | Extra tags for Redis does not respond monitor | `list(string)` | `[]` | no |
| <a name="input_not_responding_message"></a> [not\_responding\_message](#input\_not\_responding\_message) | Custom message for Redis does not respond monitor | `string` | `""` | no |
| <a name="input_not_responding_no_data_timeframe"></a> [not\_responding\_no\_data\_timeframe](#input\_not\_responding\_no\_data\_timeframe) | Redis does not respond monitor no data timeframe | `string` | `10` | no |
| <a name="input_not_responding_threshold_warning"></a> [not\_responding\_threshold\_warning](#input\_not\_responding\_threshold\_warning) | Redis does not respond monitor (warning threshold) | `string` | `3` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_rejected_con_enabled"></a> [rejected\_con\_enabled](#input\_rejected\_con\_enabled) | Flag to enable Redis rejected connections errors monitor | `string` | `"true"` | no |
| <a name="input_rejected_con_extra_tags"></a> [rejected\_con\_extra\_tags](#input\_rejected\_con\_extra\_tags) | Extra tags for Redis rejected connections errors monitor | `list(string)` | `[]` | no |
| <a name="input_rejected_con_message"></a> [rejected\_con\_message](#input\_rejected\_con\_message) | Custom message for Redis rejected connections errors monitor | `string` | `""` | no |
| <a name="input_rejected_con_threshold_critical"></a> [rejected\_con\_threshold\_critical](#input\_rejected\_con\_threshold\_critical) | rejected connections errors limit (critical threshold) | `number` | `50` | no |
| <a name="input_rejected_con_threshold_warning"></a> [rejected\_con\_threshold\_warning](#input\_rejected\_con\_threshold\_warning) | rejected connections errors limit (warning threshold) | `number` | `10` | no |
| <a name="input_rejected_con_time_aggregator"></a> [rejected\_con\_time\_aggregator](#input\_rejected\_con\_time\_aggregator) | Monitor aggregator for Redis rejected connections errors [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_rejected_con_timeframe"></a> [rejected\_con\_timeframe](#input\_rejected\_con\_timeframe) | Monitor timeframe for Redis rejected connections errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Global variables | `list(string)` | <pre>[<br>  "type:database",<br>  "provider:redisdb",<br>  "resource:redis"<br>]</pre> | no |
| <a name="input_team"></a> [team](#input\_team) | n/a | `string` | `"claranet"` | no |
| <a name="input_timeout_h"></a> [timeout\_h](#input\_timeout\_h) | Default auto-resolving state (in hours) | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_blocked_clients_id"></a> [blocked\_clients\_id](#output\_blocked\_clients\_id) | id for monitor blocked\_clients |
| <a name="output_evicted_keys_id"></a> [evicted\_keys\_id](#output\_evicted\_keys\_id) | id for monitor evicted\_keys |
| <a name="output_expirations_id"></a> [expirations\_id](#output\_expirations\_id) | id for monitor expirations |
| <a name="output_hitrate_id"></a> [hitrate\_id](#output\_hitrate\_id) | id for monitor hitrate |
| <a name="output_keyspace_full_id"></a> [keyspace\_full\_id](#output\_keyspace\_full\_id) | id for monitor keyspace\_full |
| <a name="output_latency_id"></a> [latency\_id](#output\_latency\_id) | id for monitor latency |
| <a name="output_memory_frag_id"></a> [memory\_frag\_id](#output\_memory\_frag\_id) | id for monitor memory\_frag |
| <a name="output_memory_used_id"></a> [memory\_used\_id](#output\_memory\_used\_id) | id for monitor memory\_used |
| <a name="output_not_responding_id"></a> [not\_responding\_id](#output\_not\_responding\_id) | id for monitor not\_responding |
| <a name="output_rejected_connections_id"></a> [rejected\_connections\_id](#output\_rejected\_connections\_id) | id for monitor rejected\_connections |
<!-- END_TF_DOCS -->
## Related documentation

[Datadog blog: How to monitor Redis](https://www.datadoghq.com/blog/how-to-monitor-redis-performance-metrics/)

[Datadog Redis integration doc](https://docs.datadoghq.com/integrations/redisdb/)
