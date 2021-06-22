# CLOUD AZURE IOTHUBS DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-iothubs" {
  source      = "claranet/monitors/datadog//cloud/azure/iothubs"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- IOT Hub is down
- IOT Hub Too many c2d methods failure
- IOT Hub Too many c2d twin read failure
- IOT Hub Too many c2d twin update failure
- IOT Hub Too many d2c telemetry egress dropped
- IOT Hub Too many d2c telemetry egress invalid
- IOT Hub Too many d2c telemetry egress orphaned
- IOT Hub Too many d2c telemetry ingress not sent
- IOT Hub Too many d2c twin read failure
- IOT Hub Too many d2c twin update failure
- IOT Hub Too many jobs failed
- IOT Hub Too many list_jobs failure
- IOT Hub Too many query_jobs failed
- IOT Hub Total devices is wrong

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.31 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| dropped\_d2c\_telemetry\_egress\_enabled | Flag to enable IoT Hub dropped d2c telemetry monitor | `string` | `"true"` | no |
| dropped\_d2c\_telemetry\_egress\_extra\_tags | Extra tags for IoT Hub dropped d2c telemetry monitor | `list(string)` | `[]` | no |
| dropped\_d2c\_telemetry\_egress\_message | Custom message for IoT Hub dropped d2c telemetry monitor | `string` | `""` | no |
| dropped\_d2c\_telemetry\_egress\_rate\_threshold\_critical | D2C Telemetry Dropped limit (critical threshold) | `number` | `90` | no |
| dropped\_d2c\_telemetry\_egress\_rate\_threshold\_warning | D2C Telemetry Dropped limit (warning threshold) | `number` | `50` | no |
| dropped\_d2c\_telemetry\_egress\_time\_aggregator | Monitor aggregator for IoT Hub dropped d2c telemetry [available values: min, max, sum or avg] | `string` | `"min"` | no |
| dropped\_d2c\_telemetry\_egress\_timeframe | Monitor timeframe for IoT Hub dropped d2c telemetry [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| environment | Architecture Environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `900` | no |
| failed\_c2d\_methods\_rate\_enabled | Flag to enable IoT Hub failed c2d methods monitor | `string` | `"true"` | no |
| failed\_c2d\_methods\_rate\_extra\_tags | Extra tags for IoT Hub failed c2d methods monitor | `list(string)` | `[]` | no |
| failed\_c2d\_methods\_rate\_message | Custom message for IoT Hub failed c2d method monitor | `string` | `""` | no |
| failed\_c2d\_methods\_rate\_threshold\_critical | C2D Methods Failed rate limit (critical threshold) | `number` | `90` | no |
| failed\_c2d\_methods\_rate\_threshold\_warning | C2D Methods Failed rate limit (warning threshold) | `number` | `50` | no |
| failed\_c2d\_methods\_rate\_time\_aggregator | Monitor aggregator for IoT Hub failed c2d method [available values: min, max, sum or avg] | `string` | `"min"` | no |
| failed\_c2d\_methods\_rate\_timeframe | Monitor timeframe for IoT Hub failed c2d method [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| failed\_c2d\_twin\_read\_rate\_enabled | Flag to enable IoT Hub failed c2d twin read monitor | `string` | `"true"` | no |
| failed\_c2d\_twin\_read\_rate\_extra\_tags | Extra tags for IoT Hub failed c2d twin read monitor | `list(string)` | `[]` | no |
| failed\_c2d\_twin\_read\_rate\_message | Custom message for IoT Hub failed c2d twin read monitor | `string` | `""` | no |
| failed\_c2d\_twin\_read\_rate\_threshold\_critical | C2D Twin Read Failed rate limit (critical threshold) | `number` | `90` | no |
| failed\_c2d\_twin\_read\_rate\_threshold\_warning | C2D Twin Read Failed rate limit (warning threshold) | `number` | `50` | no |
| failed\_c2d\_twin\_read\_rate\_time\_aggregator | Monitor aggregator for IoT Hub failed c2d twin read [available values: min, max, sum or avg] | `string` | `"min"` | no |
| failed\_c2d\_twin\_read\_rate\_timeframe | Monitor timeframe for IoT Hub failed c2d twin read [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| failed\_c2d\_twin\_update\_rate\_enabled | Flag to enable IoT Hub failed c2d twin update monitor | `string` | `"true"` | no |
| failed\_c2d\_twin\_update\_rate\_extra\_tags | Extra tags for IoT Hub failed c2d twin update monitor | `list(string)` | `[]` | no |
| failed\_c2d\_twin\_update\_rate\_message | Custom message for IoT Hub failed c2d twin update monitor | `string` | `""` | no |
| failed\_c2d\_twin\_update\_rate\_threshold\_critical | C2D Twin Update Failed rate limit (critical threshold) | `number` | `90` | no |
| failed\_c2d\_twin\_update\_rate\_threshold\_warning | C2D Twin Update Failed rate limit (warning threshold) | `number` | `50` | no |
| failed\_c2d\_twin\_update\_rate\_time\_aggregator | Monitor aggregator for IoT Hub failed c2d twin update [available values: min, max, sum or avg] | `string` | `"min"` | no |
| failed\_c2d\_twin\_update\_rate\_timeframe | Monitor timeframe for IoT Hub failed c2d twin update [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| failed\_d2c\_twin\_read\_rate\_enabled | Flag to enable IoT Hub failed d2c twin read monitor | `string` | `"true"` | no |
| failed\_d2c\_twin\_read\_rate\_extra\_tags | Extra tags for IoT Hub failed d2c twin read monitor | `list(string)` | `[]` | no |
| failed\_d2c\_twin\_read\_rate\_message | Custom message for IoT Hub failed d2c twin read monitor | `string` | `""` | no |
| failed\_d2c\_twin\_read\_rate\_threshold\_critical | D2C Twin Read Failed rate limit (critical threshold) | `number` | `90` | no |
| failed\_d2c\_twin\_read\_rate\_threshold\_warning | D2C Twin Read Failed rate limit (warning threshold) | `number` | `50` | no |
| failed\_d2c\_twin\_read\_rate\_time\_aggregator | Monitor aggregator for IoT Hub failed d2c twin read [available values: min, max, sum or avg] | `string` | `"min"` | no |
| failed\_d2c\_twin\_read\_rate\_timeframe | Monitor timeframe for IoT Hub failed d2c twin read [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| failed\_d2c\_twin\_update\_rate\_enabled | Flag to enable IoT Hub failed d2c twin update monitor | `string` | `"true"` | no |
| failed\_d2c\_twin\_update\_rate\_extra\_tags | Extra tags for IoT Hub failed d2c twin update monitor | `list(string)` | `[]` | no |
| failed\_d2c\_twin\_update\_rate\_message | Custom message for IoT Hub failed d2c twin update monitor | `string` | `""` | no |
| failed\_d2c\_twin\_update\_rate\_threshold\_critical | D2C Twin Update Failed rate limit (critical threshold) | `number` | `90` | no |
| failed\_d2c\_twin\_update\_rate\_threshold\_warning | D2C Twin Update Failed rate limit (warning threshold) | `number` | `50` | no |
| failed\_d2c\_twin\_update\_rate\_time\_aggregator | Monitor aggregator for IoT Hub failed d2c twin update [available values: min, max, sum or avg] | `string` | `"min"` | no |
| failed\_d2c\_twin\_update\_rate\_timeframe | Monitor timeframe for IoT Hub failed d2c twin update [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| failed\_jobs\_rate\_enabled | Flag to enable IoT Hub failed jobs monitor | `string` | `"true"` | no |
| failed\_jobs\_rate\_extra\_tags | Extra tags for IoT Hub failed jobs monitor | `list(string)` | `[]` | no |
| failed\_jobs\_rate\_message | Custom message for IoT Hub failed jobs monitor | `string` | `""` | no |
| failed\_jobs\_rate\_threshold\_critical | Jobs Failed rate limit (critical threshold) | `number` | `90` | no |
| failed\_jobs\_rate\_threshold\_warning | Jobs Failed rate limit (warning threshold) | `number` | `50` | no |
| failed\_jobs\_rate\_time\_aggregator | Monitor aggregator for IoT Hub failed jobs [available values: min, max, sum or avg] | `string` | `"min"` | no |
| failed\_jobs\_rate\_timeframe | Monitor timeframe for IoT Hub failed jobs [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| failed\_listjobs\_rate\_enabled | Flag to enable IoT Hub failed list jobs monitor | `string` | `"true"` | no |
| failed\_listjobs\_rate\_extra\_tags | Extra tags for IoT Hub failed list jobs monitor | `list(string)` | `[]` | no |
| failed\_listjobs\_rate\_message | Custom message for IoT Hub failed list jobs monitor | `string` | `""` | no |
| failed\_listjobs\_rate\_threshold\_critical | ListJobs Failed rate limit (critical threshold) | `number` | `90` | no |
| failed\_listjobs\_rate\_threshold\_warning | ListJobs Failed rate limit (warning threshold) | `number` | `50` | no |
| failed\_listjobs\_rate\_time\_aggregator | Monitor aggregator for IoT Hub failed list jobs [available values: min, max, sum or avg] | `string` | `"min"` | no |
| failed\_listjobs\_rate\_timeframe | Monitor timeframe for IoT Hub failed list jobs [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| failed\_queryjobs\_rate\_enabled | Flag to enable IoT Hub failed query jobs monitor | `string` | `"true"` | no |
| failed\_queryjobs\_rate\_extra\_tags | Extra tags for IoT Hub failed query jobs monitor | `list(string)` | `[]` | no |
| failed\_queryjobs\_rate\_message | Custom message for IoT Hub failed query jobs monitor | `string` | `""` | no |
| failed\_queryjobs\_rate\_threshold\_critical | QueryJobs Failed rate limit (critical threshold) | `number` | `90` | no |
| failed\_queryjobs\_rate\_threshold\_warning | QueryJobs Failed rate limit (warning threshold) | `number` | `50` | no |
| failed\_queryjobs\_rate\_time\_aggregator | Monitor aggregator for IoT Hub failed query jobs [available values: min, max, sum or avg] | `string` | `"min"` | no |
| failed\_queryjobs\_rate\_timeframe | Monitor timeframe for IoT Hub failed query jobs [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| invalid\_d2c\_telemetry\_egress\_enabled | Flag to enable IoT Hub invalid d2c telemetry monitor | `string` | `"true"` | no |
| invalid\_d2c\_telemetry\_egress\_extra\_tags | Extra tags for IoT Hub invalid d2c telemetry monitor | `list(string)` | `[]` | no |
| invalid\_d2c\_telemetry\_egress\_message | Custom message for IoT Hub invalid d2c telemetry monitor | `string` | `""` | no |
| invalid\_d2c\_telemetry\_egress\_rate\_threshold\_critical | D2C Telemetry Invalid limit (critical threshold) | `number` | `90` | no |
| invalid\_d2c\_telemetry\_egress\_rate\_threshold\_warning | D2C Telemetry Invalid limit (warning threshold) | `number` | `50` | no |
| invalid\_d2c\_telemetry\_egress\_time\_aggregator | Monitor aggregator for IoT Hub invalid d2c telemetry [available values: min, max, sum or avg] | `string` | `"min"` | no |
| invalid\_d2c\_telemetry\_egress\_timeframe | Monitor timeframe for IoT Hub invalid d2c telemetry [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| message | Message sent when an alert is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| orphaned\_d2c\_telemetry\_egress\_enabled | Flag to enable IoT Hub orphaned d2c telemetry monitor | `string` | `"true"` | no |
| orphaned\_d2c\_telemetry\_egress\_extra\_tags | Extra tags for IoT Hub orphaned d2c telemetry monitor | `list(string)` | `[]` | no |
| orphaned\_d2c\_telemetry\_egress\_message | Custom message for IoT Hub orphaned d2c telemetry monitor | `string` | `""` | no |
| orphaned\_d2c\_telemetry\_egress\_rate\_threshold\_critical | D2C Telemetry Orphaned limit (critical threshold) | `number` | `90` | no |
| orphaned\_d2c\_telemetry\_egress\_rate\_threshold\_warning | D2C Telemetry Orphaned limit (warning threshold) | `number` | `50` | no |
| orphaned\_d2c\_telemetry\_egress\_time\_aggregator | Monitor aggregator for IoT Hub orphaned d2c telemetry [available values: min, max, sum or avg] | `string` | `"min"` | no |
| orphaned\_d2c\_telemetry\_egress\_timeframe | Monitor timeframe for IoT Hub orphaned d2c telemetry [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| status\_enabled | Flag to enable IoT Hub status monitor | `string` | `"true"` | no |
| status\_extra\_tags | Extra tags for IoT Hub status monitor | `list(string)` | `[]` | no |
| status\_message | Custom message for IoT Hub status monitor | `string` | `""` | no |
| status\_no\_data\_timeframe | Number of minutes before reporting no data | `string` | `10` | no |
| status\_time\_aggregator | Monitor aggregator for IoT Hub status [available values: min, max, sum or avg] | `string` | `"max"` | no |
| status\_timeframe | Monitor timeframe for IoT Hub status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| too\_many\_d2c\_telemetry\_ingress\_nosent\_enabled | Flag to enable IoT Hub unsent d2c telemetry monitor | `string` | `"true"` | no |
| too\_many\_d2c\_telemetry\_ingress\_nosent\_extra\_tags | Extra tags for IoT Hub unsent d2c telemetry monitor | `list(string)` | `[]` | no |
| too\_many\_d2c\_telemetry\_ingress\_nosent\_message | Custom message for IoT Hub unsent d2c telemetry monitor | `string` | `""` | no |
| too\_many\_d2c\_telemetry\_ingress\_nosent\_rate\_threshold\_critical | D2C Telemetry ingress not sent limit (critical threshold) | `number` | `20` | no |
| too\_many\_d2c\_telemetry\_ingress\_nosent\_rate\_threshold\_warning | D2C Telemetry ingress not sent limit (warning threshold) | `number` | `10` | no |
| too\_many\_d2c\_telemetry\_ingress\_nosent\_timeframe | Monitor timeframe for IoT Hub unsent d2c telemetry [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| total\_devices\_enabled | Flag to enable IoT Hub total devices monitor | `string` | `"true"` | no |
| total\_devices\_extra\_tags | Extra tags for IoT Hub total devices monitor | `list(string)` | `[]` | no |
| total\_devices\_message | Custom message for IoT Hub total devices monitor | `string` | `""` | no |
| total\_devices\_time\_aggregator | Monitor aggregator for IoT Hub total devices [available values: min, max, sum or avg] | `string` | `"min"` | no |
| total\_devices\_timeframe | Monitor timeframe for IoT Hub total devices [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| status\_id | id for monitor status |
| too\_many\_c2d\_methods\_failed\_id | id for monitor too\_many\_c2d\_methods\_failed |
| too\_many\_c2d\_twin\_read\_failed\_id | id for monitor too\_many\_c2d\_twin\_read\_failed |
| too\_many\_c2d\_twin\_update\_failed\_id | id for monitor too\_many\_c2d\_twin\_update\_failed |
| too\_many\_d2c\_telemetry\_egress\_dropped\_id | id for monitor too\_many\_d2c\_telemetry\_egress\_dropped |
| too\_many\_d2c\_telemetry\_egress\_invalid\_id | id for monitor too\_many\_d2c\_telemetry\_egress\_invalid |
| too\_many\_d2c\_telemetry\_egress\_orphaned\_id | id for monitor too\_many\_d2c\_telemetry\_egress\_orphaned |
| too\_many\_d2c\_telemetry\_ingress\_nosent\_id | id for monitor too\_many\_d2c\_telemetry\_ingress\_nosent |
| too\_many\_d2c\_twin\_read\_failed\_id | id for monitor too\_many\_d2c\_twin\_read\_failed |
| too\_many\_d2c\_twin\_update\_failed\_id | id for monitor too\_many\_d2c\_twin\_update\_failed |
| too\_many\_jobs\_failed\_id | id for monitor too\_many\_jobs\_failed |
| too\_many\_list\_jobs\_failed\_id | id for monitor too\_many\_list\_jobs\_failed |
| too\_many\_query\_jobs\_failed\_id | id for monitor too\_many\_query\_jobs\_failed |
| total\_devices\_id | id for monitor total\_devices |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_iot_hub](https://docs.datadoghq.com/integrations/azure_iot_hub)

Azure IOT Hubs metrics documentation: [https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-monitor-resource-health](https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-monitor-resource-health)
