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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.31 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | >= 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | 3.4.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_filter-tags"></a> [filter-tags](#module\_filter-tags) | ../../common/filter-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.sqlserver_availability](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `15` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when an alert is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds for the metric evaluation | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_sqlserver_availability_enabled"></a> [sqlserver\_availability\_enabled](#input\_sqlserver\_availability\_enabled) | Flag to enable SQL Server availability monitor | `string` | `"true"` | no |
| <a name="input_sqlserver_availability_extra_tags"></a> [sqlserver\_availability\_extra\_tags](#input\_sqlserver\_availability\_extra\_tags) | Extra tags for SQL Server availability monitor | `list(string)` | `[]` | no |
| <a name="input_sqlserver_availability_message"></a> [sqlserver\_availability\_message](#input\_sqlserver\_availability\_message) | Custom message for SQL Server availability monitor | `string` | `""` | no |
| <a name="input_sqlserver_availability_no_data_timeframe"></a> [sqlserver\_availability\_no\_data\_timeframe](#input\_sqlserver\_availability\_no\_data\_timeframe) | SQL Server availability monitor no data timeframe | `string` | `10` | no |
| <a name="input_sqlserver_availability_threshold_warning"></a> [sqlserver\_availability\_threshold\_warning](#input\_sqlserver\_availability\_threshold\_warning) | SQL Server availability monitor (warning threshold) | `string` | `3` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sqlserver_availability_id"></a> [sqlserver\_availability\_id](#output\_sqlserver\_availability\_id) | id for monitor sqlserver\_availability |
## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/sqlserver/](https://docs.datadoghq.com/integrations/sqlserver/)
