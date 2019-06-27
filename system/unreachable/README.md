# SYSTEM UNREACHABLE DataDog monitors

## How to use this module

```
module "datadog-monitors-system-unreachable" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//system/unreachable?ref={revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Host unreachable

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Architecture Environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"15"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| message | Message sent when an alert is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | string | `""` | no |
| unreachable\_enabled | Flag to enable Host unreachable monitor | string | `"true"` | no |
| unreachable\_extra\_tags | Extra tags for Host unreachable monitor | list(string) | `[]` | no |
| unreachable\_message | Custom message for Host unreachable monitor | string | `""` | no |
| unreachable\_no\_data\_timeframe | Timeframe for Host unreachable monitor to alert on no data | string | `"20"` | no |

## Outputs

| Name | Description |
|------|-------------|
| host\_unreachable\_id | id for monitor host_unreachable |

## Related documentation

