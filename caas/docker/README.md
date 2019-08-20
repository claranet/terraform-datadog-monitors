# CAAS DOCKER DataDog monitors

## How to use this module

```
module "datadog-monitors-caas-docker" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//caas/docker?ref={revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Docker Container Memory Used (disabled by default)
- Service Docker does not respond

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Architecture Environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"15"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| memory\_used\_enabled | Flag to enable Container Memory Usage monitor | string | `"false"` | no |
| memory\_used\_extra\_tags | Extra tags for Container Memory Usage monitor | list(string) | `[]` | no |
| memory\_used\_message | Custom message for the Container Memory Usage monitor | string | `""` | no |
| memory\_used\_threshold\_critical | Container Memory Usage critical threshold | string | `"90"` | no |
| memory\_used\_threshold\_warning | Container Memory Usage warning threshold | string | `"80"` | no |
| memory\_used\_time\_aggregator | Time aggregator for the Container Memory Usage monitor | string | `"min"` | no |
| memory\_used\_timeframe | Timeframe for the Container Memory Usage monitor | string | `"last_5m"` | no |
| message | Message sent when an alert is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |
| not\_responding\_enabled | Flag to enable Docker does not respond monitor | string | `"true"` | no |
| not\_responding\_extra\_tags | Extra tags for Docker does not respond monitor | list(string) | `[]` | no |
| not\_responding\_last | Parameter 'last' for the service check | string | `"6"` | no |
| not\_responding\_message | Custom message for Docker does not respond monitor | string | `""` | no |
| not\_responding\_no\_data\_timeframe | Docker does not respond monitor no data timeframe | string | `"10"` | no |
| not\_responding\_threshold\_critical | Docker does not respond monitor (warning threshold) | string | `"5"` | no |
| not\_responding\_threshold\_warning | Docker does not respond monitor (warning threshold) | string | `"3"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| memory\_used\_id | id for monitor memory_used |
| not\_responding\_id | id for monitor not_responding |

## Related documentation

* [Datadog Docker integration](https://docs.datadoghq.com/integrations/docker_daemon/)
