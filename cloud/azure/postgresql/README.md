# CLOUD AZURE POSTGRESQL DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-postgresql" {
  source      = "claranet/monitors/datadog//cloud/azure/postgresql"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Postgresql Server CPU usage
- Postgresql Server has no connection
- Postgresql Server IO consumption
- Postgresql Server memory usage
- Postgresql Server storage

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| cpu\_usage\_enabled | Flag to enable PostgreSQL status monitor | `string` | `"true"` | no |
| cpu\_usage\_extra\_tags | Extra tags for PostgreSQL status monitor | `list(string)` | `[]` | no |
| cpu\_usage\_message | Custom message for PostgreSQL CPU monitor | `string` | `""` | no |
| cpu\_usage\_threshold\_critical | PostgreSQL CPU usage in percent (critical threshold) | `string` | `"90"` | no |
| cpu\_usage\_threshold\_warning | PostgreSQL CPU usage in percent (warning threshold) | `string` | `"80"` | no |
| cpu\_usage\_time\_aggregator | Monitor aggregator for PostgreSQL CPU [available values: min, max or avg] | `string` | `"min"` | no |
| cpu\_usage\_timeframe | Monitor timeframe for PostgreSQL CPU [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| environment | Architecture environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `900` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| free\_storage\_enabled | Flag to enable PostgreSQL status monitor | `string` | `"true"` | no |
| free\_storage\_extra\_tags | Extra tags for PostgreSQL status monitor | `list(string)` | `[]` | no |
| free\_storage\_message | Custom message for PostgreSQL Free Storage monitor | `string` | `""` | no |
| free\_storage\_threshold\_critical | PostgreSQL Free Storage remaining in percent (critical threshold) | `string` | `"10"` | no |
| free\_storage\_threshold\_warning | PostgreSQL Free Storage remaining in percent (warning threshold) | `string` | `"20"` | no |
| free\_storage\_time\_aggregator | Monitor aggregator for PostgreSQL Free Storage [available values: min, max or avg] | `string` | `"min"` | no |
| free\_storage\_timeframe | Monitor timeframe for PostgreSQL Free Storage [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| io\_consumption\_enabled | Flag to enable PostgreSQL status monitor | `string` | `"true"` | no |
| io\_consumption\_extra\_tags | Extra tags for PostgreSQL status monitor | `list(string)` | `[]` | no |
| io\_consumption\_message | Custom message for PostgreSQL IO consumption monitor | `string` | `""` | no |
| io\_consumption\_threshold\_critical | PostgreSQL IO consumption in percent (critical threshold) | `string` | `"90"` | no |
| io\_consumption\_threshold\_warning | PostgreSQL IO consumption in percent (warning threshold) | `string` | `"80"` | no |
| io\_consumption\_time\_aggregator | Monitor aggregator for PostgreSQL IO consumption [available values: min, max or avg] | `string` | `"min"` | no |
| io\_consumption\_timeframe | Monitor timeframe for PostgreSQL IO consumption [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| memory\_usage\_enabled | Flag to enable PostgreSQL status monitor | `string` | `"true"` | no |
| memory\_usage\_extra\_tags | Extra tags for PostgreSQL status monitor | `list(string)` | `[]` | no |
| memory\_usage\_message | Custom message for PostgreSQL memory monitor | `string` | `""` | no |
| memory\_usage\_threshold\_critical | PostgreSQL memory usage in percent (critical threshold) | `string` | `"90"` | no |
| memory\_usage\_threshold\_warning | PostgreSQL memory usage in percent (warning threshold) | `string` | `"80"` | no |
| memory\_usage\_time\_aggregator | Monitor aggregator for PostgreSQL memory [available values: min, max or avg] | `string` | `"min"` | no |
| memory\_usage\_timeframe | Monitor timeframe for PostgreSQL memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| message | Message sent when an alert is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| no\_connection\_enabled | Flag to enable PostgreSQL status monitor | `string` | `"true"` | no |
| no\_connection\_extra\_tags | Extra tags for PostgreSQL status monitor | `list(string)` | `[]` | no |
| no\_connection\_message | Custom message for PostgreSQL no connection monitor | `string` | `""` | no |
| no\_connection\_time\_aggregator | Monitor aggregator for PostgreSQL no connection [available values: min, max or avg] | `string` | `"min"` | no |
| no\_connection\_timeframe | Monitor timeframe for PostgreSQL no connection [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| postgresql\_cpu\_usage\_id | id for monitor postgresql\_cpu\_usage |
| postgresql\_free\_storage\_id | id for monitor postgresql\_free\_storage |
| postgresql\_io\_consumption\_id | id for monitor postgresql\_io\_consumption |
| postgresql\_memory\_usage\_id | id for monitor postgresql\_memory\_usage |
| postgresql\_no\_connection\_id | id for monitor postgresql\_no\_connection |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)
You have to search `mysql`
