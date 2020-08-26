# CAAS KUBERNETES VELERO DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-caas-kubernetes-velero" {
  source      = "claranet/monitors/datadog//caas/kubernetes/velero"
  version     = "{revision}"

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

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.26 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | Architecture environment | `any` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `15` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| message | Message sent when a monitor is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| velero\_backup\_deletion\_failure\_enabled | Flag to enable Velero backup deletion failure monitor | `string` | `"true"` | no |
| velero\_backup\_deletion\_failure\_extra\_tags | Extra tags for Velero backup deletion failure monitor | `list(string)` | `[]` | no |
| velero\_backup\_deletion\_failure\_monitor\_message | Custom message for Velero backup deletion failure monitor | `string` | `""` | no |
| velero\_backup\_deletion\_failure\_monitor\_timeframe | Monitor timeframe for Velero backup deletion failure monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_1d"` | no |
| velero\_backup\_failure\_enabled | Flag to enable Velero backup failure monitor | `string` | `"true"` | no |
| velero\_backup\_failure\_extra\_tags | Extra tags for Velero backup failure monitor | `list(string)` | `[]` | no |
| velero\_backup\_failure\_monitor\_message | Custom message for Velero backup failure monitor | `string` | `""` | no |
| velero\_backup\_failure\_monitor\_timeframe | Monitor timeframe for Velero backup failure monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_1d"` | no |
| velero\_backup\_partial\_failure\_enabled | Flag to enable Velero backup partial failure monitor | `string` | `"true"` | no |
| velero\_backup\_partial\_failure\_extra\_tags | Extra tags for Velero backup partial failure monitor | `list(string)` | `[]` | no |
| velero\_backup\_partial\_failure\_monitor\_message | Custom message for Velero backup partial failure monitor | `string` | `""` | no |
| velero\_backup\_partial\_failure\_monitor\_timeframe | Monitor timeframe for Velero backup partial failure monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_1d"` | no |
| velero\_scheduled\_backup\_missing\_enabled | Flag to enable Velero scheduled backup missing monitor | `string` | `"true"` | no |
| velero\_scheduled\_backup\_missing\_extra\_tags | Extra tags for Velero scheduled backup missing monitor | `list(string)` | `[]` | no |
| velero\_scheduled\_backup\_missing\_monitor\_message | Custom message for Velero scheduled backup missing monitor | `string` | `""` | no |
| velero\_scheduled\_backup\_missing\_monitor\_no\_data\_timeframe | No data timeframe in minutes | `number` | `2880` | no |
| velero\_scheduled\_backup\_missing\_monitor\_timeframe | Monitor timeframe for Velero scheduled backup missing monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_1d"` | no |
| velero\_volume\_snapshot\_failure\_enabled | Flag to enable Velero volume snapshot failure monitor | `string` | `"true"` | no |
| velero\_volume\_snapshot\_failure\_extra\_tags | Extra tags for Velero volume snapshot failure monitor | `list(string)` | `[]` | no |
| velero\_volume\_snapshot\_failure\_monitor\_message | Custom message for Velero volume snapshot failure monitor | `string` | `""` | no |
| velero\_volume\_snapshot\_failure\_monitor\_timeframe | Monitor timeframe for Velero volume snapshot failure monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_1d"` | no |

## Outputs

| Name | Description |
|------|-------------|
| velero\_backup\_deletion\_failure\_id | id for monitor velero\_backup\_deletion\_failure |
| velero\_backup\_failure\_id | id for monitor velero\_backup\_failure |
| velero\_backup\_partial\_failure\_id | id for monitor velero\_backup\_partial\_failure |
| velero\_scheduled\_backup\_missing\_id | id for monitor velero\_scheduled\_backup\_missing |
| velero\_volume\_snapshot\_failure\_id | id for monitor velero\_volume\_snapshot\_failure |

## Related documentation

Documentation for Datadog prometheus intergration: https://docs.datadoghq.com/integrations/prometheus/
Documentation for Datadog OpenMetrics integration: https://docs.datadoghq.com/integrations/openmetrics/
Documentation for Datadog autodiscovery: https://docs.datadoghq.com/agent/autodiscovery/clusterchecks/

### How to configure Datadog agent for these monitors ?
You can configure Datadog agent by autodiscovery pod annotations or by configuration file.

#### Configuration by autodiscovery pod annotations
Add these annotations to Velero pods:

```
podAnnotations: {
  "ad.datadoghq.com/velero.check_names": '["openmetrics"]',
  "ad.datadoghq.com/velero.init_configs": '[{}]',
  "ad.datadoghq.com/velero.instances": '[{"prometheus_url": "http://%%host%%:8085/metrics", "namespace": "velero", "metrics": ["velero*"]}]'
}
```

#### Configuration by configuration file
Example of `openmetrics.d/conf.yaml`:

```
init_config:

instances:

    ## @param prometheus_url - string - required
    ## The URL where your application metrics are exposed by Prometheus.
    #
  - prometheus_url: http://velero.velero.svc.cluster.local:8085/metrics

    ## @param namespace - string - required
    ## The namespace to be prepended to all metrics.
    #
    namespace: "velero"

    ## @param metrics - list of strings - required
    ## List of metrics to be fetched from the prometheus endpoint, if there's a
    ## value it'll be renamed. This list should contain at least one metric
    #
    metrics:
      - velero*
```

### How to monitor multiple schedule witch have different frequencies ?

If you have multiple Velero schedules with different frequencies, you must duplicate the default example module declaration specifying right timeframes and disabling others common monitors.

For instance, for an hourly schedule you can uncomment this block:

```
#module "datadog-monitors-caas-kubernetes-velero" {
#  source                                                    = "claranet/monitors/datadog//caas/kubernetes/velero"
#  version                                                   = "{revision}"
#
#  environment                                               = var.environment
#  message                                                   = module.datadog-message-alerting.alerting-message
#}

#module "datadog-monitors-caas-kubernetes-velero-hourly" {
#  source                                                    = "claranet/monitors/datadog//caas/kubernetes/velero"
#  version                                                   = "{revision}"
#
#  environment                                               = var.environment
#  message                                                   = module.datadog-message-alerting.alerting-message
#
#  velero_scheduled_backup_missing_monitor_timeframe         = "last_1h"
#  velero_scheduled_backup_missing_monitor_no_data_timeframe = 120
#  velero_backup_failure_enabled                             = false
#  velero_backup_partial_failure_enabled                     = false
#  velero_backup_deletion_failure_enabled                    = false
#  velero_volume_snapshot_failure_enabled                    = false
#}
```

