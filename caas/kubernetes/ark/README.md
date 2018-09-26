# CAAS KUBERNETES ARK DataDog monitors

## How to use this module

```
module "datadog-monitors-caas-kubernetes-ark" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//caas/kubernetes/ark?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Ark backup failed

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| ark_schedules_enabled | Flag to enable Ark schedules monitor | string | `true` | no |
| ark_schedules_extra_tags | Extra tags for Ark schedules monitor | list | `[]` | no |
| ark_schedules_monitor_message | Custom message for Ark schedules monitor | string | `` | no |
| ark_schedules_monitor_no_data_timeframe | No data timeframe in minutes | string | `1440` | no |
| ark_schedules_monitor_silenced | Groups to mute for Ark schedules monitor | map | `{}` | no |
| ark_schedules_monitor_timeframe | Monitor timeframe for Ark schedules monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_1d` | no |
| environment | Architecture environment | string | - | yes |
| evaluation_delay | Delay in seconds for the metric evaluation | string | `15` | no |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when a monitor is triggered | string | - | yes |
| new_host_delay | Delay in seconds before monitor new resource | string | `300` | no |

## Outputs

| Name | Description |
|------|-------------|
| ark_schedules_monitor_id | id for monitor ark_schedules_monitor |

Related documentation
---------------------

DataDog blog: https://www.datadoghq.com/blog/monitor-prometheus-metrics
Heptio Ark minimum release: https://github.com/heptio/ark/releases/tag/v0.9.0

Ark annotations for Datadog
---------------------------
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
