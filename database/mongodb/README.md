# DATABASE MONGODB DataDog monitors

## How to use this module

```
module "datadog-monitors-database-mongodb" {
  source = "claranet/monitors/datadog//database/mongodb"
  version = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- MongoDB primary state
- MongoDB replication lag
- MongoDB secondary missing
- MongoDB too much servers or wrong monitoring config

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| environment | Architecture Environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `15` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| message | Message sent when an alert is triggered | `any` | n/a | yes |
| mongodb\_desired\_servers\_count | Number of servers that should be instanciated for this cluster | `number` | `3` | no |
| mongodb\_lag\_critical | Critical replication lag in s | `number` | `5` | no |
| mongodb\_lag\_warning | Warn replication lag in s | `number` | `2` | no |
| mongodb\_primary\_aggregator | Monitor aggregator for MongoDB primary state [available values: min, max] | `string` | `"max"` | no |
| mongodb\_primary\_enabled | Flag to enable MongoDB primary state monitor | `string` | `"true"` | no |
| mongodb\_primary\_extra\_tags | Extra tags for MongoDB primary state monitor | `list(string)` | `[]` | no |
| mongodb\_primary\_message | Custom message for MongoDB primary monitor | `string` | `""` | no |
| mongodb\_primary\_timeframe | Monitor timeframe for MongoDB wrong state for primary node [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_1m"` | no |
| mongodb\_replication\_aggregator | Monitor aggregator for MongoDB replication lag [available values: min, max, sum or avg] | `string` | `"avg"` | no |
| mongodb\_replication\_enabled | Flag to enable MongoDB replication lag monitor | `string` | `"true"` | no |
| mongodb\_replication\_extra\_tags | Extra tags for MongoDB replication lag monitor | `list(string)` | `[]` | no |
| mongodb\_replication\_message | Custom message for MongoDB replication monitor | `string` | `""` | no |
| mongodb\_replication\_timeframe | Monitor timeframe for MongoDB replication lag  [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_1m"` | no |
| mongodb\_secondary\_aggregator | Monitor aggregator for MongoDB secondary state [available values: min, max] | `string` | `"max"` | no |
| mongodb\_secondary\_enabled | Flag to enable MongoDB secondary state monitor | `string` | `"true"` | no |
| mongodb\_secondary\_extra\_tags | Extra tags for MongoDB secondary state monitor | `list(string)` | `[]` | no |
| mongodb\_secondary\_message | Custom message for MongoDB secondary monitor | `string` | `""` | no |
| mongodb\_secondary\_timeframe | Monitor timeframe for MongoDB wrong state for secondaries nodes [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| mongodb\_server\_count\_aggregator | Monitor aggregator for MongoDB server count [available values: min, max] | `string` | `"min"` | no |
| mongodb\_server\_count\_enabled | Flag to enable MongoDB server count monitor | `string` | `"true"` | no |
| mongodb\_server\_count\_message | Custom message for MongoDB server count | `string` | `""` | no |
| mongodb\_server\_count\_timeframe | Monitor timeframe for MongoDB wrong server count [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| mongodb\_primary\_id | id for monitor mongodb\_primary |
| mongodb\_replication\_id | id for monitor mongodb\_replication |
| mongodb\_secondary\_id | id for monitor mongodb\_secondary |
| mongodb\_server\_count\_id | id for monitor mongodb\_server\_count |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/mongo/](https://docs.datadoghq.com/integrations/mongo/)
MongoDB documentation: [https://docs.mongodb.com/manual/administration/monitoring/](https://docs.mongodb.com/manual/administration/monitoring/)
