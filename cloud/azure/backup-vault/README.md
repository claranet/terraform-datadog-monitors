# CLOUD AZURE BACKUP-VAULT DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-backup-vault" {
  source      = "claranet/monitors/datadog//cloud/azure/backup-vault"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Backup Vault {{name}} has a backup unhealthy event
- Backup Vault {{name}} has a backup unhealthy event

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.31 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | >= 3.1.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | >= 3.1.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_filter-tags"></a> [filter-tags](#module\_filter-tags) | ../../../common/filter-tags | n/a |
| <a name="module_filter-tags-unhealthy-event"></a> [filter-tags-unhealthy-event](#module\_filter-tags-unhealthy-event) | ../../../common/filter-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.backup_vault_backup_unhealthy_event](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.backup_vault_restore_unhealthy_event](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backup_unhealthy_event_enabled"></a> [backup\_unhealthy\_event\_enabled](#input\_backup\_unhealthy\_event\_enabled) | Flag to enable Backup Vault Unhealthy Backup Event monitor | `string` | `"true"` | no |
| <a name="input_backup_unhealthy_event_extra_tags"></a> [backup\_unhealthy\_event\_extra\_tags](#input\_backup\_unhealthy\_event\_extra\_tags) | Extra tags for Backup Vault Unhealthy Backup Event monitor | `list(string)` | `[]` | no |
| <a name="input_backup_unhealthy_event_message"></a> [backup\_unhealthy\_event\_message](#input\_backup\_unhealthy\_event\_message) | Custom message for Backup Vault Unhealthy Backup Event monitor | `string` | `""` | no |
| <a name="input_backup_unhealthy_event_time_aggregator"></a> [backup\_unhealthy\_event\_time\_aggregator](#input\_backup\_unhealthy\_event\_time\_aggregator) | Monitor aggregator for Backup Vault Unhealthy Backup Event [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_backup_unhealthy_event_timeframe"></a> [backup\_unhealthy\_event\_timeframe](#input\_backup\_unhealthy\_event\_timeframe) | Monitor timeframe for Backup Vault Unhealthy Backup Event [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_1d"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture Environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a monitor is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_no_data_timeframe"></a> [no\_data\_timeframe](#input\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `7200` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_restore_unhealthy_event_enabled"></a> [restore\_unhealthy\_event\_enabled](#input\_restore\_unhealthy\_event\_enabled) | Flag to enable Backup Vault Unhealthy Restore Event monitor | `string` | `"true"` | no |
| <a name="input_restore_unhealthy_event_extra_tags"></a> [restore\_unhealthy\_event\_extra\_tags](#input\_restore\_unhealthy\_event\_extra\_tags) | Extra tags for Backup Vault Unhealthy Restore Event monitor | `list(string)` | `[]` | no |
| <a name="input_restore_unhealthy_event_message"></a> [restore\_unhealthy\_event\_message](#input\_restore\_unhealthy\_event\_message) | Custom message for Backup Vault Unhealthy Restore Event monitor | `string` | `""` | no |
| <a name="input_restore_unhealthy_event_time_aggregator"></a> [restore\_unhealthy\_event\_time\_aggregator](#input\_restore\_unhealthy\_event\_time\_aggregator) | Monitor aggregator for Backup Vault Unhealthy Restore Event [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_restore_unhealthy_event_timeframe"></a> [restore\_unhealthy\_event\_timeframe](#input\_restore\_unhealthy\_event\_timeframe) | Monitor timeframe for Backup Vault Unhealthy Restore Event [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_1d"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Global variables | `list(string)` | <pre>[<br>  "type:cloud",<br>  "provider:azure",<br>  "resource:backup_vault"<br>]</pre> | no |
| <a name="input_team"></a> [team](#input\_team) | n/a | `string` | `"claranet"` | no |
| <a name="input_timeout_h"></a> [timeout\_h](#input\_timeout\_h) | Default auto-resolving state (in hours) | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backup_vault_backup_unhealthy_event_id"></a> [backup\_vault\_backup\_unhealthy\_event\_id](#output\_backup\_vault\_backup\_unhealthy\_event\_id) | id for monitor backup\_vault\_backup\_unhealthy\_event |
| <a name="output_backup_vault_restore_unhealthy_event_id"></a> [backup\_vault\_restore\_unhealthy\_event\_id](#output\_backup\_vault\_restore\_unhealthy\_event\_id) | id for monitor backup\_vault\_restore\_unhealthy\_event |
<!-- END_TF_DOCS -->
## Related documentation

DataDog documentation : [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)  
You must search `keyvault`, there is no integration for now.

Azure metrics documentation : [https://docs.microsoft.com/fr-fr/azure/monitoring-and-diagnostics/monitoring-supported-metrics#microsoftkeyvaultvaults](https://docs.microsoft.com/fr-fr/azure/monitoring-and-diagnostics/monitoring-supported-metrics#microsoftkeyvaultvaults)
