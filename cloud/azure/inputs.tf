variable "environment" {
  description = "Architecture environment"
  type        = "string"
}

variable "message" {
  description = "Message sent when a monitor is triggered"
  type        = "string"
}

variable "delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
}

variable "filter_tags_use_defaults" {
  description = "Use default filter tags convention"
  default     = "true"
}

variable "filter_tags_custom" {
  description = "Tags used for custom filtering when filter_tags_use_defaults is false"
  default     = "*"
}

variable "non_taggable_filter_tags" {
  description = "Tags used for filtering for components without tag support"
  default     = "*"
}

# Azure API Management specific variables
variable "apimanagement_status_silenced" {
  description = "Groups to mute for API Management status monitor"
  type        = "map"
  default     = {}
}

variable "apimanagement_status_message" {
  description = "Custom message for API Management status monitor"
  type        = "string"
  default     = ""
}

variable "apimanagement_status_aggregator" {
  description = "Monitor aggregator for API Management status [available values: min, max, sum or avg]"
  type        = "string"
  default     = "avg"
}

variable "apimanagement_status_timeframe" {
  description = "Monitor timeframe for API Management status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "apimanagement_failed_requests_silenced" {
  description = "Groups to mute for API Management failed requests monitor"
  type        = "map"
  default     = {}
}

variable "apimanagement_failed_requests_message" {
  description = "Custom message for API Management failed requests monitor"
  type        = "string"
  default     = ""
}

variable "apimanagement_failed_requests_aggregator" {
  description = "Monitor aggregator for API Management failed requests [available values: min, max, sum or avg]"
  type        = "string"
  default     = "sum"
}

variable "apimanagement_failed_requests_timeframe" {
  description = "Monitor timeframe for API Management failed requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "apimanagement_failed_requests_threshold_critical" {
  description = "Maximum acceptable percent of failed requests"
  default     = 90
}

variable "apimanagement_failed_requests_threshold_warning" {
  description = "Warning regarding acceptable percent of failed requests"
  default     = 50
}

variable "apimanagement_other_requests_silenced" {
  description = "Groups to mute for API Management other requests monitor"
  type        = "map"
  default     = {}
}

variable "apimanagement_other_requests_message" {
  description = "Custom message for API Management other requests monitor"
  type        = "string"
  default     = ""
}

variable "apimanagement_other_requests_aggregator" {
  description = "Monitor aggregator for API Management other requests [available values: min, max, sum or avg]"
  type        = "string"
  default     = "sum"
}

variable "apimanagement_other_requests_timeframe" {
  description = "Monitor timeframe for API Management other requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "apimanagement_other_requests_threshold_critical" {
  description = "Maximum acceptable percent of other requests"
  default     = 90
}

variable "apimanagement_other_requests_threshold_warning" {
  description = "Warning regarding acceptable percent of other requests"
  default     = 50
}

variable "apimanagement_unauthorized_requests_silenced" {
  description = "Groups to mute for API Management unauthorized requests monitor"
  type        = "map"
  default     = {}
}

variable "apimanagement_unauthorized_requests_message" {
  description = "Custom message for API Management unauthorized requests monitor"
  type        = "string"
  default     = ""
}

variable "apimanagement_unauthorized_requests_aggregator" {
  description = "Monitor aggregator for API Management unauthorized requests [available values: min, max, sum or avg]"
  type        = "string"
  default     = "sum"
}

variable "apimanagement_unauthorized_requests_timeframe" {
  description = "Monitor timeframe for API Management unauthorized requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "apimanagement_unauthorized_requests_threshold_critical" {
  description = "Maximum acceptable percent of unauthorized requests"
  default     = 90
}

variable "apimanagement_unauthorized_requests_threshold_warning" {
  description = "Warning regarding acceptable percent of unauthorized requests"
  default     = 50
}

variable "apimanagement_successful_requests_silenced" {
  description = "Groups to mute for API Management successful requests monitor"
  type        = "map"
  default     = {}
}

variable "apimanagement_successful_requests_message" {
  description = "Custom message for API Management successful requests monitor"
  type        = "string"
  default     = ""
}

variable "apimanagement_successful_requests_aggregator" {
  description = "Monitor aggregator for API Management successful requests [available values: min, max, sum or avg]"
  type        = "string"
  default     = "sum"
}

variable "apimanagement_successful_requests_timeframe" {
  description = "Monitor timeframe for API Management successful requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "apimanagement_successful_requests_threshold_critical" {
  description = "Minimum acceptable percent of successful requests"
  default     = 10
}

variable "apimanagement_successful_requests_threshold_warning" {
  description = "Warning regarding acceptable percent of successful requests"
  default     = 30
}

# Azure App Services specific variables
variable "appservices_response_time_silenced" {
  description = "Groups to mute for App Services response time monitor"
  type        = "map"
  default     = {}
}

variable "appservices_response_time_message" {
  description = "Custom message for App Services response time monitor"
  type        = "string"
  default     = ""
}

variable "appservices_response_time_aggregator" {
  description = "Monitor aggregator for App Services response time [available values: min, max, sum or avg]"
  type        = "string"
  default     = "min"
}

variable "appservices_response_time_timeframe" {
  description = "Monitor timeframe for App Services response time [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "appservices_response_time_threshold_critical" {
  default     = 10
  description = "Alerting threshold for response time in seconds"
}

variable "appservices_response_time_threshold_warning" {
  default     = 5
  description = "Warning threshold for response time in seconds"
}

variable "appservices_memory_usage_silenced" {
  description = "Groups to mute for App Services memory usage monitor"
  type        = "map"
  default     = {}
}

variable "appservices_memory_usage_message" {
  description = "Custom message for App Services memory usage monitor"
  type        = "string"
  default     = ""
}

variable "appservices_memory_usage_aggregator" {
  description = "Monitor aggregator for App Services memory usage [available values: min, max, sum or avg]"
  type        = "string"
  default     = "avg"
}

variable "appservices_memory_usage_timeframe" {
  description = "Monitor timeframe for App Services memory usage [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "appservices_memory_usage_threshold_critical" {
  default     = 1073741824                  # 1Gb
  description = "Alerting threshold in Mib"
}

variable "appservices_memory_usage_threshold_warning" {
  default     = 536870912                  # 512Mb
  description = "Warning threshold in MiB"
}

variable "appservices_http_4xx_requests_silenced" {
  description = "Groups to mute for App Services 4xx requests monitor"
  type        = "map"
  default     = {}
}

variable "appservices_http_4xx_requests_message" {
  description = "Custom message for App Services 4xx requests monitor"
  type        = "string"
  default     = ""
}

variable "appservices_http_4xx_requests_aggregator" {
  description = "Monitor aggregator for App Services 4xx requests [available values: min, max, sum or avg]"
  type        = "string"
  default     = "sum"
}

variable "appservices_http_4xx_requests_timeframe" {
  description = "Monitor timeframe for App Services 4xx requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "appservices_http_4xx_requests_threshold_critical" {
  default     = 90
  description = "Maximum critical acceptable percent of 4xx errors"
}

variable "appservices_http_4xx_requests_threshold_warning" {
  default     = 50
  description = "Warning regarding acceptable percent of 4xx errors"
}

variable "appservices_http_5xx_requests_silenced" {
  description = "Groups to mute for App Services 5xx requests monitor"
  type        = "map"
  default     = {}
}

variable "appservices_http_5xx_requests_message" {
  description = "Custom message for App Services 5xx requests monitor"
  type        = "string"
  default     = ""
}

variable "appservices_http_5xx_requests_aggregator" {
  description = "Monitor aggregator for App Services 5xx requests [available values: min, max, sum or avg]"
  type        = "string"
  default     = "sum"
}

variable "appservices_http_5xx_requests_timeframe" {
  description = "Monitor timeframe for App Services 5xx requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "appservices_http_5xx_requests_threshold_critical" {
  default     = 90
  description = "Maximum critical acceptable percent of 5xx errors"
}

variable "appservices_http_5xx_requests_threshold_warning" {
  default     = 50
  description = "Warning regarding acceptable percent of 5xx errors"
}

variable "appservices_http_successful_requests_silenced" {
  description = "Groups to mute for App Services successful requests monitor"
  type        = "map"
  default     = {}
}

variable "appservices_http_successful_requests_message" {
  description = "Custom message for App Services successful requests monitor"
  type        = "string"
  default     = ""
}

variable "appservices_http_successful_requests_aggregator" {
  description = "Monitor aggregator for App Services successful requests [available values: min, max, sum or avg]"
  type        = "string"
  default     = "sum"
}

variable "appservices_http_successful_requests_timeframe" {
  description = "Monitor timeframe for App Services successful requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "appservices_http_successful_requests_threshold_critical" {
  default     = 10
  description = "Minimum critical acceptable percent of 2xx & 3xx requests"
}

variable "appservices_http_successful_requests_threshold_warning" {
  default     = 30
  description = "Warning regarding acceptable percent of 2xx & 3xx requests"
}

# Azure Event Hub specific variables
variable "eventhub_status_silenced" {
  description = "Groups to mute for Event Hub status monitor"
  type        = "map"
  default     = {}
}

variable "eventhub_status_message" {
  description = "Custom message for Event Hub status monitor"
  type        = "string"
  default     = ""
}

variable "eventhub_status_aggregator" {
  description = "Monitor aggregator for Event Hub status [available values: min, max, sum or avg]"
  type        = "string"
  default     = "avg"
}

variable "eventhub_status_timeframe" {
  description = "Monitor timeframe for Event Hub status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "eventhub_failed_requests_rate_silenced" {
  description = "Groups to mute for Event Hub failed requests monitor"
  type        = "map"
  default     = {}
}

variable "eventhub_failed_requests_rate_message" {
  description = "Custom message for Event Hub failed requests monitor"
  type        = "string"
  default     = ""
}

variable "eventhub_failed_requests_rate_aggregator" {
  description = "Monitor aggregator for Event Hub failed requests [available values: min, max, sum or avg]"
  type        = "string"
  default     = "sum"
}

variable "eventhub_failed_requests_rate_timeframe" {
  description = "Monitor timeframe for Event Hub failed requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "eventhub_failed_requests_rate_thresold_critical" {
  description = "Failed requests ratio (percentage) to trigger the critical alert"
  default     = 90
}

variable "eventhub_failed_requests_rate_thresold_warning" {
  description = "Failed requests ratio (percentage) to trigger a warning alert"
  default     = 50
}

variable "eventhub_errors_rate_silenced" {
  description = "Groups to mute for Event Hub errors monitor"
  type        = "map"
  default     = {}
}

variable "eventhub_errors_rate_message" {
  description = "Custom message for Event Hub errors monitor"
  type        = "string"
  default     = ""
}

variable "eventhub_errors_rate_aggregator" {
  description = "Monitor aggregator for Event Hub errors [available values: min, max, sum or avg]"
  type        = "string"
  default     = "sum"
}

variable "eventhub_errors_rate_timeframe" {
  description = "Monitor timeframe for Event Hub errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "eventhub_errors_rate_thresold_critical" {
  description = "Errors ratio (percentage) to trigger the critical alert"
  default     = 90
}

variable "eventhub_errors_rate_thresold_warning" {
  description = "Errors ratio (percentage) to trigger a warning alert"
  default     = 50
}

# IOT Hub specific variables
variable "iothub_status_silenced" {
  description = "Groups to mute for IoT Hub status monitor"
  type        = "map"
  default     = {}
}

variable "iothub_status_message" {
  description = "Custom message for IoT Hub status monitor"
  type        = "string"
  default     = ""
}

variable "iothub_status_aggregator" {
  description = "Monitor aggregator for IoT Hub status [available values: min, max, sum or avg]"
  type        = "string"
  default     = "avg"
}

variable "iothub_status_timeframe" {
  description = "Monitor timeframe for IoT Hub status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "iothub_total_devices_silenced" {
  description = "Groups to mute for IoT Hub total devices monitor"
  type        = "map"
  default     = {}
}

variable "iothub_total_devices_message" {
  description = "Custom message for IoT Hub total devices monitor"
  type        = "string"
  default     = ""
}

variable "iothub_total_devices_aggregator" {
  description = "Monitor aggregator for IoT Hub total devices [available values: min, max, sum or avg]"
  type        = "string"
  default     = "avg"
}

variable "iothub_total_devices_timeframe" {
  description = "Monitor timeframe for IoT Hub total devices [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "iothub_too_many_d2c_telemetry_ingress_nosent_silenced" {
  description = "Groups to mute for IoT Hub unsent d2c telemetry monitor"
  type        = "map"
  default     = {}
}

variable "iothub_too_many_d2c_telemetry_ingress_nosent_message" {
  description = "Custom message for IoT Hub unsent d2c telemetry monitor"
  type        = "string"
  default     = ""
}

variable "iothub_too_many_d2c_telemetry_ingress_nosent_aggregator" {
  description = "Monitor aggregator for IoT Hub unsent d2c telemetry [available values: min, max, sum or avg]"
  type        = "string"
  default     = "sum"
}

variable "iothub_too_many_d2c_telemetry_ingress_nosent_timeframe" {
  description = "Monitor timeframe for IoT Hub unsent d2c telemetry [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "iothub_failed_jobs_rate_silenced" {
  description = "Groups to mute for IoT Hub failed jobs monitor"
  type        = "map"
  default     = {}
}

variable "iothub_failed_jobs_rate_message" {
  description = "Custom message for IoT Hub failed jobs monitor"
  type        = "string"
  default     = ""
}

variable "iothub_failed_jobs_rate_aggregator" {
  description = "Monitor aggregator for IoT Hub failed jobs [available values: min, max, sum or avg]"
  type        = "string"
  default     = "sum"
}

variable "iothub_failed_jobs_rate_timeframe" {
  description = "Monitor timeframe for IoT Hub failed jobs [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "iothub_failed_jobs_rate_threshold_warning" {
  description = "Jobs Failed rate limit (warning threshold)"
  default     = 50
}

variable "iothub_failed_jobs_rate_threshold_critical" {
  description = "Jobs Failed rate limit (critical threshold)"
  default     = 90
}

variable "iothub_failed_listjobs_rate_silenced" {
  description = "Groups to mute for IoT Hub failed list jobs monitor"
  type        = "map"
  default     = {}
}

variable "iothub_failed_listjobs_rate_message" {
  description = "Custom message for IoT Hub failed list jobs monitor"
  type        = "string"
  default     = ""
}

variable "iothub_failed_listjobs_rate_aggregator" {
  description = "Monitor aggregator for IoT Hub failed listjobs jobs [available values: min, max, sum or avg]"
  type        = "string"
  default     = "sum"
}

variable "iothub_failed_listjobs_rate_timeframe" {
  description = "Monitor timeframe for IoT Hub failed list jobs [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "iothub_failed_listjobs_rate_threshold_warning" {
  description = "ListJobs Failed rate limit (warning threshold)"
  default     = 50
}

variable "iothub_failed_listjobs_rate_threshold_critical" {
  description = "ListJobs Failed rate limit (critical threshold)"
  default     = 90
}

variable "iothub_failed_queryjobs_rate_silenced" {
  description = "Groups to mute for IoT Hub failed query jobs monitor"
  type        = "map"
  default     = {}
}

variable "iothub_failed_queryjobs_rate_message" {
  description = "Custom message for IoT Hub failed query jobs monitor"
  type        = "string"
  default     = ""
}

variable "iothub_failed_queryjobs_rate_aggregator" {
  description = "Monitor aggregator for IoT Hub failed query jobs [available values: min, max, sum or avg]"
  type        = "string"
  default     = "sum"
}

variable "iothub_failed_queryjobs_rate_timeframe" {
  description = "Monitor timeframe for IoT Hub failed query jobs [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "iothub_failed_queryjobs_rate_threshold_warning" {
  description = "QueryJobs Failed rate limit (warning threshold)"
  default     = 50
}

variable "iothub_failed_queryjobs_rate_threshold_critical" {
  description = "QueryJobs Failed rate limit (critical threshold)"
  default     = 90
}

variable "iothub_failed_c2d_methods_rate_silenced" {
  description = "Groups to mute for IoT Hub failed c2d methods monitor"
  type        = "map"
  default     = {}
}

variable "iothub_failed_c2d_methods_rate_message" {
  description = "Custom message for IoT Hub failed c2d method monitor"
  type        = "string"
  default     = ""
}

variable "iothub_failed_c2d_methods_rate_aggregator" {
  description = "Monitor aggregator for IoT Hub failed c2d method [available values: min, max, sum or avg]"
  type        = "string"
  default     = "sum"
}

variable "iothub_failed_c2d_methods_rate_timeframe" {
  description = "Monitor timeframe for IoT Hub failed c2d method [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "iothub_failed_c2d_methods_rate_threshold_warning" {
  description = "C2D Methods Failed rate limit (warning threshold)"
  default     = 50
}

variable "iothub_failed_c2d_methods_rate_threshold_critical" {
  description = "C2D Methods Failed rate limit (critical threshold)"
  default     = 90
}

variable "iothub_failed_c2d_twin_read_rate_silenced" {
  description = "Groups to mute for IoT Hub failed c2d twin read monitor"
  type        = "map"
  default     = {}
}

variable "iothub_failed_c2d_twin_read_rate_message" {
  description = "Custom message for IoT Hub failed c2d twin read monitor"
  type        = "string"
  default     = ""
}

variable "iothub_failed_c2d_twin_read_rate_aggregator" {
  description = "Monitor aggregator for IoT Hub failed c2d twin read [available values: min, max, sum or avg]"
  type        = "string"
  default     = "sum"
}

variable "iothub_failed_c2d_twin_read_rate_timeframe" {
  description = "Monitor timeframe for IoT Hub failed c2d twin read [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "iothub_failed_c2d_twin_read_rate_threshold_warning" {
  description = "C2D Twin Read Failed rate limit (warning threshold)"
  default     = 50
}

variable "iothub_failed_c2d_twin_read_rate_threshold_critical" {
  description = "C2D Twin Read Failed rate limit (critical threshold)"
  default     = 90
}

variable "iothub_failed_c2d_twin_update_rate_silenced" {
  description = "Groups to mute for IoT Hub failed c2d twin update monitor"
  type        = "map"
  default     = {}
}

variable "iothub_failed_c2d_twin_update_rate_message" {
  description = "Custom message for IoT Hub failed c2d twin update monitor"
  type        = "string"
  default     = ""
}

variable "iothub_failed_c2d_twin_update_rate_aggregator" {
  description = "Monitor aggregator for IoT Hub failed c2d twin update [available values: min, max, sum or avg]"
  type        = "string"
  default     = "sum"
}

variable "iothub_failed_c2d_twin_update_rate_timeframe" {
  description = "Monitor timeframe for IoT Hub failed c2d twin update [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "iothub_failed_c2d_twin_update_rate_threshold_warning" {
  description = "C2D Twin Update Failed rate limit (warning threshold)"
  default     = 50
}

variable "iothub_failed_c2d_twin_update_rate_threshold_critical" {
  description = "C2D Twin Update Failed rate limit (critical threshold)"
  default     = 90
}

variable "iothub_failed_d2c_twin_read_rate_silenced" {
  description = "Groups to mute for IoT Hub failed d2c twin read monitor"
  type        = "map"
  default     = {}
}

variable "iothub_failed_d2c_twin_read_rate_message" {
  description = "Custom message for IoT Hub failed d2c twin read monitor"
  type        = "string"
  default     = ""
}

variable "iothub_failed_d2c_twin_read_rate_aggregator" {
  description = "Monitor aggregator for IoT Hub failed d2c twin read [available values: min, max, sum or avg]"
  type        = "string"
  default     = "sum"
}

variable "iothub_failed_d2c_twin_read_rate_timeframe" {
  description = "Monitor timeframe for IoT Hub failed d2c twin read [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "iothub_failed_d2c_twin_read_rate_threshold_warning" {
  description = "D2C Twin Read Failed rate limit (warning threshold)"
  default     = 50
}

variable "iothub_failed_d2c_twin_read_rate_threshold_critical" {
  description = "D2C Twin Read Failed rate limit (critical threshold)"
  default     = 90
}

variable "iothub_failed_d2c_twin_update_rate_silenced" {
  description = "Groups to mute for IoT Hub failed d2c twin update monitor"
  type        = "map"
  default     = {}
}

variable "iothub_failed_d2c_twin_update_rate_message" {
  description = "Custom message for IoT Hub failed d2c twin update monitor"
  type        = "string"
  default     = ""
}

variable "iothub_failed_d2c_twin_update_rate_aggregator" {
  description = "Monitor aggregator for IoT Hub failed d2c twin update [available values: min, max, sum or avg]"
  type        = "string"
  default     = "sum"
}

variable "iothub_failed_d2c_twin_update_rate_timeframe" {
  description = "Monitor timeframe for IoT Hub failed d2c twin update [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "iothub_failed_d2c_twin_update_rate_threshold_warning" {
  description = "D2C Twin Update Failed rate limit (warning threshold)"
  default     = 50
}

variable "iothub_failed_d2c_twin_update_rate_threshold_critical" {
  description = "D2C Twin Update Failed rate limit (critical threshold)"
  default     = 90
}

variable "iothub_dropped_d2c_telemetry_egress_silenced" {
  description = "Groups to mute for IoT Hub dropped d2c telemetry monitor"
  type        = "map"
  default     = {}
}

variable "iothub_dropped_d2c_telemetry_egress_message" {
  description = "Custom message for IoT Hub dropped d2c telemetry monitor"
  type        = "string"
  default     = ""
}

variable "iothub_dropped_d2c_telemetry_egress_aggregator" {
  description = "Monitor aggregator for IoT Hub failed d2c telemetry [available values: min, max, sum or avg]"
  type        = "string"
  default     = "sum"
}

variable "iothub_dropped_d2c_telemetry_egress_timeframe" {
  description = "Monitor timeframe for IoT Hub dropped d2c telemetry [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "iothub_dropped_d2c_telemetry_egress_rate_threshold_warning" {
  description = "D2C Telemetry Dropped limit (warning threshold)"
  default     = 50
}

variable "iothub_dropped_d2c_telemetry_egress_rate_threshold_critical" {
  description = "D2C Telemetry Dropped limit (critical threshold)"
  default     = 90
}

variable "iothub_orphaned_d2c_telemetry_egress_silenced" {
  description = "Groups to mute for IoT Hub orphaned d2c telemetry monitor"
  type        = "map"
  default     = {}
}

variable "iothub_orphaned_d2c_telemetry_egress_message" {
  description = "Custom message for IoT Hub orphaned d2c telemetry monitor"
  type        = "string"
  default     = ""
}

variable "iothub_orphaned_d2c_telemetry_egress_aggregator" {
  description = "Monitor aggregator for IoT Hub orphaned d2c telemetry [available values: min, max, sum or avg]"
  type        = "string"
  default     = "sum"
}

variable "iothub_orphaned_d2c_telemetry_egress_timeframe" {
  description = "Monitor timeframe for IoT Hub orphaned d2c telemetry [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "iothub_orphaned_d2c_telemetry_egress_rate_threshold_warning" {
  description = "D2C Telemetry Orphaned limit (warning threshold)"
  default     = 50
}

variable "iothub_orphaned_d2c_telemetry_egress_rate_threshold_critical" {
  description = "D2C Telemetry Orphaned limit (critical threshold)"
  default     = 90
}

variable "iothub_invalid_d2c_telemetry_egress_silenced" {
  description = "Groups to mute for IoT Hub invalid d2c telemetry monitor"
  type        = "map"
  default     = {}
}

variable "iothub_invalid_d2c_telemetry_egress_message" {
  description = "Custom message for IoT Hub invalid d2c telemetry monitor"
  type        = "string"
  default     = ""
}

variable "iothub_invalid_d2c_telemetry_egress_aggregator" {
  description = "Monitor aggregator for IoT Hub invalid d2c telemetry [available values: min, max, sum or avg]"
  type        = "string"
  default     = "sum"
}

variable "iothub_invalid_d2c_telemetry_egress_timeframe" {
  description = "Monitor timeframe for IoT Hub invalid d2c telemetry [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "iothub_invalid_d2c_telemetry_egress_rate_threshold_warning" {
  description = "D2C Telemetry Invalid limit (warning threshold)"
  default     = 50
}

variable "iothub_invalid_d2c_telemetry_egress_rate_threshold_critical" {
  description = "D2C Telemetry Invalid limit (critical threshold)"
  default     = 90
}

# Azure Redis specific variables
variable "redis_status_silenced" {
  description = "Groups to mute for Redis status monitor"
  type        = "map"
  default     = {}
}

variable "redis_status_message" {
  description = "Custom message for Redis status monitor"
  type        = "string"
  default     = ""
}

variable "redis_status_aggregator" {
  description = "Monitor aggregator for Redis status [available values: min, max, sum or avg]"
  type        = "string"
  default     = "avg"
}

variable "redis_status_timeframe" {
  description = "Monitor timeframe for Redis status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "redis_evictedkeys_limit_silenced" {
  description = "Groups to mute for Redis evicted keys monitor"
  type        = "map"
  default     = {}
}

variable "redis_evictedkeys_limit_message" {
  description = "Custom message for Redis evicted keys monitor"
  type        = "string"
  default     = ""
}

variable "redis_evictedkeys_limit_aggregator" {
  description = "Monitor aggregator for Redis evicted keys [available values: min, max, sum or avg]"
  type        = "string"
  default     = "avg"
}

variable "redis_evictedkeys_limit_timeframe" {
  description = "Monitor timeframe for Redis evicted keys [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "redis_evictedkeys_limit_threshold_warning" {
  description = "Evicted keys limit (warning threshold)"
  default     = 0
}

variable "redis_evictedkeys_limit_threshold_critical" {
  description = "Evicted keys limit (critical threshold)"
  default     = 100
}

variable "redis_percent_processor_time_silenced" {
  description = "Groups to mute for Redis processor monitor"
  type        = "map"
  default     = {}
}

variable "redis_percent_processor_time_message" {
  description = "Custom message for Redis processor monitor"
  type        = "string"
  default     = ""
}

variable "redis_percent_processor_time_aggregator" {
  description = "Monitor aggregator for Redis processor [available values: min, max, sum or avg]"
  type        = "string"
  default     = "avg"
}

variable "redis_percent_processor_time_timeframe" {
  description = "Monitor timeframe for Redis processor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "redis_percent_processor_time_threshold_critical" {
  description = "Processor time percent (critical threshold)"
  default     = 80
}

variable "redis_percent_processor_time_threshold_warning" {
  description = "Processor time percent (warning threshold)"
  default     = 60
}

variable "redis_server_load_rate_silenced" {
  description = "Groups to mute for Redis server load monitor"
  type        = "map"
  default     = {}
}

variable "redis_server_load_rate_message" {
  description = "Custom message for Redis server load monitor"
  type        = "string"
  default     = ""
}

variable "redis_server_load_rate_aggregator" {
  description = "Monitor aggregator for Redis server load [available values: min, max, sum or avg]"
  type        = "string"
  default     = "avg"
}

variable "redis_server_load_rate_timeframe" {
  description = "Monitor timeframe for Redis server load [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "redis_server_load_rate_threshold_critical" {
  description = "Server CPU load rate (critical threshold)"
  default     = 90
}

variable "redis_server_load_rate_threshold_warning" {
  description = "Server CPU load rate (warning threshold)"
  default     = 70
}

# Azure Service Bus specific variables
variable "servicebus_status_silenced" {
  description = "Groups to mute for Service Bus status monitor"
  type        = "map"
  default     = {}
}

variable "servicebus_status_message" {
  description = "Custom message for Service Bus status monitor"
  type        = "string"
  default     = ""
}

variable "servicebus_status_aggregator" {
  description = "Monitor aggregator for Service Bus status [available values: min, max, sum or avg]"
  type        = "string"
  default     = "min"
}

variable "servicebus_status_timeframe" {
  description = "Monitor timeframe for Service Bus status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  default     = "last_15m"
}

# Azure SQL Database specific variables
variable "sqldatabase_cpu_silenced" {
  description = "Groups to mute for SQL CPU monitor"
  type        = "map"
  default     = {}
}

variable "sqldatabase_cpu_message" {
  description = "Custom message for SQL CPU monitor"
  type        = "string"
  default     = ""
}

variable "sqldatabase_cpu_aggregator" {
  description = "Monitor aggregator for SQL CPU [available values: min, max, sum or avg]"
  type        = "string"
  default     = "avg"
}

variable "sqldatabase_cpu_timeframe" {
  description = "Monitor timeframe for SQL CPU [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_15m"
}

variable "sqldatabase_cpu_threshold_warning" {
  description = "CPU usage in percent (warning threshold)"
  default     = "80"
}

variable "sqldatabase_cpu_threshold_critical" {
  description = "CPU usage in percent (critical threshold)"
  default     = "90"
}

variable "sqldatabase_diskspace_silenced" {
  description = "Groups to mute for SQL disk space monitor"
  type        = "map"
  default     = {}
}

variable "sqldatabase_diskspace_message" {
  description = "Custom message for SQL disk space monitor"
  type        = "string"
  default     = ""
}

variable "sqldatabase_diskspace_aggregator" {
  description = "Monitor aggregator for SQL disk space [available values: min, max, sum or avg]"
  type        = "string"
  default     = "avg"
}

variable "sqldatabase_diskspace_timeframe" {
  description = "Monitor timeframe for SQL disk space [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_15m"
}

variable "sqldatabase_diskspace_threshold_warning" {
  description = "Disk space used in percent (warning threshold)"
  default     = "80"
}

variable "sqldatabase_diskspace_threshold_critical" {
  description = "Disk space used in percent (critical threshold)"
  default     = "90"
}

variable "sqldatabase_dtu_silenced" {
  description = "Groups to mute for SQL DTU monitor"
  type        = "map"
  default     = {}
}

variable "sqldatabase_dtu_message" {
  description = "Custom message for SQL DTU monitor"
  type        = "string"
  default     = ""
}

variable "sqldatabase_dtu_aggregator" {
  description = "Monitor aggregator for SQL DTU [available values: min, max, sum or avg]"
  type        = "string"
  default     = "avg"
}

variable "sqldatabase_dtu_timeframe" {
  description = "Monitor timeframe for SQL DTU [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_15m"
}

variable "sqldatabase_dtu_threshold_warning" {
  description = "Amount of DTU used (warning threshold)"
  default     = "85"
}

variable "sqldatabase_dtu_threshold_critical" {
  description = "Amount of DTU used (critical threshold)"
  default     = "90"
}

variable "sqldatabase_deadlock_silenced" {
  description = "Groups to mute for SQL Deadlock monitor"
  type        = "map"
  default     = {}
}

variable "sqldatabase_deadlock_message" {
  description = "Custom message for SQL Deadlock monitor"
  type        = "string"
  default     = ""
}

variable "sqldatabase_deadlock_aggregator" {
  description = "Monitor aggregator for SQL Deadlock [available values: min, max, sum or avg]"
  type        = "string"
  default     = "sum"
}

variable "sqldatabase_deadlock_timeframe" {
  description = "Monitor timeframe for SQL Deadlock [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "sqldatabase_deadlock_threshold_critical" {
  description = "Amount of Deadlocks (critical threshold)"
  default     = "1"
}

# Azure Storage specific variables
variable "storage_availability_silenced" {
  description = "Groups to mute for Storage availability monitor"
  type        = "map"
  default     = {}
}

variable "storage_availability_message" {
  description = "Custom message for Storage availability monitor"
  type        = "string"
  default     = ""
}

variable "storage_availability_aggregator" {
  description = "Monitor aggregator for Storage availability [available values: min, max, sum or avg]"
  type        = "string"
  default     = "avg"
}

variable "storage_availability_timeframe" {
  description = "Monitor timeframe for Storage availability [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "storage_availability_threshold_critical" {
  description = "Minimum acceptable percent of availability for a storage"
  default     = 50
}

variable "storage_availability_threshold_warning" {
  description = "Warning regarding acceptable percent of availability for a storage"
  default     = 90
}

variable "storage_successful_requests_silenced" {
  description = "Groups to mute for Storage sucessful requests monitor"
  type        = "map"
  default     = {}
}

variable "storage_successful_requests_message" {
  description = "Custom message for Storage sucessful requests monitor"
  type        = "string"
  default     = ""
}

variable "storage_successful_requests_aggregator" {
  description = "Monitor aggregator for Storage sucessful requests [available values: min, max, sum or avg]"
  type        = "string"
  default     = "avg"
}

variable "storage_successful_requests_timeframe" {
  description = "Monitor timeframe for Storage sucessful requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "storage_successful_requests_threshold_critical" {
  description = "Minimum acceptable percent of successful requests for a storage"
  default     = 10
}

variable "storage_successful_requests_threshold_warning" {
  description = "Warning regarding acceptable percent of successful requests for a storage"
  default     = 30
}

variable "storage_latency_silenced" {
  description = "Groups to mute for Storage latency monitor"
  type        = "map"
  default     = {}
}

variable "storage_latency_message" {
  description = "Custom message for Storage latency monitor"
  type        = "string"
  default     = ""
}

variable "storage_latency_aggregator" {
  description = "Monitor aggregator for Storage latency [available values: min, max, sum or avg]"
  type        = "string"
  default     = "min"
}

variable "storage_latency_timeframe" {
  description = "Monitor timeframe for Storage latency [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "storage_latency_threshold_critical" {
  description = "Maximum acceptable end to end latency (ms) for a storage"
  default     = 2000
}

variable "storage_latency_threshold_warning" {
  description = "Warning regarding acceptable end to end latency (ms) for a storage"
  default     = 1000
}

variable "storage_timeout_error_requests_silenced" {
  description = "Groups to mute for Storage timeout monitor"
  type        = "map"
  default     = {}
}

variable "storage_timeout_error_requests_message" {
  description = "Custom message for Storage timeout monitor"
  type        = "string"
  default     = ""
}

variable "storage_timeout_error_requests_aggregator" {
  description = "Monitor aggregator for Storage timeout [available values: min, max, sum or avg]"
  type        = "string"
  default     = "avg"
}

variable "storage_timeout_error_requests_timeframe" {
  description = "Monitor timeframe for Storage timeout [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "storage_timeout_error_requests_threshold_critical" {
  description = "Maximum acceptable percent of timeout error requests for a storage"
  default     = 90
}

variable "storage_timeout_error_requests_threshold_warning" {
  description = "Warning regarding acceptable percent of timeout error requests for a storage"
  default     = 50
}

variable "storage_network_error_requests_silenced" {
  description = "Groups to mute for Storage network errors monitor"
  type        = "map"
  default     = {}
}

variable "storage_network_error_requests_message" {
  description = "Custom message for Storage network errors monitor"
  type        = "string"
  default     = ""
}

variable "storage_network_error_requests_aggregator" {
  description = "Monitor aggregator for Storage network errors [available values: min, max, sum or avg]"
  type        = "string"
  default     = "avg"
}

variable "storage_network_error_requests_timeframe" {
  description = "Monitor timeframe for Storage network errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "storage_network_error_requests_threshold_critical" {
  description = "Maximum acceptable percent of network error requests for a storage"
  default     = 90
}

variable "storage_network_error_requests_threshold_warning" {
  description = "Warning regarding acceptable percent of network error requests for a storage"
  default     = 50
}

variable "storage_throttling_error_requests_silenced" {
  description = "Groups to mute for Storage throttling error monitor"
  type        = "map"
  default     = {}
}

variable "storage_throttling_error_requests_message" {
  description = "Custom message for Storage throttling error monitor"
  type        = "string"
  default     = ""
}

variable "storage_throttling_error_requests_aggregator" {
  description = "Monitor aggregator for Storage throttling errors [available values: min, max, sum or avg]"
  type        = "string"
  default     = "avg"
}

variable "storage_throttling_error_requests_timeframe" {
  description = "Monitor timeframe for Storage throttling errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "storage_throttling_error_requests_threshold_critical" {
  description = "Maximum acceptable percent of throttling error requests for a storage"
  default     = 90
}

variable "storage_throttling_error_requests_threshold_warning" {
  description = "Warning regarding acceptable percent of throttling error requests for a storage"
  default     = 50
}

variable "storage_server_other_error_requests_silenced" {
  description = "Groups to mute for Storage server other errors monitor"
  type        = "map"
  default     = {}
}

variable "storage_server_other_error_requests_message" {
  description = "Custom message for Storage server other errors monitor"
  type        = "string"
  default     = ""
}

variable "storage_server_other_error_requests_aggregator" {
  description = "Monitor aggregator for Storage other errors [available values: min, max, sum or avg]"
  type        = "string"
  default     = "avg"
}

variable "storage_server_other_error_requests_timeframe" {
  description = "Monitor timeframe for Storage server other errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "storage_server_other_error_requests_threshold_critical" {
  description = "Maximum acceptable percent of server other error requests for a storage"
  default     = 90
}

variable "storage_server_other_error_requests_threshold_warning" {
  description = "Warning regarding acceptable percent of server other error requests for a storage"
  default     = 50
}

variable "storage_client_other_error_requests_silenced" {
  description = "Groups to mute for Storage other errors monitor"
  type        = "map"
  default     = {}
}

variable "storage_client_other_error_requests_message" {
  description = "Custom message for Storage other errors monitor"
  type        = "string"
  default     = ""
}

variable "storage_client_other_error_requests_aggregator" {
  description = "Monitor aggregator for Storage other errors [available values: min, max, sum or avg]"
  type        = "string"
  default     = "avg"
}

variable "storage_client_other_error_requests_timeframe" {
  description = "Monitor timeframe for Storage other errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "storage_client_other_error_requests_threshold_critical" {
  description = "Maximum acceptable percent of client other error requests for a storage"
  default     = 90
}

variable "storage_client_other_error_requests_threshold_warning" {
  description = "Warning regarding acceptable percent of client other error requests for a storage"
  default     = 50
}

variable "storage_authorization_error_requests_silenced" {
  description = "Groups to mute for Storage authorization errors monitor"
  type        = "map"
  default     = {}
}

variable "storage_authorization_error_requests_message" {
  description = "Custom message for Storage authorization errors monitor"
  type        = "string"
  default     = ""
}

variable "storage_authorization_error_requests_aggregator" {
  description = "Monitor aggregator for Storage authorization errors [available values: min, max, sum or avg]"
  type        = "string"
  default     = "avg"
}

variable "storage_authorization_error_requests_timeframe" {
  description = "Monitor timeframe for Storage authorization errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "storage_authorization_error_requests_threshold_critical" {
  description = "Maximum acceptable percent of authorization error requests for a storage"
  default     = 90
}

variable "storage_authorization_error_requests_threshold_warning" {
  description = "Warning regarding acceptable percent of authorization error requests for a storage"
  default     = 50
}

# Azure Stream Analytics specific variables
variable "streamanalytics_status_silenced" {
  description = "Groups to mute for Stream Analytics status monitor"
  type        = "map"
  default     = {}
}

variable "streamanalytics_status_message" {
  description = "Custom message for Stream Analytics status monitor"
  type        = "string"
  default     = ""
}

variable "streamanalytics_status_aggregator" {
  description = "Monitor aggregator for Stream Analytics status [available values: min, max, sum or avg]"
  type        = "string"
  default     = "avg"
}

variable "streamanalytics_status_timeframe" {
  description = "Monitor timeframe for Stream Analytics status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "streamanalytics_su_utilization_silenced" {
  description = "Groups to mute for Stream Analytics utilization monitor"
  type        = "map"
  default     = {}
}

variable "streamanalytics_su_utilization_message" {
  description = "Custom message for Stream Analytics utilization monitor"
  type        = "string"
  default     = ""
}

variable "streamanalytics_su_utilization_aggregator" {
  description = "Monitor aggregator for Stream Analytics utilization [available values: min, max, sum or avg]"
  type        = "string"
  default     = "avg"
}

variable "streamanalytics_su_utilization_timeframe" {
  description = "Monitor timeframe for Stream Analytics utilization [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "streamanalytics_su_utilization_threshold_warning" {
  description = "Streaming Unit utilization rate limit (warning threshold)"
  default     = 60
}

variable "streamanalytics_su_utilization_threshold_critical" {
  description = "Streaming Unit utilization rate limit (critical threshold)"
  default     = 80
}

variable "streamanalytics_failed_function_requests_silenced" {
  description = "Groups to mute for Stream Analytics failed requests monitor"
  type        = "map"
  default     = {}
}

variable "streamanalytics_failed_function_requests_message" {
  description = "Custom message for Stream Analytics failed requests monitor"
  type        = "string"
  default     = ""
}

variable "streamanalytics_failed_function_requests_aggregator" {
  description = "Monitor aggregator for Stream Analytics failed requests [available values: min, max, sum or avg]"
  type        = "string"
  default     = "sum"
}

variable "streamanalytics_failed_function_requests_timeframe" {
  description = "Monitor timeframe for Stream Analytics failed requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "streamanalytics_failed_function_requests_threshold_warning" {
  description = "Failed Function Request rate limit (warning threshold)"
  default     = 0
}

variable "streamanalytics_failed_function_requests_threshold_critical" {
  description = "Failed Function Request rate limit (critical threshold)"
  default     = 10
}

variable "streamanalytics_conversion_errors_silenced" {
  description = "Groups to mute for Stream Analytics conversion errors monitor"
  type        = "map"
  default     = {}
}

variable "streamanalytics_conversion_errors_message" {
  description = "Custom message for Stream Analytics conversion errors monitor"
  type        = "string"
  default     = ""
}

variable "streamanalytics_conversion_errors_aggregator" {
  description = "Monitor aggregator for Stream Analytics conversion errors [available values: min, max, sum or avg]"
  type        = "string"
  default     = "avg"
}

variable "streamanalytics_conversion_errors_timeframe" {
  description = "Monitor timeframe for Stream Analytics conversion errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "streamanalytics_conversion_errors_threshold_warning" {
  description = "Conversion errors limit (warning threshold)"
  default     = 0
}

variable "streamanalytics_conversion_errors_threshold_critical" {
  description = "Conversion errors limit (critical threshold)"
  default     = 10
}

variable "streamanalytics_runtime_errors_silenced" {
  description = "Groups to mute for Stream Analytics runtime errors monitor"
  type        = "map"
  default     = {}
}

variable "streamanalytics_runtime_errors_message" {
  description = "Custom message for Stream Analytics runtime errors monitor"
  type        = "string"
  default     = ""
}

variable "streamanalytics_runtime_errors_aggregator" {
  description = "Monitor aggregator for Stream Analytics runtime errors [available values: min, max, sum or avg]"
  type        = "string"
  default     = "avg"
}

variable "streamanalytics_runtime_errors_timeframe" {
  description = "Monitor timeframe for Stream Analytics runtime errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "streamanalytics_runtime_errors_threshold_warning" {
  description = "Runtime errors limit (warning threshold)"
  default     = 0
}

variable "streamanalytics_runtime_errors_threshold_critical" {
  description = "Runtime errors limit (critical threshold)"
  default     = 10
}
