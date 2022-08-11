# CAAS KUBERNETES ARK DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-caas-kubernetes-ark" {
  source      = "claranet/monitors/datadog//caas/kubernetes/ark"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Ark backup failed

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
| <a name="module_monitor-tags"></a> [monitor-tags](#module\_monitor-tags) | ../../../common/monitor-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.ark_schedules_monitor](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ark_schedules_enabled"></a> [ark\_schedules\_enabled](#input\_ark\_schedules\_enabled) | Flag to enable Ark schedules monitor | `string` | `"true"` | no |
| <a name="input_ark_schedules_extra_tags"></a> [ark\_schedules\_extra\_tags](#input\_ark\_schedules\_extra\_tags) | Extra tags for Ark schedules monitor | `list(string)` | `[]` | no |
| <a name="input_ark_schedules_monitor_message"></a> [ark\_schedules\_monitor\_message](#input\_ark\_schedules\_monitor\_message) | Custom message for Ark schedules monitor | `string` | `""` | no |
| <a name="input_ark_schedules_monitor_no_data_timeframe"></a> [ark\_schedules\_monitor\_no\_data\_timeframe](#input\_ark\_schedules\_monitor\_no\_data\_timeframe) | No data timeframe in minutes | `number` | `2880` | no |
| <a name="input_ark_schedules_monitor_timeframe"></a> [ark\_schedules\_monitor\_timeframe](#input\_ark\_schedules\_monitor\_timeframe) | Monitor timeframe for Ark schedules monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_1d"` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | Default list of tags that will be associate to all monitor | `list(string)` | <pre>[<br>  "type:caas",<br>  "provider:prometheus",<br>  "resource:ark"<br>]</pre> | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture environment | `any` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `15` | no |
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | Extra optional list of tags to associate to all monitor | `list(string)` | <pre>[<br>  "team:claranet"<br>]</pre> | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a monitor is triggered | `any` | n/a | yes |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ark_schedules_monitor_id"></a> [ark\_schedules\_monitor\_id](#output\_ark\_schedules\_monitor\_id) | id for monitor ark\_schedules\_monitor |
## Related documentation

DataDog blog: https://www.datadoghq.com/blog/monitor-prometheus-metrics
Heptio Ark minimum release: https://github.com/heptio/ark/releases/tag/v0.9.0

## Ark annotations for Datadog

```
apiVersion: apps/v1beta1
kind: Deployment
metadata:
  namespace: heptio-ark
  name: ark
spec:
  replicas: 1
  template:
    metadata:
      labels:
        component: ark
      annotations:
        prometheus.io/scrape: "true"
        prometheus.io/port: "8085"
        prometheus.io/path: "/metrics"
        ad.datadoghq.com/ark.check_names: |-
          ["prometheus"]
        ad.datadoghq.com/ark.init_configs: |-
          [{}]
        ad.datadoghq.com/ark.instances: |-
          [
            {
              "prometheus_url": "http://%%host%%:8085/metrics",
              "namespace": "ark",
              "metrics": ["ark_backup_*"],
              "tags": ["dd_monitoring:enabled","dd_ark:enabled","env:prod"]
            }
          ]
```
