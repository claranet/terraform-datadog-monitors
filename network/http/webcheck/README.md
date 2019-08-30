# NETWORK HTTP WEBCHECK DataDog monitors

## How to use this module

```
module "datadog-monitors-network-http-webcheck" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//network/http/webcheck?ref={revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- HTTP cannot connect

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cannot\_connect\_enabled | Flag to enable HTTP cannot connect monitor | string | `"true"` | no |
| cannot\_connect\_extra\_tags | Extra tags for HTTP cannot connect monitor | list(string) | `[]` | no |
| cannot\_connect\_last | Parameter 'last' for the service check | string | `"6"` | no |
| cannot\_connect\_message | Custom message for HTTP cannot connect monitor | string | `""` | no |
| cannot\_connect\_no\_data\_timeframe | HTTP cannot connect monitor no data timeframe | string | `"10"` | no |
| cannot\_connect\_threshold\_critical | HTTP cannot connect monitor (warning threshold) | string | `"3"` | no |
| cannot\_connect\_threshold\_ok | HTTP cannot connect monitor (ok threshold) | string | `"3"` | no |
| cannot\_connect\_threshold\_warning | HTTP cannot connect monitor (warning threshold) | string | `"2"` | no |
| environment | Architecture Environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"15"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| message | Message sent when an alert is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| cannot\_connect\_id | id for monitor cannot_connect |

## Related documentation

