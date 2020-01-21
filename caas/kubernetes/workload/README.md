# CAAS KUBERNETES WORKLOAD DataDog monitors

## How to use this module

```
module "datadog-monitors-caas-kubernetes-workload" {
  source = "claranet/monitors/datadog//caas/kubernetes/workload"
  version = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Kubernetes Available replicas
- Kubernetes cronjob scheduling failed
- Kubernetes Current replicas
- Kubernetes job failed
- Kubernetes Ready replicas

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| cronjob\_enabled | Flag to enable Cronjob monitor | `string` | `"true"` | no |
| cronjob\_extra\_tags | Extra tags for Cronjob monitor | `list(string)` | `[]` | no |
| cronjob\_message | Custom message for Cronjob monitor | `string` | `""` | no |
| cronjob\_threshold\_warning | Cronjob monitor (warning threshold) | `string` | `3` | no |
| environment | Architecture environment | `any` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `15` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| job\_enabled | Flag to enable Job monitor | `string` | `"true"` | no |
| job\_extra\_tags | Extra tags for Job monitor | `list(string)` | `[]` | no |
| job\_message | Custom message for Job monitor | `string` | `""` | no |
| job\_threshold\_warning | Job monitor (warning threshold) | `string` | `3` | no |
| message | Message sent when a monitor is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| replica\_available\_enabled | Flag to enable Available replica monitor | `string` | `"true"` | no |
| replica\_available\_extra\_tags | Extra tags for Available replicamonitor | `list(string)` | `[]` | no |
| replica\_available\_message | Custom message for Available replica monitor | `string` | `""` | no |
| replica\_available\_threshold\_critical | Available replica critical threshold | `number` | `1` | no |
| replica\_available\_time\_aggregator | Monitor aggregator for Available replica [available values: min, max or avg] | `string` | `"max"` | no |
| replica\_available\_timeframe | Monitor timeframe for Available replica [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| replica\_current\_enabled | Flag to enable Current replica monitor | `string` | `"true"` | no |
| replica\_current\_extra\_tags | Extra tags for Current replica monitor | `list(string)` | `[]` | no |
| replica\_current\_message | Custom message for Current replica monitor | `string` | `""` | no |
| replica\_current\_threshold\_critical | Current replica critical threshold | `number` | `1` | no |
| replica\_current\_time\_aggregator | Monitor aggregator for Current replica [available values: min, max or avg] | `string` | `"max"` | no |
| replica\_current\_timeframe | Monitor timeframe for Current replica [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| replica\_ready\_enabled | Flag to enable Ready replica monitor | `string` | `"true"` | no |
| replica\_ready\_extra\_tags | Extra tags for Ready replica monitor | `list(string)` | `[]` | no |
| replica\_ready\_message | Custom message for Ready replica monitor | `string` | `""` | no |
| replica\_ready\_threshold\_critical | Ready replica critical threshold | `number` | `1` | no |
| replica\_ready\_time\_aggregator | Monitor aggregator for Ready replica [available values: min, max or avg] | `string` | `"max"` | no |
| replica\_ready\_timeframe | Monitor timeframe for Ready replica [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| cronjob\_id | id for monitor cronjob |
| job\_id | id for monitor job |
| replica\_available\_id | id for monitor replica\_available |
| replica\_current\_id | id for monitor replica\_current |
| replica\_ready\_id | id for monitor replica\_ready |

## Related documentation

* [Datadog metrics](https://docs.datadoghq.com/agent/kubernetes/metrics/)
* [Datadog documentation](https://docs.datadoghq.com/integrations/kubernetes/)
* [Datadog Blog](https://www.datadoghq.com/blog/monitor-kubernetes-docker/)

## Requirements

* Datadog Agent > v6.6
