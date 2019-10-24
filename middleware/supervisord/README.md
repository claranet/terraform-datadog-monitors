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

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Architecture environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"900"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| message | Message sent when a monitor is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | string | `""` | no |
| supervisord\_status\_enabled | Flag to enable Agent Status monitor | string | `"true"` | no |
| supervisord\_status\_extra\_tags | Extra tags for Agent Status monitor | list(string) | `[]` | no |
| supervisord\_status\_message | Custom message for the Agent Status monitor | string | `""` | no |
| supervisord\_status\_no\_data\_timeframe | Agent status does not respond monitor no data timeframe | string | `"10"` | no |
| supervisord\_status\_threshold\_warning | Warning threshold for the Agent Status monitor | string | `"3"` | no |

## Outputs

| Name | Description |
|------|-------------|
| supervisord\_status\_id | id for monitor supervisord_status |

## Related documentation

