# DATABASE CASSANDRA PER-DATACENTER DataDog monitors

## How to use this module

```
module "datadog-monitors-database-cassandra-per-datacenter" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//database/cassandra/per-datacenter?ref={revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
  cassandra_datacenter_name = "name_of_datacenter"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- DSE Cassandra datacenter:${var.cassandra_datacenter_name} outliers_latency

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cassandra\_datacenter\_name | Name of datacenter you want to monitor | string | `""` | no |
| cassandra\_outliers\_latency\_enabled | Flag to enable Cassandra outliers_latencys monitor | string | `"true"` | no |
| cassandra\_outliers\_latency\_extra\_tags | Extra tags for Cassandra exceptions monitor | list(string) | `[]` | no |
| cassandra\_outliers\_latency\_status\_message | Custom message for Cassandra outliers_latency monitor | string | `""` | no |
| cassandra\_outliers\_latency\_threshold\_critical | Maximum critical acceptable rate of outliers_latency monitor | string | `"90"` | no |
| cassandra\_outliers\_latency\_threshold\_warning | Maximum warning acceptable rate of outliers_latency monitor | string | `"85"` | no |
| cassandra\_outliers\_latency\_time\_aggregator | Monitor time aggregator for Cassandra outliers_latency monitor [available values: min, max or avg] | string | `"avg"` | no |
| cassandra\_outliers\_latency\_timeframe | Monitor timeframe for Cassandra outliers_latency monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_15m"` | no |
| environment | Architecture Environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"15"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| message | Message sent when an alert is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| datadog\_monitor\_cassandra\_outliers\_latency\_id | id for monitor datadog_monitor_cassandra_outliers_latency |

## Related documentation

DataDog documentation: https://docs.datadoghq.com/integrations/cassandra/

## Notes

As we know Cassandra use a system of datacenter for his cluster. And some monitors need to filter metric by datacenter.  
This module can be used for the monitor that need to be filtered by datacenter.
You just have to add a variable var.cassandra_datacenter_name with the name of your datacenter in your terraform client : cassandra_datacenter_name = "name_of_datacenter"
