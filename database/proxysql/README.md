# DATABASE PROXYSQL DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-database-proxysql" {
  source      = "claranet/monitors/datadog//database/proxysql"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- ProxySQL Client connections aborted
- ProxySQL Pool connections failure
- ProxySQL Server connections aborted
- ProxySQL Slow queries
- ProxySQL Thread Worker

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.31 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | Environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `15` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| message | Message sent when an alert is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds for the metric evaluation | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `false` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| proxysql\_client\_conn\_aborted\_enabled | Flag to enable ProxySQL client connections aborted monitor | `string` | `"true"` | no |
| proxysql\_client\_conn\_aborted\_extra\_tags | Extra tags for ProxySQL client connections aborted monitor | `list(string)` | `[]` | no |
| proxysql\_client\_conn\_aborted\_message | Custom message for ProxySQL client connections aborted monitor | `string` | `""` | no |
| proxysql\_client\_conn\_aborted\_threshold\_critical | Maximum critical acceptable percent of aborted connects | `number` | `10` | no |
| proxysql\_client\_conn\_aborted\_threshold\_warning | Maximum warning acceptable percent of aborted connects | `number` | `1` | no |
| proxysql\_client\_conn\_aborted\_time\_aggregator | Monitor time aggregator for ProxySQL client connections aborted monitor [available values: min, max or avg] | `string` | `"avg"` | no |
| proxysql\_client\_conn\_aborted\_timeframe | Monitor timeframe for ProxySQL client connections aborted monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_10m"` | no |
| proxysql\_pool\_conn\_failure\_enabled | Flag to enable ProxySQL pool connections failure monitor | `string` | `"true"` | no |
| proxysql\_pool\_conn\_failure\_extra\_tags | Extra tags for ProxySQL pool connections failure monitor | `list(string)` | `[]` | no |
| proxysql\_pool\_conn\_failure\_message | Custom message for ProxySQL pool connections failure monitor | `string` | `""` | no |
| proxysql\_pool\_conn\_failure\_threshold\_critical | Maximum critical acceptable of pool connections failure | `number` | `20` | no |
| proxysql\_pool\_conn\_failure\_threshold\_warning | Maximum warning acceptable of pool connections failure | `number` | `1` | no |
| proxysql\_pool\_conn\_failure\_time\_aggregator | Monitor time aggregator for ProxySQL pool connections failure monitor [available values: min, max or avg] | `string` | `"avg"` | no |
| proxysql\_pool\_conn\_failure\_timeframe | Monitor timeframe for ProxySQL pool connections failure monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| proxysql\_server\_conn\_aborted\_enabled | Flag to enable ProxySQL server connections aborted monitor | `string` | `"true"` | no |
| proxysql\_server\_conn\_aborted\_extra\_tags | Extra tags for ProxySQL server connections aborted monitor | `list(string)` | `[]` | no |
| proxysql\_server\_conn\_aborted\_message | Custom message for ProxySQL server connections aborted monitor | `string` | `""` | no |
| proxysql\_server\_conn\_aborted\_threshold\_critical | Maximum critical acceptable percent of aborted connects | `number` | `10` | no |
| proxysql\_server\_conn\_aborted\_threshold\_warning | Maximum warning acceptable percent of aborted connects | `number` | `1` | no |
| proxysql\_server\_conn\_aborted\_time\_aggregator | Monitor time aggregator for ProxySQL server connections aborted monitor [available values: min, max or avg] | `string` | `"avg"` | no |
| proxysql\_server\_conn\_aborted\_timeframe | Monitor timeframe for ProxySQL server connections aborted monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_10m"` | no |
| proxysql\_slow\_enabled | Flag to enable ProxySQL slow queries monitor | `string` | `"true"` | no |
| proxysql\_slow\_extra\_tags | Extra tags for ProxySQL slow queries monitor | `list(string)` | `[]` | no |
| proxysql\_slow\_message | Custom message for ProxySQL slow queries monitor | `string` | `""` | no |
| proxysql\_slow\_threshold\_critical | Maximum critical acceptable of slow queries | `number` | `20` | no |
| proxysql\_slow\_threshold\_warning | Maximum warning acceptable of slow queries | `number` | `1` | no |
| proxysql\_slow\_time\_aggregator | Monitor time aggregator for ProxySQL slow queries monitor [available values: min, max or avg] | `string` | `"avg"` | no |
| proxysql\_slow\_timeframe | Monitor timeframe for ProxySQL slow queries monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| proxysql\_thread\_worker\_enabled | Flag to enable ProxySQL thread worker monitor | `string` | `"true"` | no |
| proxysql\_thread\_worker\_extra\_tags | Extra tags for ProxySQL thread worker monitor | `list(string)` | `[]` | no |
| proxysql\_thread\_worker\_message | Custom message for ProxySQL thread worker monitor | `string` | `""` | no |
| proxysql\_thread\_worker\_threshold\_critical | Minimum critical acceptable of thread worker running | `number` | `1` | no |
| proxysql\_thread\_worker\_threshold\_warning | Minimum warning acceptable of thread worker running | `number` | `4` | no |
| proxysql\_thread\_worker\_time\_aggregator | Monitor time aggregator for ProxySQL thread worker monitor [available values: min, max or avg] | `string` | `"avg"` | no |
| proxysql\_thread\_worker\_timeframe | Monitor timeframe for ProxySQL thread worker monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| proxysql\_client\_conn\_aborted\_id | id for monitor proxysql\_client\_conn\_aborted |
| proxysql\_pool\_conn\_failure\_id | id for monitor proxysql\_pool\_conn\_failure |
| proxysql\_server\_conn\_aborted\_id | id for monitor proxysql\_server\_conn\_aborted |
| proxysql\_slow\_id | id for monitor proxysql\_slow |
| proxysql\_thread\_worker\_id | id for monitor proxysql\_thread\_worker |

## Related documentation

* [Datadog documentation](https://docs.datadoghq.com/integrations/proxysql/)
* [ProxySQL documentation](https://proxysql.com/documentation/)
