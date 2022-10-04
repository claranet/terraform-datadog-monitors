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

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.status](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.too_many_c2d_methods_failed](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.too_many_c2d_twin_read_failed](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.too_many_c2d_twin_update_failed](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.too_many_d2c_telemetry_egress_dropped](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.too_many_d2c_telemetry_egress_invalid](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.too_many_d2c_telemetry_egress_orphaned](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.too_many_d2c_telemetry_ingress_nosent](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.too_many_d2c_twin_read_failed](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.too_many_d2c_twin_update_failed](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.too_many_jobs_failed](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.too_many_list_jobs_failed](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.too_many_query_jobs_failed](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.total_devices](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dropped_d2c_telemetry_egress_enabled"></a> [dropped\_d2c\_telemetry\_egress\_enabled](#input\_dropped\_d2c\_telemetry\_egress\_enabled) | Flag to enable IoT Hub dropped d2c telemetry monitor | `string` | `"true"` | no |
| <a name="input_dropped_d2c_telemetry_egress_extra_tags"></a> [dropped\_d2c\_telemetry\_egress\_extra\_tags](#input\_dropped\_d2c\_telemetry\_egress\_extra\_tags) | Extra tags for IoT Hub dropped d2c telemetry monitor | `list(string)` | `[]` | no |
| <a name="input_dropped_d2c_telemetry_egress_message"></a> [dropped\_d2c\_telemetry\_egress\_message](#input\_dropped\_d2c\_telemetry\_egress\_message) | Custom message for IoT Hub dropped d2c telemetry monitor | `string` | `""` | no |
| <a name="input_dropped_d2c_telemetry_egress_rate_threshold_critical"></a> [dropped\_d2c\_telemetry\_egress\_rate\_threshold\_critical](#input\_dropped\_d2c\_telemetry\_egress\_rate\_threshold\_critical) | D2C Telemetry Dropped limit (critical threshold) | `number` | `90` | no |
| <a name="input_dropped_d2c_telemetry_egress_rate_threshold_warning"></a> [dropped\_d2c\_telemetry\_egress\_rate\_threshold\_warning](#input\_dropped\_d2c\_telemetry\_egress\_rate\_threshold\_warning) | D2C Telemetry Dropped limit (warning threshold) | `number` | `50` | no |
| <a name="input_dropped_d2c_telemetry_egress_time_aggregator"></a> [dropped\_d2c\_telemetry\_egress\_time\_aggregator](#input\_dropped\_d2c\_telemetry\_egress\_time\_aggregator) | Monitor aggregator for IoT Hub dropped d2c telemetry [available values: min, max, sum or avg] | `string` | `"min"` | no |
| <a name="input_dropped_d2c_telemetry_egress_timeframe"></a> [dropped\_d2c\_telemetry\_egress\_timeframe](#input\_dropped\_d2c\_telemetry\_egress\_timeframe) | Monitor timeframe for IoT Hub dropped d2c telemetry [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture Environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_failed_c2d_methods_rate_enabled"></a> [failed\_c2d\_methods\_rate\_enabled](#input\_failed\_c2d\_methods\_rate\_enabled) | Flag to enable IoT Hub failed c2d methods monitor | `string` | `"true"` | no |
| <a name="input_failed_c2d_methods_rate_extra_tags"></a> [failed\_c2d\_methods\_rate\_extra\_tags](#input\_failed\_c2d\_methods\_rate\_extra\_tags) | Extra tags for IoT Hub failed c2d methods monitor | `list(string)` | `[]` | no |
| <a name="input_failed_c2d_methods_rate_message"></a> [failed\_c2d\_methods\_rate\_message](#input\_failed\_c2d\_methods\_rate\_message) | Custom message for IoT Hub failed c2d method monitor | `string` | `""` | no |
| <a name="input_failed_c2d_methods_rate_threshold_critical"></a> [failed\_c2d\_methods\_rate\_threshold\_critical](#input\_failed\_c2d\_methods\_rate\_threshold\_critical) | C2D Methods Failed rate limit (critical threshold) | `number` | `90` | no |
| <a name="input_failed_c2d_methods_rate_threshold_warning"></a> [failed\_c2d\_methods\_rate\_threshold\_warning](#input\_failed\_c2d\_methods\_rate\_threshold\_warning) | C2D Methods Failed rate limit (warning threshold) | `number` | `50` | no |
| <a name="input_failed_c2d_methods_rate_time_aggregator"></a> [failed\_c2d\_methods\_rate\_time\_aggregator](#input\_failed\_c2d\_methods\_rate\_time\_aggregator) | Monitor aggregator for IoT Hub failed c2d method [available values: min, max, sum or avg] | `string` | `"min"` | no |
| <a name="input_failed_c2d_methods_rate_timeframe"></a> [failed\_c2d\_methods\_rate\_timeframe](#input\_failed\_c2d\_methods\_rate\_timeframe) | Monitor timeframe for IoT Hub failed c2d method [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_failed_c2d_twin_read_rate_enabled"></a> [failed\_c2d\_twin\_read\_rate\_enabled](#input\_failed\_c2d\_twin\_read\_rate\_enabled) | Flag to enable IoT Hub failed c2d twin read monitor | `string` | `"true"` | no |
| <a name="input_failed_c2d_twin_read_rate_extra_tags"></a> [failed\_c2d\_twin\_read\_rate\_extra\_tags](#input\_failed\_c2d\_twin\_read\_rate\_extra\_tags) | Extra tags for IoT Hub failed c2d twin read monitor | `list(string)` | `[]` | no |
| <a name="input_failed_c2d_twin_read_rate_message"></a> [failed\_c2d\_twin\_read\_rate\_message](#input\_failed\_c2d\_twin\_read\_rate\_message) | Custom message for IoT Hub failed c2d twin read monitor | `string` | `""` | no |
| <a name="input_failed_c2d_twin_read_rate_threshold_critical"></a> [failed\_c2d\_twin\_read\_rate\_threshold\_critical](#input\_failed\_c2d\_twin\_read\_rate\_threshold\_critical) | C2D Twin Read Failed rate limit (critical threshold) | `number` | `90` | no |
| <a name="input_failed_c2d_twin_read_rate_threshold_warning"></a> [failed\_c2d\_twin\_read\_rate\_threshold\_warning](#input\_failed\_c2d\_twin\_read\_rate\_threshold\_warning) | C2D Twin Read Failed rate limit (warning threshold) | `number` | `50` | no |
| <a name="input_failed_c2d_twin_read_rate_time_aggregator"></a> [failed\_c2d\_twin\_read\_rate\_time\_aggregator](#input\_failed\_c2d\_twin\_read\_rate\_time\_aggregator) | Monitor aggregator for IoT Hub failed c2d twin read [available values: min, max, sum or avg] | `string` | `"min"` | no |
| <a name="input_failed_c2d_twin_read_rate_timeframe"></a> [failed\_c2d\_twin\_read\_rate\_timeframe](#input\_failed\_c2d\_twin\_read\_rate\_timeframe) | Monitor timeframe for IoT Hub failed c2d twin read [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_failed_c2d_twin_update_rate_enabled"></a> [failed\_c2d\_twin\_update\_rate\_enabled](#input\_failed\_c2d\_twin\_update\_rate\_enabled) | Flag to enable IoT Hub failed c2d twin update monitor | `string` | `"true"` | no |
| <a name="input_failed_c2d_twin_update_rate_extra_tags"></a> [failed\_c2d\_twin\_update\_rate\_extra\_tags](#input\_failed\_c2d\_twin\_update\_rate\_extra\_tags) | Extra tags for IoT Hub failed c2d twin update monitor | `list(string)` | `[]` | no |
| <a name="input_failed_c2d_twin_update_rate_message"></a> [failed\_c2d\_twin\_update\_rate\_message](#input\_failed\_c2d\_twin\_update\_rate\_message) | Custom message for IoT Hub failed c2d twin update monitor | `string` | `""` | no |
| <a name="input_failed_c2d_twin_update_rate_threshold_critical"></a> [failed\_c2d\_twin\_update\_rate\_threshold\_critical](#input\_failed\_c2d\_twin\_update\_rate\_threshold\_critical) | C2D Twin Update Failed rate limit (critical threshold) | `number` | `90` | no |
| <a name="input_failed_c2d_twin_update_rate_threshold_warning"></a> [failed\_c2d\_twin\_update\_rate\_threshold\_warning](#input\_failed\_c2d\_twin\_update\_rate\_threshold\_warning) | C2D Twin Update Failed rate limit (warning threshold) | `number` | `50` | no |
| <a name="input_failed_c2d_twin_update_rate_time_aggregator"></a> [failed\_c2d\_twin\_update\_rate\_time\_aggregator](#input\_failed\_c2d\_twin\_update\_rate\_time\_aggregator) | Monitor aggregator for IoT Hub failed c2d twin update [available values: min, max, sum or avg] | `string` | `"min"` | no |
| <a name="input_failed_c2d_twin_update_rate_timeframe"></a> [failed\_c2d\_twin\_update\_rate\_timeframe](#input\_failed\_c2d\_twin\_update\_rate\_timeframe) | Monitor timeframe for IoT Hub failed c2d twin update [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_failed_d2c_twin_read_rate_enabled"></a> [failed\_d2c\_twin\_read\_rate\_enabled](#input\_failed\_d2c\_twin\_read\_rate\_enabled) | Flag to enable IoT Hub failed d2c twin read monitor | `string` | `"true"` | no |
| <a name="input_failed_d2c_twin_read_rate_extra_tags"></a> [failed\_d2c\_twin\_read\_rate\_extra\_tags](#input\_failed\_d2c\_twin\_read\_rate\_extra\_tags) | Extra tags for IoT Hub failed d2c twin read monitor | `list(string)` | `[]` | no |
| <a name="input_failed_d2c_twin_read_rate_message"></a> [failed\_d2c\_twin\_read\_rate\_message](#input\_failed\_d2c\_twin\_read\_rate\_message) | Custom message for IoT Hub failed d2c twin read monitor | `string` | `""` | no |
| <a name="input_failed_d2c_twin_read_rate_threshold_critical"></a> [failed\_d2c\_twin\_read\_rate\_threshold\_critical](#input\_failed\_d2c\_twin\_read\_rate\_threshold\_critical) | D2C Twin Read Failed rate limit (critical threshold) | `number` | `90` | no |
| <a name="input_failed_d2c_twin_read_rate_threshold_warning"></a> [failed\_d2c\_twin\_read\_rate\_threshold\_warning](#input\_failed\_d2c\_twin\_read\_rate\_threshold\_warning) | D2C Twin Read Failed rate limit (warning threshold) | `number` | `50` | no |
| <a name="input_failed_d2c_twin_read_rate_time_aggregator"></a> [failed\_d2c\_twin\_read\_rate\_time\_aggregator](#input\_failed\_d2c\_twin\_read\_rate\_time\_aggregator) | Monitor aggregator for IoT Hub failed d2c twin read [available values: min, max, sum or avg] | `string` | `"min"` | no |
| <a name="input_failed_d2c_twin_read_rate_timeframe"></a> [failed\_d2c\_twin\_read\_rate\_timeframe](#input\_failed\_d2c\_twin\_read\_rate\_timeframe) | Monitor timeframe for IoT Hub failed d2c twin read [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_failed_d2c_twin_update_rate_enabled"></a> [failed\_d2c\_twin\_update\_rate\_enabled](#input\_failed\_d2c\_twin\_update\_rate\_enabled) | Flag to enable IoT Hub failed d2c twin update monitor | `string` | `"true"` | no |
| <a name="input_failed_d2c_twin_update_rate_extra_tags"></a> [failed\_d2c\_twin\_update\_rate\_extra\_tags](#input\_failed\_d2c\_twin\_update\_rate\_extra\_tags) | Extra tags for IoT Hub failed d2c twin update monitor | `list(string)` | `[]` | no |
| <a name="input_failed_d2c_twin_update_rate_message"></a> [failed\_d2c\_twin\_update\_rate\_message](#input\_failed\_d2c\_twin\_update\_rate\_message) | Custom message for IoT Hub failed d2c twin update monitor | `string` | `""` | no |
| <a name="input_failed_d2c_twin_update_rate_threshold_critical"></a> [failed\_d2c\_twin\_update\_rate\_threshold\_critical](#input\_failed\_d2c\_twin\_update\_rate\_threshold\_critical) | D2C Twin Update Failed rate limit (critical threshold) | `number` | `90` | no |
| <a name="input_failed_d2c_twin_update_rate_threshold_warning"></a> [failed\_d2c\_twin\_update\_rate\_threshold\_warning](#input\_failed\_d2c\_twin\_update\_rate\_threshold\_warning) | D2C Twin Update Failed rate limit (warning threshold) | `number` | `50` | no |
| <a name="input_failed_d2c_twin_update_rate_time_aggregator"></a> [failed\_d2c\_twin\_update\_rate\_time\_aggregator](#input\_failed\_d2c\_twin\_update\_rate\_time\_aggregator) | Monitor aggregator for IoT Hub failed d2c twin update [available values: min, max, sum or avg] | `string` | `"min"` | no |
| <a name="input_failed_d2c_twin_update_rate_timeframe"></a> [failed\_d2c\_twin\_update\_rate\_timeframe](#input\_failed\_d2c\_twin\_update\_rate\_timeframe) | Monitor timeframe for IoT Hub failed d2c twin update [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_failed_jobs_rate_enabled"></a> [failed\_jobs\_rate\_enabled](#input\_failed\_jobs\_rate\_enabled) | Flag to enable IoT Hub failed jobs monitor | `string` | `"true"` | no |
| <a name="input_failed_jobs_rate_extra_tags"></a> [failed\_jobs\_rate\_extra\_tags](#input\_failed\_jobs\_rate\_extra\_tags) | Extra tags for IoT Hub failed jobs monitor | `list(string)` | `[]` | no |
| <a name="input_failed_jobs_rate_message"></a> [failed\_jobs\_rate\_message](#input\_failed\_jobs\_rate\_message) | Custom message for IoT Hub failed jobs monitor | `string` | `""` | no |
| <a name="input_failed_jobs_rate_threshold_critical"></a> [failed\_jobs\_rate\_threshold\_critical](#input\_failed\_jobs\_rate\_threshold\_critical) | Jobs Failed rate limit (critical threshold) | `number` | `90` | no |
| <a name="input_failed_jobs_rate_threshold_warning"></a> [failed\_jobs\_rate\_threshold\_warning](#input\_failed\_jobs\_rate\_threshold\_warning) | Jobs Failed rate limit (warning threshold) | `number` | `50` | no |
| <a name="input_failed_jobs_rate_time_aggregator"></a> [failed\_jobs\_rate\_time\_aggregator](#input\_failed\_jobs\_rate\_time\_aggregator) | Monitor aggregator for IoT Hub failed jobs [available values: min, max, sum or avg] | `string` | `"min"` | no |
| <a name="input_failed_jobs_rate_timeframe"></a> [failed\_jobs\_rate\_timeframe](#input\_failed\_jobs\_rate\_timeframe) | Monitor timeframe for IoT Hub failed jobs [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_failed_listjobs_rate_enabled"></a> [failed\_listjobs\_rate\_enabled](#input\_failed\_listjobs\_rate\_enabled) | Flag to enable IoT Hub failed list jobs monitor | `string` | `"true"` | no |
| <a name="input_failed_listjobs_rate_extra_tags"></a> [failed\_listjobs\_rate\_extra\_tags](#input\_failed\_listjobs\_rate\_extra\_tags) | Extra tags for IoT Hub failed list jobs monitor | `list(string)` | `[]` | no |
| <a name="input_failed_listjobs_rate_message"></a> [failed\_listjobs\_rate\_message](#input\_failed\_listjobs\_rate\_message) | Custom message for IoT Hub failed list jobs monitor | `string` | `""` | no |
| <a name="input_failed_listjobs_rate_threshold_critical"></a> [failed\_listjobs\_rate\_threshold\_critical](#input\_failed\_listjobs\_rate\_threshold\_critical) | ListJobs Failed rate limit (critical threshold) | `number` | `90` | no |
| <a name="input_failed_listjobs_rate_threshold_warning"></a> [failed\_listjobs\_rate\_threshold\_warning](#input\_failed\_listjobs\_rate\_threshold\_warning) | ListJobs Failed rate limit (warning threshold) | `number` | `50` | no |
| <a name="input_failed_listjobs_rate_time_aggregator"></a> [failed\_listjobs\_rate\_time\_aggregator](#input\_failed\_listjobs\_rate\_time\_aggregator) | Monitor aggregator for IoT Hub failed list jobs [available values: min, max, sum or avg] | `string` | `"min"` | no |
| <a name="input_failed_listjobs_rate_timeframe"></a> [failed\_listjobs\_rate\_timeframe](#input\_failed\_listjobs\_rate\_timeframe) | Monitor timeframe for IoT Hub failed list jobs [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_failed_queryjobs_rate_enabled"></a> [failed\_queryjobs\_rate\_enabled](#input\_failed\_queryjobs\_rate\_enabled) | Flag to enable IoT Hub failed query jobs monitor | `string` | `"true"` | no |
| <a name="input_failed_queryjobs_rate_extra_tags"></a> [failed\_queryjobs\_rate\_extra\_tags](#input\_failed\_queryjobs\_rate\_extra\_tags) | Extra tags for IoT Hub failed query jobs monitor | `list(string)` | `[]` | no |
| <a name="input_failed_queryjobs_rate_message"></a> [failed\_queryjobs\_rate\_message](#input\_failed\_queryjobs\_rate\_message) | Custom message for IoT Hub failed query jobs monitor | `string` | `""` | no |
| <a name="input_failed_queryjobs_rate_threshold_critical"></a> [failed\_queryjobs\_rate\_threshold\_critical](#input\_failed\_queryjobs\_rate\_threshold\_critical) | QueryJobs Failed rate limit (critical threshold) | `number` | `90` | no |
| <a name="input_failed_queryjobs_rate_threshold_warning"></a> [failed\_queryjobs\_rate\_threshold\_warning](#input\_failed\_queryjobs\_rate\_threshold\_warning) | QueryJobs Failed rate limit (warning threshold) | `number` | `50` | no |
| <a name="input_failed_queryjobs_rate_time_aggregator"></a> [failed\_queryjobs\_rate\_time\_aggregator](#input\_failed\_queryjobs\_rate\_time\_aggregator) | Monitor aggregator for IoT Hub failed query jobs [available values: min, max, sum or avg] | `string` | `"min"` | no |
| <a name="input_failed_queryjobs_rate_timeframe"></a> [failed\_queryjobs\_rate\_timeframe](#input\_failed\_queryjobs\_rate\_timeframe) | Monitor timeframe for IoT Hub failed query jobs [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_invalid_d2c_telemetry_egress_enabled"></a> [invalid\_d2c\_telemetry\_egress\_enabled](#input\_invalid\_d2c\_telemetry\_egress\_enabled) | Flag to enable IoT Hub invalid d2c telemetry monitor | `string` | `"true"` | no |
| <a name="input_invalid_d2c_telemetry_egress_extra_tags"></a> [invalid\_d2c\_telemetry\_egress\_extra\_tags](#input\_invalid\_d2c\_telemetry\_egress\_extra\_tags) | Extra tags for IoT Hub invalid d2c telemetry monitor | `list(string)` | `[]` | no |
| <a name="input_invalid_d2c_telemetry_egress_message"></a> [invalid\_d2c\_telemetry\_egress\_message](#input\_invalid\_d2c\_telemetry\_egress\_message) | Custom message for IoT Hub invalid d2c telemetry monitor | `string` | `""` | no |
| <a name="input_invalid_d2c_telemetry_egress_rate_threshold_critical"></a> [invalid\_d2c\_telemetry\_egress\_rate\_threshold\_critical](#input\_invalid\_d2c\_telemetry\_egress\_rate\_threshold\_critical) | D2C Telemetry Invalid limit (critical threshold) | `number` | `90` | no |
| <a name="input_invalid_d2c_telemetry_egress_rate_threshold_warning"></a> [invalid\_d2c\_telemetry\_egress\_rate\_threshold\_warning](#input\_invalid\_d2c\_telemetry\_egress\_rate\_threshold\_warning) | D2C Telemetry Invalid limit (warning threshold) | `number` | `50` | no |
| <a name="input_invalid_d2c_telemetry_egress_time_aggregator"></a> [invalid\_d2c\_telemetry\_egress\_time\_aggregator](#input\_invalid\_d2c\_telemetry\_egress\_time\_aggregator) | Monitor aggregator for IoT Hub invalid d2c telemetry [available values: min, max, sum or avg] | `string` | `"min"` | no |
| <a name="input_invalid_d2c_telemetry_egress_timeframe"></a> [invalid\_d2c\_telemetry\_egress\_timeframe](#input\_invalid\_d2c\_telemetry\_egress\_timeframe) | Monitor timeframe for IoT Hub invalid d2c telemetry [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when an alert is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_orphaned_d2c_telemetry_egress_enabled"></a> [orphaned\_d2c\_telemetry\_egress\_enabled](#input\_orphaned\_d2c\_telemetry\_egress\_enabled) | Flag to enable IoT Hub orphaned d2c telemetry monitor | `string` | `"true"` | no |
| <a name="input_orphaned_d2c_telemetry_egress_extra_tags"></a> [orphaned\_d2c\_telemetry\_egress\_extra\_tags](#input\_orphaned\_d2c\_telemetry\_egress\_extra\_tags) | Extra tags for IoT Hub orphaned d2c telemetry monitor | `list(string)` | `[]` | no |
| <a name="input_orphaned_d2c_telemetry_egress_message"></a> [orphaned\_d2c\_telemetry\_egress\_message](#input\_orphaned\_d2c\_telemetry\_egress\_message) | Custom message for IoT Hub orphaned d2c telemetry monitor | `string` | `""` | no |
| <a name="input_orphaned_d2c_telemetry_egress_rate_threshold_critical"></a> [orphaned\_d2c\_telemetry\_egress\_rate\_threshold\_critical](#input\_orphaned\_d2c\_telemetry\_egress\_rate\_threshold\_critical) | D2C Telemetry Orphaned limit (critical threshold) | `number` | `90` | no |
| <a name="input_orphaned_d2c_telemetry_egress_rate_threshold_warning"></a> [orphaned\_d2c\_telemetry\_egress\_rate\_threshold\_warning](#input\_orphaned\_d2c\_telemetry\_egress\_rate\_threshold\_warning) | D2C Telemetry Orphaned limit (warning threshold) | `number` | `50` | no |
| <a name="input_orphaned_d2c_telemetry_egress_time_aggregator"></a> [orphaned\_d2c\_telemetry\_egress\_time\_aggregator](#input\_orphaned\_d2c\_telemetry\_egress\_time\_aggregator) | Monitor aggregator for IoT Hub orphaned d2c telemetry [available values: min, max, sum or avg] | `string` | `"min"` | no |
| <a name="input_orphaned_d2c_telemetry_egress_timeframe"></a> [orphaned\_d2c\_telemetry\_egress\_timeframe](#input\_orphaned\_d2c\_telemetry\_egress\_timeframe) | Monitor timeframe for IoT Hub orphaned d2c telemetry [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_status_enabled"></a> [status\_enabled](#input\_status\_enabled) | Flag to enable IoT Hub status monitor | `string` | `"true"` | no |
| <a name="input_status_extra_tags"></a> [status\_extra\_tags](#input\_status\_extra\_tags) | Extra tags for IoT Hub status monitor | `list(string)` | `[]` | no |
| <a name="input_status_message"></a> [status\_message](#input\_status\_message) | Custom message for IoT Hub status monitor | `string` | `""` | no |
| <a name="input_status_no_data_timeframe"></a> [status\_no\_data\_timeframe](#input\_status\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `10` | no |
| <a name="input_status_time_aggregator"></a> [status\_time\_aggregator](#input\_status\_time\_aggregator) | Monitor aggregator for IoT Hub status [available values: min, max, sum or avg] | `string` | `"max"` | no |
| <a name="input_status_timeframe"></a> [status\_timeframe](#input\_status\_timeframe) | Monitor timeframe for IoT Hub status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_timeout_h"></a> [timeout\_h](#input\_timeout\_h) | Default auto-resolving state (in hours) | `number` | `0` | no |
| <a name="input_too_many_d2c_telemetry_ingress_nosent_enabled"></a> [too\_many\_d2c\_telemetry\_ingress\_nosent\_enabled](#input\_too\_many\_d2c\_telemetry\_ingress\_nosent\_enabled) | Flag to enable IoT Hub unsent d2c telemetry monitor | `string` | `"true"` | no |
| <a name="input_too_many_d2c_telemetry_ingress_nosent_extra_tags"></a> [too\_many\_d2c\_telemetry\_ingress\_nosent\_extra\_tags](#input\_too\_many\_d2c\_telemetry\_ingress\_nosent\_extra\_tags) | Extra tags for IoT Hub unsent d2c telemetry monitor | `list(string)` | `[]` | no |
| <a name="input_too_many_d2c_telemetry_ingress_nosent_message"></a> [too\_many\_d2c\_telemetry\_ingress\_nosent\_message](#input\_too\_many\_d2c\_telemetry\_ingress\_nosent\_message) | Custom message for IoT Hub unsent d2c telemetry monitor | `string` | `""` | no |
| <a name="input_too_many_d2c_telemetry_ingress_nosent_rate_threshold_critical"></a> [too\_many\_d2c\_telemetry\_ingress\_nosent\_rate\_threshold\_critical](#input\_too\_many\_d2c\_telemetry\_ingress\_nosent\_rate\_threshold\_critical) | D2C Telemetry ingress not sent limit (critical threshold) | `number` | `20` | no |
| <a name="input_too_many_d2c_telemetry_ingress_nosent_rate_threshold_warning"></a> [too\_many\_d2c\_telemetry\_ingress\_nosent\_rate\_threshold\_warning](#input\_too\_many\_d2c\_telemetry\_ingress\_nosent\_rate\_threshold\_warning) | D2C Telemetry ingress not sent limit (warning threshold) | `number` | `10` | no |
| <a name="input_too_many_d2c_telemetry_ingress_nosent_timeframe"></a> [too\_many\_d2c\_telemetry\_ingress\_nosent\_timeframe](#input\_too\_many\_d2c\_telemetry\_ingress\_nosent\_timeframe) | Monitor timeframe for IoT Hub unsent d2c telemetry [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_total_devices_enabled"></a> [total\_devices\_enabled](#input\_total\_devices\_enabled) | Flag to enable IoT Hub total devices monitor | `string` | `"true"` | no |
| <a name="input_total_devices_extra_tags"></a> [total\_devices\_extra\_tags](#input\_total\_devices\_extra\_tags) | Extra tags for IoT Hub total devices monitor | `list(string)` | `[]` | no |
| <a name="input_total_devices_message"></a> [total\_devices\_message](#input\_total\_devices\_message) | Custom message for IoT Hub total devices monitor | `string` | `""` | no |
| <a name="input_total_devices_time_aggregator"></a> [total\_devices\_time\_aggregator](#input\_total\_devices\_time\_aggregator) | Monitor aggregator for IoT Hub total devices [available values: min, max, sum or avg] | `string` | `"min"` | no |
| <a name="input_total_devices_timeframe"></a> [total\_devices\_timeframe](#input\_total\_devices\_timeframe) | Monitor timeframe for IoT Hub total devices [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_status_id"></a> [status\_id](#output\_status\_id) | id for monitor status |
| <a name="output_too_many_c2d_methods_failed_id"></a> [too\_many\_c2d\_methods\_failed\_id](#output\_too\_many\_c2d\_methods\_failed\_id) | id for monitor too\_many\_c2d\_methods\_failed |
| <a name="output_too_many_c2d_twin_read_failed_id"></a> [too\_many\_c2d\_twin\_read\_failed\_id](#output\_too\_many\_c2d\_twin\_read\_failed\_id) | id for monitor too\_many\_c2d\_twin\_read\_failed |
| <a name="output_too_many_c2d_twin_update_failed_id"></a> [too\_many\_c2d\_twin\_update\_failed\_id](#output\_too\_many\_c2d\_twin\_update\_failed\_id) | id for monitor too\_many\_c2d\_twin\_update\_failed |
| <a name="output_too_many_d2c_telemetry_egress_dropped_id"></a> [too\_many\_d2c\_telemetry\_egress\_dropped\_id](#output\_too\_many\_d2c\_telemetry\_egress\_dropped\_id) | id for monitor too\_many\_d2c\_telemetry\_egress\_dropped |
| <a name="output_too_many_d2c_telemetry_egress_invalid_id"></a> [too\_many\_d2c\_telemetry\_egress\_invalid\_id](#output\_too\_many\_d2c\_telemetry\_egress\_invalid\_id) | id for monitor too\_many\_d2c\_telemetry\_egress\_invalid |
| <a name="output_too_many_d2c_telemetry_egress_orphaned_id"></a> [too\_many\_d2c\_telemetry\_egress\_orphaned\_id](#output\_too\_many\_d2c\_telemetry\_egress\_orphaned\_id) | id for monitor too\_many\_d2c\_telemetry\_egress\_orphaned |
| <a name="output_too_many_d2c_telemetry_ingress_nosent_id"></a> [too\_many\_d2c\_telemetry\_ingress\_nosent\_id](#output\_too\_many\_d2c\_telemetry\_ingress\_nosent\_id) | id for monitor too\_many\_d2c\_telemetry\_ingress\_nosent |
| <a name="output_too_many_d2c_twin_read_failed_id"></a> [too\_many\_d2c\_twin\_read\_failed\_id](#output\_too\_many\_d2c\_twin\_read\_failed\_id) | id for monitor too\_many\_d2c\_twin\_read\_failed |
| <a name="output_too_many_d2c_twin_update_failed_id"></a> [too\_many\_d2c\_twin\_update\_failed\_id](#output\_too\_many\_d2c\_twin\_update\_failed\_id) | id for monitor too\_many\_d2c\_twin\_update\_failed |
| <a name="output_too_many_jobs_failed_id"></a> [too\_many\_jobs\_failed\_id](#output\_too\_many\_jobs\_failed\_id) | id for monitor too\_many\_jobs\_failed |
| <a name="output_too_many_list_jobs_failed_id"></a> [too\_many\_list\_jobs\_failed\_id](#output\_too\_many\_list\_jobs\_failed\_id) | id for monitor too\_many\_list\_jobs\_failed |
| <a name="output_too_many_query_jobs_failed_id"></a> [too\_many\_query\_jobs\_failed\_id](#output\_too\_many\_query\_jobs\_failed\_id) | id for monitor too\_many\_query\_jobs\_failed |
| <a name="output_total_devices_id"></a> [total\_devices\_id](#output\_total\_devices\_id) | id for monitor total\_devices |
<!-- END_TF_DOCS -->
## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_iot_hub](https://docs.datadoghq.com/integrations/azure_iot_hub)

Azure IOT Hubs metrics documentation: [https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-monitor-resource-health](https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-monitor-resource-health)
