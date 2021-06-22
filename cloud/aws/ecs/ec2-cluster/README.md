# CLOUD AWS ECS EC2-CLUSTER DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-ecs-ec2-cluster" {
  source      = "claranet/monitors/datadog//cloud/aws/ecs/ec2-cluster"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- ECS Agent disconnected
- ECS Cluster CPU Utilization High (disabled by default)
- ECS Cluster Memory Reservation High (disabled by default)

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.31 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| agent\_status\_enabled | Flag to enable Agent Status monitor | `string` | `"true"` | no |
| agent\_status\_extra\_tags | Extra tags for Agent Status monitor | `list(string)` | `[]` | no |
| agent\_status\_message | Custom message for the Agent Status monitor | `string` | `""` | no |
| agent\_status\_no\_data\_timeframe | Agent status does not respond monitor no data timeframe | `string` | `10` | no |
| agent\_status\_threshold\_warning | Warning threshold for the Agent Status monitor | `string` | `3` | no |
| cluster\_cpu\_utilization\_enabled | Flag to enable Cluster CPU utilization monitor | `string` | `"false"` | no |
| cluster\_cpu\_utilization\_extra\_tags | Extra tags for Cluster CPU utilization monitor | `list(string)` | `[]` | no |
| cluster\_cpu\_utilization\_message | Custom message for the Cluster CPU Utilization monitor | `string` | `""` | no |
| cluster\_cpu\_utilization\_threshold\_critical | Critical threshold for the Cluster CPU Utilization monitor | `string` | `90` | no |
| cluster\_cpu\_utilization\_threshold\_warning | Warning threshold for the Cluster CPU Utilization monitor | `string` | `85` | no |
| cluster\_cpu\_utilization\_time\_aggregator | Monitor aggregator for Cluster CPU Utilization [available values: min, max or avg] | `string` | `"min"` | no |
| cluster\_cpu\_utilization\_timeframe | Timeframe for the Cluster CPU Utilization monitor | `string` | `"last_5m"` | no |
| cluster\_memory\_reservation\_enabled | Flag to enable Cluster memory reservation monitor | `string` | `"false"` | no |
| cluster\_memory\_reservation\_extra\_tags | Extra tags for Cluster Memory Reservation monitor | `list(string)` | `[]` | no |
| cluster\_memory\_reservation\_message | Custom message for the Cluster Memory Reservation monitor | `string` | `""` | no |
| cluster\_memory\_reservation\_threshold\_critical | Critical threshold for the Cluster Memory Reservation monitor | `string` | `90` | no |
| cluster\_memory\_reservation\_threshold\_warning | Warning threshold for the Cluster Memory Reservation monitor | `string` | `85` | no |
| cluster\_memory\_reservation\_time\_aggregator | Monitor aggregator for Cluster Memory Reservation [available values: min, max or avg] | `string` | `"min"` | no |
| cluster\_memory\_reservation\_timeframe | Timeframe for the Cluster Memory Reservation monitor | `string` | `"last_5m"` | no |
| environment | Architecture environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `900` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| message | Message sent when a monitor is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| cluster\_cpu\_utilization\_id | id for monitor cluster\_cpu\_utilization |
| cluster\_memory\_reservation\_id | id for monitor cluster\_memory\_reservation |
| ecs\_agent\_status\_id | id for monitor ecs\_agent\_status |

## Related documentation

