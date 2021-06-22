# SAAS NEW-RELIC DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-saas-new-relic" {
  source      = "claranet/monitors/datadog//saas/new-relic"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- New Relic Apdex score ratio
- New Relic Error rate

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.31 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| app\_apdex\_score\_enabled | Flag to enable APP Apdex Score monitor | `string` | `"true"` | no |
| app\_apdex\_score\_extra\_tags | Extra tags for New Relic APP Apdex Score monitor | `list(string)` | `[]` | no |
| app\_apdex\_score\_message | Custom message for the APP Apdex Score monitor | `string` | `""` | no |
| app\_apdex\_score\_threshold\_critical | APP Apdex Score critical threshold | `string` | `0.25` | no |
| app\_apdex\_score\_threshold\_warning | APP Apdex Score warning threshold | `string` | `0.5` | no |
| app\_apdex\_score\_time\_aggregator | Time aggregator for the APP Apdex Score monitor | `string` | `"avg"` | no |
| app\_apdex\_score\_timeframe | Timeframe for the APP Apdex Score monitor | `string` | `"last_15m"` | no |
| app\_error\_rate\_enabled | Flag to enable APP Error Rate monitor | `string` | `"true"` | no |
| app\_error\_rate\_extra\_tags | Extra tags for New Relic APP Error Rate monitor | `list(string)` | `[]` | no |
| app\_error\_rate\_message | Custom message for the APP Error Rate monitor | `string` | `""` | no |
| app\_error\_rate\_threshold\_critical | APP Error Rate  critical threshold | `string` | `5` | no |
| app\_error\_rate\_threshold\_warning | APP Error Rate warning threshold | `string` | `1` | no |
| app\_error\_rate\_time\_aggregator | Time aggregator for the APP Error Rate monitor | `string` | `"min"` | no |
| app\_error\_rate\_timeframe | Timeframe for the APP Error Rate monitor | `string` | `"last_5m"` | no |
| environment | Architecture Environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `900` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| message | Message sent when an alert is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| app\_apdex\_score\_id | id for monitor app\_apdex\_score |
| app\_error\_rate\_id | id for monitor app\_error\_rate |

## Related documentation

* [Datadog New Relic integration](https://docs.datadoghq.com/integrations/new_relic/)


