# CAAS KUBERNETES POD DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-caas-kubernetes-pod" {
  source      = "claranet/monitors/datadog//caas/kubernetes/pod"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Kubernetes Pod phase status failed
- Kubernetes Pod terminated abnormally
- Kubernetes Pod waiting errors

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.31 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | Architecture environment | `any` | n/a | yes |
| error\_enabled | Flag to enable Pod errors monitor | `string` | `"true"` | no |
| error\_extra\_tags | Extra tags for Pod errors monitor | `list(string)` | `[]` | no |
| error\_message | Custom message for Pod errors monitor | `string` | `""` | no |
| error\_threshold\_critical | error critical threshold | `number` | `0.5` | no |
| error\_threshold\_warning | error warning threshold | `number` | `0` | no |
| error\_time\_aggregator | Monitor aggregator for Pod errors [available values: min, max or avg] | `string` | `"min"` | no |
| error\_timeframe | Monitor timeframe for Pod errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `15` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| message | Message sent when a monitor is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| pod\_phase\_status\_enabled | Flag to enable Pod phase status monitor | `string` | `"true"` | no |
| pod\_phase\_status\_extra\_tags | Extra tags for Pod phase status monitor | `list(string)` | `[]` | no |
| pod\_phase\_status\_message | Custom message for Pod phase status monitor | `string` | `""` | no |
| pod\_phase\_status\_time\_aggregator | Monitor aggregator for Pod phase status [available values: min, max or avg] | `string` | `"max"` | no |
| pod\_phase\_status\_timeframe | Monitor timeframe for Pod phase status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| terminated\_enabled | Flag to enable Pod terminated monitor | `string` | `"true"` | no |
| terminated\_extra\_tags | Extra tags for Pod terminated monitor | `list(string)` | `[]` | no |
| terminated\_message | Custom message for Pod terminated monitor | `string` | `""` | no |
| terminated\_threshold\_critical | terminated critical threshold | `number` | `0.5` | no |
| terminated\_threshold\_warning | terminated warning threshold | `number` | `0` | no |
| terminated\_time\_aggregator | Monitor aggregator for Pod terminated [available values: min, max or avg] | `string` | `"sum"` | no |
| terminated\_timeframe | Monitor timeframe for Pod terminated [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_10m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| error\_id | id for monitor error |
| pod\_phase\_status\_id | id for monitor pod\_phase\_status |
| terminated\_id | id for monitor terminated |

## Related documentation

* [Datadog metrics](https://docs.datadoghq.com/agent/kubernetes/metrics/)
* [Datadog documentation](https://docs.datadoghq.com/integrations/kubernetes/)
* [Datadog Blog](https://www.datadoghq.com/blog/monitor-kubernetes-docker/)

## Requirements

* Datadog Agent > v7.2
