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

- DSE Cassandra node is down
- DSE Cassandra process is down

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Architecture Environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"15"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| message | Message sent when an alert is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |
| node\_cassandra\_availability\_extra\_tags | Extra tags for Cassandra availability monitor | list(string) | `[]` | no |
| node\_cassandra\_enabled | Flag to enable Cassandra availability monitor | string | `"true"` | no |
| node\_cassandra\_status\_message | Custom message for Cassandra availability monitor | string | `""` | no |
| node\_cassandra\_status\_time\_aggregator | Monitor aggregator for Cassandra [available values: min, max, sum or avg] | string | `"min"` | no |
| node\_cassandra\_status\_timeframe | Monitor timeframe for Cassandra [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | string | `""` | no |
| process\_cassandra\_availability\_extra\_tags | Extra tags for Cassandra availability monitor | list(string) | `[]` | no |
| process\_cassandra\_enabled | Flag to enable Cassandra availability monitor | string | `"true"` | no |
| process\_cassandra\_status\_message | Custom message for Cassandra connection monitor | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| datadog\_cassandra\_process\_down\_id | id for monitor datadog_cassandra_process_down |
| datadog\_node\_cassandra\_down\_id | id for monitor datadog_node_cassandra_down |

## Related documentation

