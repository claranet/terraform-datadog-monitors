# CLOUD AZURE SERVERFARMS DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-azure-serverfarms" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//cloud/azure/serverfarms?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Serverfarm CPU percentage is too high
- Serverfarm is down
- Serverfarm memory percentage is too high

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cpu\_percentage\_enabled | Flag to enable the serverfarms cpu_percentage monitor | string | `"true"` | no |
| cpu\_percentage\_extra\_tags | Extra tags for serverfarms cpu_percentage monitor | list | `[]` | no |
| cpu\_percentage\_message | Custom message for serverfarm cpu_percentage monitor | string | `""` | no |
| cpu\_percentage\_threshold\_critical | CPU percentage (critical threshold) | string | `"95"` | no |
| cpu\_percentage\_threshold\_warning | CPU percentage (warning threshold) | string | `"90"` | no |
| cpu\_percentage\_time\_aggregator | Monitor aggregator for serverfarms cpu_percentage [available values: min, max or avg] | string | `"min"` | no |
| cpu\_percentage\_timeframe | Monitor timeframe for serverfarms cpu_percentage [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_10m"` | no |
| environment | Architecture environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"900"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| memory\_percentage\_enabled | Flag to enable the serverfarms memory_percentage monitor | string | `"true"` | no |
| memory\_percentage\_extra\_tags | Extra tags for serverfarms memory_percentage monitor | list | `[]` | no |
| memory\_percentage\_message | Custom message for serverfarm memory_percentage monitor | string | `""` | no |
| memory\_percentage\_threshold\_critical | Memory percentage (critical threshold) | string | `"95"` | no |
| memory\_percentage\_threshold\_warning | Memory percentage (warning threshold) | string | `"90"` | no |
| memory\_percentage\_time\_aggregator | Monitor aggregator for serverfarms memory_percentage [available values: min, max or avg] | string | `"min"` | no |
| memory\_percentage\_timeframe | Monitor timeframe for serverfarms memory_percentage [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| message | Message sent when a serverfarms monitor is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | string | `""` | no |
| status\_enabled | Flag to enable the serverfarms status monitor | string | `"true"` | no |
| status\_extra\_tags | Extra tags for serverfarms status monitor | list | `[]` | no |
| status\_message | Custom message for serverfarm status monitor | string | `""` | no |
| status\_time\_aggregator | Monitor aggregator for serverfarms status [available values: min, max or avg] | string | `"min"` | no |
| status\_timeframe | Monitor timeframe for serverfarms status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| cpu\_percentage\_id | id for monitor cpu_percentage |
| memory\_percentage\_id | id for monitor memory_percentage |
| status\_id | id for monitor status |

## Related documentation

