# DATABASE POSTGRESQL DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-database-postgresql" {
  source      = "claranet/monitors/datadog//database/postgresql"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- PostgreSQL Connections
- PostgreSQL server does not respond
- PostgreSQL too many locks

## Requirements

No requirements.

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
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| postgresql\_availability\_enabled | Flag to enable PostgreSQL availability monitor | `string` | `"true"` | no |
| postgresql\_availability\_extra\_tags | Extra tags for PostgreSQL availability monitor | `list(string)` | `[]` | no |
| postgresql\_availability\_message | Custom message for PostgreSQL availability monitor | `string` | `""` | no |
| postgresql\_availability\_no\_data\_timeframe | PostgreSQL availability monitor no data timeframe | `string` | `10` | no |
| postgresql\_availability\_threshold\_warning | PostgreSQL availability monitor (warning threshold) | `string` | `3` | no |
| postgresql\_connection\_enabled | Flag to enable PostgreSQL connection monitor | `string` | `"true"` | no |
| postgresql\_connection\_extra\_tags | Extra tags for PostgreSQL connection connects monitor | `list(string)` | `[]` | no |
| postgresql\_connection\_message | Custom message for PostgreSQL connection monitor | `string` | `""` | no |
| postgresql\_connection\_threshold\_critical | Maximum critical acceptable percent of connections | `number` | `80` | no |
| postgresql\_connection\_threshold\_warning | Maximum warning acceptable percent of connections | `number` | `70` | no |
| postgresql\_connection\_time\_aggregator | Monitor time aggregator for PostgreSQL connection monitor [available values: min, max or avg] | `string` | `"avg"` | no |
| postgresql\_connection\_timeframe | Monitor timeframe for PostgreSQL connection monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| postgresql\_lock\_enabled | Flag to enable PostgreSQL lock monitor | `string` | `"true"` | no |
| postgresql\_lock\_extra\_tags | Extra tags for PostgreSQL lock connects monitor | `list(string)` | `[]` | no |
| postgresql\_lock\_message | Custom message for PostgreSQL lock monitor | `string` | `""` | no |
| postgresql\_lock\_threshold\_critical | Maximum critical acceptable number of locks | `number` | `99` | no |
| postgresql\_lock\_threshold\_warning | Maximum warning acceptable number of locks | `number` | `70` | no |
| postgresql\_lock\_time\_aggregator | Monitor time aggregator for PostgreSQL lock monitor [available values: min, max or avg] | `string` | `"min"` | no |
| postgresql\_lock\_timeframe | Monitor timeframe for PostgreSQL lock monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| postgresql\_availability\_id | id for monitor postgresql\_availability |
| postgresql\_connection\_too\_high\_id | id for monitor postgresql\_connection\_too\_high |
| postgresql\_too\_many\_locks\_id | id for monitor postgresql\_too\_many\_locks |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/postgres/](https://docs.datadoghq.com/integrations/postgres/)
