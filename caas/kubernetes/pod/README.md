# CAAS KUBERNETES POD DataDog monitors

## How to use this module

```
module "datadog-monitors-caas-kubernetes-pod" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//caas/kubernetes/pod?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Kubernetes Pod phase status failed
- Kubernetes Pod waiting errors

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Architecture environment | string | n/a | yes |
| error\_enabled | Flag to enable Pod errors monitor | string | `"true"` | no |
| error\_extra\_tags | Extra tags for Pod errors monitor | list | `[]` | no |
| error\_message | Custom message for Pod errors monitor | string | `""` | no |
| error\_silenced | Groups to mute for Pod errors monitor | map | `{}` | no |
| error\_threshold\_critical | error critical threshold | string | `"0.5"` | no |
| error\_threshold\_warning | error warning threshold | string | `"0"` | no |
| error\_time\_aggregator | Monitor aggregator for Pod errors [available values: min, max or avg] | string | `"min"` | no |
| error\_timeframe | Monitor timeframe for Pod errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_15m"` | no |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"15"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| message | Message sent when a monitor is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |
| pod\_phase\_status\_enabled | Flag to enable Pod phase status monitor | string | `"true"` | no |
| pod\_phase\_status\_extra\_tags | Extra tags for Pod phase status monitor | list | `[]` | no |
| pod\_phase\_status\_message | Custom message for Pod phase status monitor | string | `""` | no |
| pod\_phase\_status\_silenced | Groups to mute for Pod phase status monitor | map | `{}` | no |
| pod\_phase\_status\_time\_aggregator | Monitor aggregator for Pod phase status [available values: min, max or avg] | string | `"max"` | no |
| pod\_phase\_status\_timeframe | Monitor timeframe for Pod phase status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| error\_id | id for monitor error |
| pod\_phase\_status\_id | id for monitor pod_phase_status |

## Related documentation

* [Datadog metrics](https://docs.datadoghq.com/agent/kubernetes/metrics/)
* [Datadog documentation](https://docs.datadoghq.com/integrations/kubernetes/)
* [Datadog Blog](https://www.datadoghq.com/blog/monitor-kubernetes-docker/)
