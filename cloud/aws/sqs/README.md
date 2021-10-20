# CLOUD AWS SQS DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-sqs" {
  source      = "claranet/monitors/datadog//cloud/aws/sqs"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- SQS Age of the oldest message
- SQS Visible messages (disabled by default)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.31 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | >= 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | 3.4.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_filter-tags"></a> [filter-tags](#module\_filter-tags) | ../../../common/filter-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.age_of_oldest_message](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.visible_messages](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_age_of_oldest_message_enabled"></a> [age\_of\_oldest\_message\_enabled](#input\_age\_of\_oldest\_message\_enabled) | Flag to enable Age of Oldest Message monitor | `string` | `"true"` | no |
| <a name="input_age_of_oldest_message_extra_tags"></a> [age\_of\_oldest\_message\_extra\_tags](#input\_age\_of\_oldest\_message\_extra\_tags) | Extra tags for Age of Oldest Message monitor | `list(string)` | `[]` | no |
| <a name="input_age_of_oldest_message_message"></a> [age\_of\_oldest\_message\_message](#input\_age\_of\_oldest\_message\_message) | Custom message for Age of Oldest Message monitor | `string` | `""` | no |
| <a name="input_age_of_oldest_message_threshold_critical"></a> [age\_of\_oldest\_message\_threshold\_critical](#input\_age\_of\_oldest\_message\_threshold\_critical) | Alerting threshold in seconds | `number` | `600` | no |
| <a name="input_age_of_oldest_message_threshold_warning"></a> [age\_of\_oldest\_message\_threshold\_warning](#input\_age\_of\_oldest\_message\_threshold\_warning) | Warning threshold in seconds | `number` | `300` | no |
| <a name="input_age_of_oldest_message_time_aggregator"></a> [age\_of\_oldest\_message\_time\_aggregator](#input\_age\_of\_oldest\_message\_time\_aggregator) | Monitor aggregator for Age of Oldest Message [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_age_of_oldest_message_timeframe"></a> [age\_of\_oldest\_message\_timeframe](#input\_age\_of\_oldest\_message\_timeframe) | Monitor timeframe for Age of Oldest Message [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_30m"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a monitor is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_visible_messages_enabled"></a> [visible\_messages\_enabled](#input\_visible\_messages\_enabled) | Flag to enable Number of Visible Messages monitor | `string` | `"false"` | no |
| <a name="input_visible_messages_extra_tags"></a> [visible\_messages\_extra\_tags](#input\_visible\_messages\_extra\_tags) | Extra tags for Number of Visible Messages monitor | `list(string)` | `[]` | no |
| <a name="input_visible_messages_message"></a> [visible\_messages\_message](#input\_visible\_messages\_message) | Custom message for Number of Visible Messages monitor | `string` | `""` | no |
| <a name="input_visible_messages_threshold_critical"></a> [visible\_messages\_threshold\_critical](#input\_visible\_messages\_threshold\_critical) | Alerting threshold in number of messages | `number` | `2` | no |
| <a name="input_visible_messages_threshold_warning"></a> [visible\_messages\_threshold\_warning](#input\_visible\_messages\_threshold\_warning) | Warning threshold in number of messages | `number` | `1` | no |
| <a name="input_visible_messages_time_aggregator"></a> [visible\_messages\_time\_aggregator](#input\_visible\_messages\_time\_aggregator) | Monitor aggregator for Number of Visible Messages [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_visible_messages_timeframe"></a> [visible\_messages\_timeframe](#input\_visible\_messages\_timeframe) | Monitor timeframe for Number of Visible Messages [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_30m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_age_of_oldest_message_id"></a> [age\_of\_oldest\_message\_id](#output\_age\_of\_oldest\_message\_id) | id for monitor age\_of\_oldest\_message |
| <a name="output_visible_messages_id"></a> [visible\_messages\_id](#output\_visible\_messages\_id) | id for monitor visible\_messages |
## Related documentation
* [Datadog Documentation](https://docs.datadoghq.com/integrations/amazon_sqs/)
* [Service Documentation](https://docs.aws.amazon.com/sqs/index.html)
