# MIDDLEWARE SUPERVISORD DataDog monitors

## How to use this module

```
module "datadog-monitors-middleware-supervisord" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//middleware/supervisord?ref={revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- supervisord vhost status does not respond

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
| supervisord\_connect\_enabled | Flag to enable supervisord status monitor | string | `"true"` | no |
| supervisord\_connect\_extra\_tags | Extra tags for supervisord process monitor | list(string) | `[]` | no |
| supervisord\_connect\_message | Custom message for supervisord status monitor | string | `""` | no |
| supervisord\_connect\_threshold\_warning | supervisord status monitor (warning threshold) | string | `"3"` | no |

## Outputs

| Name | Description |
|------|-------------|
| datadog\_supervisord\_process\_id | id for monitor datadog_supervisord_process |

## Related documentation

