# DATABASE ZOOKEEPER DataDog monitors

## How to use this module

```
module "datadog-monitors-database-zookeeper" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//database/zookeeper?ref={revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Zookeeper latency
- Zookeeper process is down

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Architecture environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"15"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| message | Message sent when a monitor is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before begin to monitor new host | string | `"300"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | string | `""` | no |
| zookeeper\_latency\_availability\_extra\_tags | Extra tags for zookeeper read latency monitor | list(string) | `[]` | no |
| zookeeper\_latency\_enabled | Flag to enable Zookeeper read latency monitor | string | `"true"` | no |
| zookeeper\_latency\_status\_message | Custom message for Zookeeper read latency monitor | string | `""` | no |
| zookeeper\_latency\_threshold\_critical | Maximum critical acceptable ms of zookeeper latency monitor | string | `"300000"` | no |
| zookeeper\_latency\_threshold\_warning | Maximum warning acceptable ms of zookeeper latency monitor | string | `"250000"` | no |
| zookeeper\_latency\_time\_aggregator | Monitor time aggregator for Zookeeper read latency monitor [available values: min, max or avg] | string | `"avg"` | no |
| zookeeper\_latency\_timeframe | Monitor timeframe for Zookeeper read latency monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_15m"` | no |
| zookeeper\_process\_enabled | Flag to enable Zookeeper does not respond monitor | string | `"true"` | no |
| zookeeper\_process\_extra\_tags | Extra tags for Zookeeper does not respond monitor | list(string) | `[]` | no |
| zookeeper\_process\_message | Custom message for Zookeeper does not respond monitor | string | `""` | no |
| zookeeper\_process\_time\_aggregator | Time aggregator for the Zookeeper does not respond monitor | string | `"avg"` | no |
| zookeeper\_process\_timeframe | Timeframe for the does not respond monitor | string | `"last_10m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| datadog\_monitor\_zookeeper\_latency\_id | id for monitor datadog_monitor_zookeeper_latency |
| datadog\_zookeeper\_process\_down\_id | id for monitor datadog_zookeeper_process_down |

## Related documentation
* [Integration Datadog & ElasticSearch](https://docs.datadoghq.com/integrations/elastic/)
* [How to monitor ElasticSearch with Datadog](https://www.datadoghq.com/blog/monitor-elasticsearch-datadog/)
