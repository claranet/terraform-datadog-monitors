# DATABASE SOLR DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-database-solr" {
  source      = "claranet/monitors/datadog//database/solr"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Solr does not respond
- Solr searcher warmup time too high
- Too many errors on Solr search handler

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
| <a name="module_filter-tags"></a> [filter-tags](#module\_filter-tags) | ../../common/filter-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.not_responding](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.search_handler_errors](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.searcher_warmup_time](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `15` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a monitor is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Delay in seconds before begin to monitor new host | `number` | `300` | no |
| <a name="input_not_responding_enabled"></a> [not\_responding\_enabled](#input\_not\_responding\_enabled) | Flag to enable Solr does not repsond monitor | `bool` | `true` | no |
| <a name="input_not_responding_extra_tags"></a> [not\_responding\_extra\_tags](#input\_not\_responding\_extra\_tags) | Extra tags for solr does not respond monitor | `list(string)` | `[]` | no |
| <a name="input_not_responding_group_by"></a> [not\_responding\_group\_by](#input\_not\_responding\_group\_by) | Not responding tags to group data | `list(string)` | <pre>[<br>  "instance"<br>]</pre> | no |
| <a name="input_not_responding_message"></a> [not\_responding\_message](#input\_not\_responding\_message) | Custom message for Solr does not respond monitor | `string` | `""` | no |
| <a name="input_not_responding_no_data_timeframe"></a> [not\_responding\_no\_data\_timeframe](#input\_not\_responding\_no\_data\_timeframe) | Solr not responding monitor no data timeframe | `number` | `10` | no |
| <a name="input_not_responding_threshold_warning"></a> [not\_responding\_threshold\_warning](#input\_not\_responding\_threshold\_warning) | Solr not responding limit (warning threshold) | `number` | `3` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_search_handler_errors_enabled"></a> [search\_handler\_errors\_enabled](#input\_search\_handler\_errors\_enabled) | Flag to enable Solr search handler errors monitor | `bool` | `true` | no |
| <a name="input_search_handler_errors_extra_tags"></a> [search\_handler\_errors\_extra\_tags](#input\_search\_handler\_errors\_extra\_tags) | Extra tags for Search handler errors monitor | `list(string)` | `[]` | no |
| <a name="input_search_handler_errors_group_by"></a> [search\_handler\_errors\_group\_by](#input\_search\_handler\_errors\_group\_by) | Search handler errors tags to group datas | `list(string)` | <pre>[<br>  "instance"<br>]</pre> | no |
| <a name="input_search_handler_errors_message"></a> [search\_handler\_errors\_message](#input\_search\_handler\_errors\_message) | Custom message for Solr search handler errors monitor | `string` | `""` | no |
| <a name="input_search_handler_errors_rate_threshold_critical"></a> [search\_handler\_errors\_rate\_threshold\_critical](#input\_search\_handler\_errors\_rate\_threshold\_critical) | Handler errors rate critical threshold | `number` | `50` | no |
| <a name="input_search_handler_errors_rate_threshold_warning"></a> [search\_handler\_errors\_rate\_threshold\_warning](#input\_search\_handler\_errors\_rate\_threshold\_warning) | Handler errors rate warning threshold | `number` | `10` | no |
| <a name="input_search_handler_errors_time_aggregator"></a> [search\_handler\_errors\_time\_aggregator](#input\_search\_handler\_errors\_time\_aggregator) | Time aggregator for the Handler errors monitor | `string` | `"min"` | no |
| <a name="input_search_handler_errors_timeframe"></a> [search\_handler\_errors\_timeframe](#input\_search\_handler\_errors\_timeframe) | Timeframe for the search handler errors monitor | `string` | `"last_5m"` | no |
| <a name="input_searcher_warmup_time_aggregator"></a> [searcher\_warmup\_time\_aggregator](#input\_searcher\_warmup\_time\_aggregator) | Time aggregator for the searcher warmup time monitor | `string` | `"max"` | no |
| <a name="input_searcher_warmup_time_enabled"></a> [searcher\_warmup\_time\_enabled](#input\_searcher\_warmup\_time\_enabled) | Flag to enable Solr searcher warmup time monitor | `bool` | `true` | no |
| <a name="input_searcher_warmup_time_extra_tags"></a> [searcher\_warmup\_time\_extra\_tags](#input\_searcher\_warmup\_time\_extra\_tags) | Extra tags for searcher warmum time monitor | `list(string)` | `[]` | no |
| <a name="input_searcher_warmup_time_group_by"></a> [searcher\_warmup\_time\_group\_by](#input\_searcher\_warmup\_time\_group\_by) | Search warmup time tags to group datas | `list(string)` | <pre>[<br>  "instance"<br>]</pre> | no |
| <a name="input_searcher_warmup_time_message"></a> [searcher\_warmup\_time\_message](#input\_searcher\_warmup\_time\_message) | Custom message for Solr searcher warmup time monitor | `string` | `""` | no |
| <a name="input_searcher_warmup_time_threshold_critical"></a> [searcher\_warmup\_time\_threshold\_critical](#input\_searcher\_warmup\_time\_threshold\_critical) | Searcher warmup time critical threshold in ms | `number` | `5000` | no |
| <a name="input_searcher_warmup_time_threshold_warning"></a> [searcher\_warmup\_time\_threshold\_warning](#input\_searcher\_warmup\_time\_threshold\_warning) | Searcher warmup time warning threshold in ms | `number` | `2000` | no |
| <a name="input_searcher_warmup_time_timeframe"></a> [searcher\_warmup\_time\_timeframe](#input\_searcher\_warmup\_time\_timeframe) | Timeframe for the searcher warmup time monitor | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_not_responding_id"></a> [not\_responding\_id](#output\_not\_responding\_id) | id for monitor not\_responding |
| <a name="output_search_handler_errors_id"></a> [search\_handler\_errors\_id](#output\_search\_handler\_errors\_id) | id for monitor search\_handler\_errors |
| <a name="output_searcher_warmup_time_id"></a> [searcher\_warmup\_time\_id](#output\_searcher\_warmup\_time\_id) | id for monitor searcher\_warmup\_time |
## Related documentation

 - [Integration Datadog & Solr](https://docs.datadoghq.com/integrations/solr/)
