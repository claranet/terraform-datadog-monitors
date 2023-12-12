# CLOUD AWS BEANSTALK DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-beanstalk" {
  source      = "claranet/monitors/datadog//cloud/aws/beanstalk"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Beanstalk Application 5xx error rate
- Beanstalk Application latency p90
- Beanstalk Environment health
- Beanstalk Instance root file system usage

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.31 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | >= 3.1.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | >= 3.1.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_filter-tags"></a> [filter-tags](#module\_filter-tags) | ../../../common/filter-tags | n/a |
| <a name="module_filter-tags-no-host"></a> [filter-tags-no-host](#module\_filter-tags-no-host) | ../../../common/filter-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.application_5xx_error_rate](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.application_latency_p90](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.health](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.root_filesystem_usage](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_5xx_error_rate_enabled"></a> [application\_5xx\_error\_rate\_enabled](#input\_application\_5xx\_error\_rate\_enabled) | Flag to enable Beanstalk application 5xx error ratemonitor | `string` | `"true"` | no |
| <a name="input_application_5xx_error_rate_extra_tags"></a> [application\_5xx\_error\_rate\_extra\_tags](#input\_application\_5xx\_error\_rate\_extra\_tags) | Extra tags for application 5xx error rate monitor | `list(string)` | `[]` | no |
| <a name="input_application_5xx_error_rate_message"></a> [application\_5xx\_error\_rate\_message](#input\_application\_5xx\_error\_rate\_message) | Custom message for application 5xx error rate | `string` | `""` | no |
| <a name="input_application_5xx_error_rate_threshold_critical"></a> [application\_5xx\_error\_rate\_threshold\_critical](#input\_application\_5xx\_error\_rate\_threshold\_critical) | 5xx Error rate critical threshold in percent | `number` | `5` | no |
| <a name="input_application_5xx_error_rate_threshold_warning"></a> [application\_5xx\_error\_rate\_threshold\_warning](#input\_application\_5xx\_error\_rate\_threshold\_warning) | 5xx Error rate warning threshold in percent | `string` | `3` | no |
| <a name="input_application_5xx_error_rate_time_aggregator"></a> [application\_5xx\_error\_rate\_time\_aggregator](#input\_application\_5xx\_error\_rate\_time\_aggregator) | Monitor aggregator for beanstalk application 5xx error rate [available values: min, max or avg] | `string` | `"sum"` | no |
| <a name="input_application_5xx_error_rate_timeframe"></a> [application\_5xx\_error\_rate\_timeframe](#input\_application\_5xx\_error\_rate\_timeframe) | Monitor timeframe for beanstalk application 5xx error rate [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_application_latency_p90_enabled"></a> [application\_latency\_p90\_enabled](#input\_application\_latency\_p90\_enabled) | Flag to enable Beanstalk application latency P90 monitor | `string` | `"true"` | no |
| <a name="input_application_latency_p90_extra_tags"></a> [application\_latency\_p90\_extra\_tags](#input\_application\_latency\_p90\_extra\_tags) | Extra tags for application latency P90 monitor | `list(string)` | `[]` | no |
| <a name="input_application_latency_p90_message"></a> [application\_latency\_p90\_message](#input\_application\_latency\_p90\_message) | Custom message for application latency P90 monitor | `string` | `""` | no |
| <a name="input_application_latency_p90_threshold_critical"></a> [application\_latency\_p90\_threshold\_critical](#input\_application\_latency\_p90\_threshold\_critical) | P90 Latency critical threshold in seconds | `number` | `0.5` | no |
| <a name="input_application_latency_p90_threshold_warning"></a> [application\_latency\_p90\_threshold\_warning](#input\_application\_latency\_p90\_threshold\_warning) | P90 Latency warning threshold in seconds | `string` | `0.3` | no |
| <a name="input_application_latency_p90_time_aggregator"></a> [application\_latency\_p90\_time\_aggregator](#input\_application\_latency\_p90\_time\_aggregator) | Monitor aggregator for beanstalk application latency P90 [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_application_latency_p90_timeframe"></a> [application\_latency\_p90\_timeframe](#input\_application\_latency\_p90\_timeframe) | Monitor timeframe for beanstalk application latency P90 [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture Environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_health_enabled"></a> [health\_enabled](#input\_health\_enabled) | Flag to enable Beanstalk Health monitor | `string` | `"true"` | no |
| <a name="input_health_extra_tags"></a> [health\_extra\_tags](#input\_health\_extra\_tags) | Extra tags for health monitor | `list(string)` | `[]` | no |
| <a name="input_health_message"></a> [health\_message](#input\_health\_message) | Custom message for health monitor | `string` | `""` | no |
| <a name="input_health_no_data_timeframe"></a> [health\_no\_data\_timeframe](#input\_health\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `20` | no |
| <a name="input_health_threshold_critical"></a> [health\_threshold\_critical](#input\_health\_threshold\_critical) | Health critical threshold (see the `aws.elasticbeanstalk.environment_health` values in the Datadog documentation) | `number` | `20` | no |
| <a name="input_health_threshold_warning"></a> [health\_threshold\_warning](#input\_health\_threshold\_warning) | Health critical threshold (see the `aws.elasticbeanstalk.environment_health` values in the Datadog documentation) | `number` | `15` | no |
| <a name="input_health_time_aggregator"></a> [health\_time\_aggregator](#input\_health\_time\_aggregator) | Monitor aggregator for beanstalk health [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_health_timeframe"></a> [health\_timeframe](#input\_health\_timeframe) | Monitor timeframe for beanstalk health [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_10m"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when an alert is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_root_filesystem_usage_aggregator"></a> [root\_filesystem\_usage\_aggregator](#input\_root\_filesystem\_usage\_aggregator) | Monitor aggregator for beanstalk instance file system usage [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_root_filesystem_usage_enabled"></a> [root\_filesystem\_usage\_enabled](#input\_root\_filesystem\_usage\_enabled) | Flag to enable Beanstalk instance file system usage monitor | `string` | `"true"` | no |
| <a name="input_root_filesystem_usage_extra_tags"></a> [root\_filesystem\_usage\_extra\_tags](#input\_root\_filesystem\_usage\_extra\_tags) | Extra tags for file system usage monitor | `list(string)` | `[]` | no |
| <a name="input_root_filesystem_usage_message"></a> [root\_filesystem\_usage\_message](#input\_root\_filesystem\_usage\_message) | Custom message for application file system usage | `string` | `""` | no |
| <a name="input_root_filesystem_usage_threshold_critical"></a> [root\_filesystem\_usage\_threshold\_critical](#input\_root\_filesystem\_usage\_threshold\_critical) | File system usage critical threshold in percent | `string` | `90` | no |
| <a name="input_root_filesystem_usage_threshold_warning"></a> [root\_filesystem\_usage\_threshold\_warning](#input\_root\_filesystem\_usage\_threshold\_warning) | File system usage warning threshold in percent | `string` | `80` | no |
| <a name="input_root_filesystem_usage_timeframe"></a> [root\_filesystem\_usage\_timeframe](#input\_root\_filesystem\_usage\_timeframe) | Monitor timeframe for beanstalk instance file system usage [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_root_filesystem_usage_timeout_h"></a> [root\_filesystem\_usage\_timeout\_h](#input\_root\_filesystem\_usage\_timeout\_h) | File system usage auto-resolving state (in hours) | `number` | `0` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Global variables | `list(string)` | <pre>[<br>  "type:cloud",<br>  "provider:aws",<br>  "resource:beanstalk"<br>]</pre> | no |
| <a name="input_team"></a> [team](#input\_team) | n/a | `string` | `"claranet"` | no |
| <a name="input_timeout_h"></a> [timeout\_h](#input\_timeout\_h) | Default auto-resolving state (in hours) | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_application_5xx_error_rate_id"></a> [application\_5xx\_error\_rate\_id](#output\_application\_5xx\_error\_rate\_id) | id for monitor application\_5xx\_error\_rate |
| <a name="output_application_latency_p90_id"></a> [application\_latency\_p90\_id](#output\_application\_latency\_p90\_id) | id for monitor application\_latency\_p90 |
| <a name="output_health_id"></a> [health\_id](#output\_health\_id) | id for monitor health |
| <a name="output_root_filesystem_usage_id"></a> [root\_filesystem\_usage\_id](#output\_root\_filesystem\_usage\_id) | id for monitor root\_filesystem\_usage |
<!-- END_TF_DOCS -->
## Related documentation

Datadog documentation: [https://docs.datadoghq.com/integrations/amazon_elasticbeanstalk/](https://docs.datadoghq.com/integrations/amazon_elasticbeanstalk/)

AWS Beanstalk Environment monitoring : [https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environments-health.html](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environments-health.html)
