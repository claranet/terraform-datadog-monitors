# DATABASE CASSANDRA DataDog monitors

## How to use this module

```
module "datadog-monitors-database-cassandra" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//database/cassandra?ref={revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- DSE Cassandra exceptions
- DSE Cassandra key cache
- DSE Cassandra node is down
- DSE Cassandra process is down
- DSE Cassandra read latency
- DSE Cassandra write latency

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cassandra\_exceptions\_enabled | Flag to enable Cassandra exceptions monitor | string | `"true"` | no |
| cassandra\_exceptions\_extra\_tags | Extra tags for Cassandra exceptions monitor | list(string) | `[]` | no |
| cassandra\_exceptions\_status\_message | Custom message for Cassandra exceptions monitor | string | `""` | no |
| cassandra\_exceptions\_threshold\_critical | Maximum critical acceptable rate of exceptions | string | `"1000"` | no |
| cassandra\_exceptions\_threshold\_warning | Maximum critical acceptable rate of exceptions | string | `"500"` | no |
| cassandra\_exceptions\_time\_aggregator | Monitor time aggregator for Cassandra exceptions monitor [available values: min, max or avg] | string | `"avg"` | no |
| cassandra\_exceptions\_timeframe | Monitor timeframe for Cassandra exceptions monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_15m"` | no |
| cassandra\_key\_cache\_enabled | Flag to enable Cassandra key cache monitor | string | `"true"` | no |
| cassandra\_key\_cache\_extra\_tags | Extra tags for Cassandra key cache monitor | list(string) | `[]` | no |
| cassandra\_key\_cache\_status\_message | Custom message for Cassandra key cache monitor | string | `""` | no |
| cassandra\_key\_cache\_threshold\_critical | Maximum critical acceptable rate of key cache | string | `"0.30"` | no |
| cassandra\_key\_cache\_threshold\_warning | Maximum critical acceptable rate of key cache | string | `"0.40"` | no |
| cassandra\_key\_cache\_time\_aggregator | Monitor time aggregator for Cassandra key cache monitor [available values: min, max or avg] | string | `"avg"` | no |
| cassandra\_key\_cache\_timeframe | Monitor timeframe for Cassandra key cache monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_15m"` | no |
| cassandra\_node\_enabled | Flag to enable Cassandra availability monitor | string | `"true"` | no |
| cassandra\_process\_enabled | Flag to enable Cassandra availability monitor | string | `"true"` | no |
| cassandra\_read\_latency\_availability\_extra\_tags | Extra tags for Cassandra read latency monitor | list(string) | `[]` | no |
| cassandra\_read\_latency\_enabled | Flag to enable Cassandra read latency monitor | string | `"true"` | no |
| cassandra\_read\_latency\_status\_message | Custom message for Cassandra read latency monitor | string | `""` | no |
| cassandra\_read\_latency\_threshold\_critical | Maximum critical acceptable ms of read latency | string | `"300000"` | no |
| cassandra\_read\_latency\_threshold\_warning | Maximum critical acceptable ms of read latency | string | `"250000"` | no |
| cassandra\_read\_latency\_time\_aggregator | Monitor time aggregator for Cassandra read latency monitor [available values: min, max or avg] | string | `"avg"` | no |
| cassandra\_read\_latency\_timeframe | Monitor timeframe for Cassandra read latency monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_15m"` | no |
| cassandra\_write\_latency\_availability\_extra\_tags | Extra tags for Cassandra write latency monitor | list(string) | `[]` | no |
| cassandra\_write\_latency\_enabled | Flag to enable Cassandra write latency monitor | string | `"true"` | no |
| cassandra\_write\_latency\_status\_message | Custom message for Cassandra write latency monitor | string | `""` | no |
| cassandra\_write\_latency\_threshold\_critical | Maximum critical acceptable ms of write latency | string | `"300000"` | no |
| cassandra\_write\_latency\_threshold\_warning | Maximum critical acceptable ms of write latency | string | `"250000"` | no |
| cassandra\_write\_latency\_time\_aggregator | Monitor time aggregator for Cassandra write latency monitor [available values: min, max or avg] | string | `"avg"` | no |
| cassandra\_write\_latency\_timeframe | Monitor timeframe for Cassandra write latency monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_15m"` | no |
| environment | Architecture Environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"15"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| message | Message sent when an alert is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |
| node\_cassandra\_availability\_extra\_tags | Extra tags for Cassandra availability monitor | list(string) | `[]` | no |
| node\_cassandra\_status\_message | Custom message for Cassandra availability monitor | string | `""` | no |
| node\_cassandra\_status\_time\_aggregator | Monitor aggregator for Cassandra [available values: min, max, sum or avg] | string | `"min"` | no |
| node\_cassandra\_status\_timeframe | Monitor timeframe for Cassandra [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | string | `""` | no |
| process\_cassandra\_availability\_extra\_tags | Extra tags for Cassandra availability monitor | list(string) | `[]` | no |
| process\_cassandra\_status\_message | Custom message for Cassandra status monitor | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| datadog\_cassandra\_process\_down\_id | id for monitor datadog_cassandra_process_down |
| datadog\_monitor\_cassandra\_exceptions\_id | id for monitor datadog_monitor_cassandra_exceptions |
| datadog\_monitor\_cassandra\_key\_cache\_id | id for monitor datadog_monitor_cassandra_key_cache |
| datadog\_monitor\_cassandra\_read\_latency\_id | id for monitor datadog_monitor_cassandra_read_latency |
| datadog\_monitor\_cassandra\_write\_latency\_id | id for monitor datadog_monitor_cassandra_write_latency |
| datadog\_node\_cassandra\_down\_id | id for monitor datadog_node_cassandra_down |

## Related documentation

