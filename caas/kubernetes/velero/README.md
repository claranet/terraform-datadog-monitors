# CAAS KUBERNETES VELERO DataDog monitors

## How to use this module

```
module "datadog-monitors-caas-kubernetes-velero" {
  source = "claranet/monitors/datadog//caas/kubernetes/velero"
  version = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Velero backup deletion failure
- Velero backup failure
- Velero backup partial failure
- Velero scheduled backup missing
- Velero volume snapshot failure

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Architecture environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"15"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_scheduled\_backup\_custom | Tags used for scheduled backup custom filtering when filter_tags_scheduled_backup_use_defaults is false | string | `"null"` | no |
| filter\_tags\_scheduled\_backup\_custom\_excluded | Tags excluded for scheduled backup custom filtering when filter_tags_scheduled_backup_use_defaults is false | string | `"null"` | no |
| filter\_tags\_scheduled\_backup\_use\_defaults | Use default filter tags scheduled backup convention | string | `"null"` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| message | Message sent when a monitor is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |
| notify\_no\_data | Will raise no data alert if set to true | string | `"true"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | string | `""` | no |
| velero\_backup\_deletion\_failure\_enabled | Flag to enable Velero backup deletion failure monitor | string | `"true"` | no |
| velero\_backup\_deletion\_failure\_extra\_tags | Extra tags for Velero backup deletion failure monitor | list(string) | `[]` | no |
| velero\_backup\_deletion\_failure\_monitor\_message | Custom message for Velero backup deletion failure monitor | string | `""` | no |
| velero\_backup\_deletion\_failure\_monitor\_timeframe | Monitor timeframe for Velero backup deletion failure monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_1d"` | no |
| velero\_backup\_failure\_enabled | Flag to enable Velero backup failure monitor | string | `"true"` | no |
| velero\_backup\_failure\_extra\_tags | Extra tags for Velero backup failure monitor | list(string) | `[]` | no |
| velero\_backup\_failure\_monitor\_message | Custom message for Velero backup failure monitor | string | `""` | no |
| velero\_backup\_failure\_monitor\_timeframe | Monitor timeframe for Velero backup failure monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_1d"` | no |
| velero\_backup\_partial\_failure\_enabled | Flag to enable Velero backup partial failure monitor | string | `"true"` | no |
| velero\_backup\_partial\_failure\_extra\_tags | Extra tags for Velero backup partial failure monitor | list(string) | `[]` | no |
| velero\_backup\_partial\_failure\_monitor\_message | Custom message for Velero backup partial failure monitor | string | `""` | no |
| velero\_backup\_partial\_failure\_monitor\_timeframe | Monitor timeframe for Velero backup partial failure monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_1d"` | no |
| velero\_scheduled\_backup\_missing\_enabled | Flag to enable Velero scheduled backup missing monitor | string | `"true"` | no |
| velero\_scheduled\_backup\_missing\_extra\_tags | Extra tags for Velero scheduled backup missing monitor | list(string) | `[]` | no |
| velero\_scheduled\_backup\_missing\_monitor\_message | Custom message for Velero scheduled backup missing monitor | string | `""` | no |
| velero\_scheduled\_backup\_missing\_monitor\_no\_data\_timeframe | No data timeframe in minutes | string | `"1440"` | no |
| velero\_scheduled\_backup\_missing\_monitor\_timeframe | Monitor timeframe for Velero scheduled backup missing monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_1d"` | no |
| velero\_volume\_snapshot\_failure\_enabled | Flag to enable Velero volume snapshot failure monitor | string | `"true"` | no |
| velero\_volume\_snapshot\_failure\_extra\_tags | Extra tags for Velero volume snapshot failure monitor | list(string) | `[]` | no |
| velero\_volume\_snapshot\_failure\_monitor\_message | Custom message for Velero volume snapshot failure monitor | string | `""` | no |
| velero\_volume\_snapshot\_failure\_monitor\_timeframe | Monitor timeframe for Velero volume snapshot failure monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_1d"` | no |

## Outputs

| Name | Description |
|------|-------------|
| velero\_backup\_deletion\_failure\_id | id for monitor velero_backup_deletion_failure |
| velero\_backup\_failure\_id | id for monitor velero_backup_failure |
| velero\_backup\_partial\_failure\_id | id for monitor velero_backup_partial_failure |
| velero\_scheduled\_backup\_missing\_id | id for monitor velero_scheduled_backup_missing |
| velero\_volume\_snapshot\_failure\_id | id for monitor velero_volume_snapshot_failure |

## Related documentation

