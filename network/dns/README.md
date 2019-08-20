# NETWORK DNS DataDog monitors

## How to use this module

```
module "datadog-monitors-network-dns" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//network/dns?ref={revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- DNS cannot resolve

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cannot\_resolve\_enabled | Flag to enable DNS cannot resolve monitor | string | `"true"` | no |
| cannot\_resolve\_extra\_tags | Extra tags for DNS cannot resolve monitor | list(string) | `[]` | no |
| cannot\_resolve\_last | Parameter 'last' for the service check | string | `"6"` | no |
| cannot\_resolve\_message | Custom message for DNS cannot resolve monitor | string | `""` | no |
| cannot\_resolve\_no\_data\_timeframe | DNS cannot resolve monitor no data timeframe | string | `"10"` | no |
| cannot\_resolve\_threshold\_critical | DNS cannot resolve monitor (warning threshold) | string | `"5"` | no |
| cannot\_resolve\_threshold\_warning | DNS cannot resolve monitor (warning threshold) | string | `"3"` | no |
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
| cannot\_resolve\_id | id for monitor cannot_resolve |

## Related documentation

- [Datadog DNS integration](https://docs.datadoghq.com/integrations/dns_check/)
