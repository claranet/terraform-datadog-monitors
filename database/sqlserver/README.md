# DATABASE SQLSERVER DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-database-sqlserver" {
  source      = "claranet/monitors/datadog//database/sqlserver"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- SQL Server server does not respond

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.26 |

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
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| sqlserver\_availability\_enabled | Flag to enable SQL Server availability monitor | `string` | `"true"` | no |
| sqlserver\_availability\_extra\_tags | Extra tags for SQL Server availability monitor | `list(string)` | `[]` | no |
| sqlserver\_availability\_message | Custom message for SQL Server availability monitor | `string` | `""` | no |
| sqlserver\_availability\_no\_data\_timeframe | SQL Server availability monitor no data timeframe | `string` | `10` | no |
| sqlserver\_availability\_threshold\_warning | SQL Server availability monitor (warning threshold) | `string` | `3` | no |

## Outputs

| Name | Description |
|------|-------------|
| sqlserver\_availability\_id | id for monitor sqlserver\_availability |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/sqlserver/](https://docs.datadoghq.com/integrations/sqlserver/)
