# DATABASE ZOOKEEPER DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-database-zookeeper" {
  source      = "claranet/monitors/datadog//database/zookeeper"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Zookeeper latency
- Zookeeper service does not respond

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| environment | Architecture environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `15` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| message | Message sent when a monitor is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before begin to monitor new host | `number` | `300` | no |
| not\_responding\_group\_by | List of tags to use to group data | `list(string)` | <pre>[<br>  "host",<br>  "server"<br>]<br></pre> | no |
| not\_responding\_locked | Lock Zookeeper not responding monitor | `bool` | `false` | no |
| not\_responding\_no\_data\_timeframe | Zookeeper monitor no\_data\_timeframe | `number` | `10` | no |
| not\_responding\_notify\_audit | Enable or not notify audit on Zookeeper not responding monitor | `bool` | `false` | no |
| not\_responding\_notify\_no\_data | Send notification if not\_responding monitor does not retrieve data | `bool` | `true` | no |
| not\_responding\_threshold\_warning | Zookeeper not responding limit (warning threshold) | `number` | `3` | no |
| not\_responding\_timeout\_h | Number of hour of Zookeeper not responding monitor not reporting data before it will automatically resolve from a triggered state | `number` | `0` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| zookeeper\_latency\_availability\_extra\_tags | Extra tags for zookeeper read latency monitor | `list(string)` | `[]` | no |
| zookeeper\_latency\_enabled | Flag to enable Zookeeper read latency monitor | `string` | `"true"` | no |
| zookeeper\_latency\_group\_by | Tags to use to group datas | `list(string)` | <pre>[<br>  "host"<br>]<br></pre> | no |
| zookeeper\_latency\_notify\_audit | Enable or not notify audit on Zookeeper latency monitor | `bool` | `false` | no |
| zookeeper\_latency\_status\_message | Custom message for Zookeeper read latency monitor | `string` | `""` | no |
| zookeeper\_latency\_threshold\_critical | Maximum critical acceptable ms of zookeeper latency monitor | `number` | `300000` | no |
| zookeeper\_latency\_threshold\_warning | Maximum warning acceptable ms of zookeeper latency monitor | `number` | `250000` | no |
| zookeeper\_latency\_time\_aggregator | Monitor time aggregator for Zookeeper read latency monitor [available values: min, max or avg] | `string` | `"avg"` | no |
| zookeeper\_latency\_timeframe | Monitor timeframe for Zookeeper read latency monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| zookeeper\_latency\_timeout\_h | Number of hour of Zookeeper latency monitor not reporting data before it will automatically resolve from a triggered state | `number` | `0` | no |
| zookeeper\_not\_responding\_enabled | Flag to enable Zookeeper does not respond monitor | `string` | `"true"` | no |
| zookeeper\_not\_responding\_extra\_tags | Extra tags for Zookeeper does not respond monitor | `list(string)` | `[]` | no |
| zookeeper\_not\_responding\_message | Custom message for Zookeeper does not respond monitor | `string` | `""` | no |
| zookeeper\_not\_responding\_time\_aggregator | Time aggregator for the Zookeeper does not respond monitor | `string` | `"avg"` | no |
| zookeeper\_not\_responding\_timeframe | Timeframe for the does not respond monitor | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| datadog\_monitor\_zookeeper\_latency\_id | id for monitor datadog\_monitor\_zookeeper\_latency |
| not\_responding\_id | id for monitor not\_responding |

## Related documentation
* [Integration Datadog & ElasticSearch](https://docs.datadoghq.com/integrations/elastic/)
* [How to monitor ElasticSearch with Datadog](https://www.datadoghq.com/blog/monitor-elasticsearch-datadog/)
