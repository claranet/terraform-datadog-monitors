# CLOUD AWS ECS FARGATE DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-ecs-fargate" {
  source      = "claranet/monitors/datadog//cloud/aws/ecs/fargate"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Fargate CPU Utilization High (disabled by default)
- Fargate memory Utilization High (disabled by default)
- Fargate service does not respond.

## Requirements

No requirements.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cpu\_utilization\_enabled | Flag to enable monitor | `string` | `"false"` | no |
| cpu\_utilization\_extra\_tags | Extra tags for the monitor | `list(string)` | `[]` | no |
| cpu\_utilization\_message | Custom message for the monitor | `string` | `""` | no |
| cpu\_utilization\_threshold\_critical | Critical threshold for the monitor | `string` | `90` | no |
| cpu\_utilization\_threshold\_warning | Warning threshold for the monitor | `string` | `85` | no |
| cpu\_utilization\_time\_aggregator | Monitor aggregator (min, max or avg) | `string` | `"min"` | no |
| cpu\_utilization\_timeframe | Timeframe for the monitor | `string` | `"last_5m"` | no |
| environment | Architecture environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `15` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `bool` | `true` | no |
| memory\_utilization\_enabled | Flag to enable Fargate Memory utilization monitor | `string` | `"false"` | no |
| memory\_utilization\_extra\_tags | Extra tags for Fargate Memory utilization monitor | `list(string)` | `[]` | no |
| memory\_utilization\_message | Custom message for the Fargate Memory Utilization monitor | `string` | `""` | no |
| memory\_utilization\_threshold\_critical | Critical threshold for the Fargate Memory Utilization monitor | `string` | `90` | no |
| memory\_utilization\_threshold\_warning | Warning threshold for the Fargate Memory Utilization monitor | `string` | `85` | no |
| memory\_utilization\_time\_aggregator | Monitor aggregator for Fargate Memory Utilization [available values: min, max or avg] | `string` | `"min"` | no |
| memory\_utilization\_timeframe | Timeframe for the Fargate Memory Utilization monitor | `string` | `"last_5m"` | no |
| message | Message sent when a monitor is triggered | `string` | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| service\_check\_enabled | Flag to enable monitor | `bool` | `true` | no |
| service\_check\_extra\_tags | Extra tags for the monitor | `list(string)` | `[]` | no |
| service\_check\_message | Custom message for the monitor | `string` | `""` | no |
| service\_check\_no\_data\_timeframe | No data timeframe in minutes | `number` | `10` | no |
| service\_check\_threshold\_warning | Warning threshold | `number` | `3` | no |

## Outputs

| Name | Description |
|------|-------------|
| cpu\_utilization\_id | id for monitor cpu\_utilization |
| memory\_utilization\_id | id for monitor memory\_utilization |
| service\_check\_id | id for monitor service\_check |

## Related documentation

[Official DataDog documentation on ECS Fargate](https://docs.datadoghq.com/integrations/ecs_fargate/)

### Specific configuration due to agent limitations

CPU & memory monitors will be usable only when deploying datadog agent as a sidecar in task definitions.

In order to avoid clutter on monitors, datadog agent & ECS internal containers are always excluded from filtering to be on par with Kubernetes way of work. A bug is [currently opened](https://github.com/DataDog/datadog-agent/issues/2722) on agent repository on this matter.
