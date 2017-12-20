module "apimanagement" {
  source = "./apimanagement"

  environment = "${var.environment}"
  message     = "${var.message}"
  delay       = "${var.delay}"

  filter_tags_use_defaults = "${var.filter_tags_use_defaults}"
  filter_tags_custom       = "${var.filter_tags_custom}"

  failed_requests_threshold_critical       = "${var.apimanagement_failed_requests_threshold_critical}"
  other_requests_threshold_critical        = "${var.apimanagement_other_requests_threshold_critical}"
  successful_requests_threshold_critical   = "${var.apimanagement_successful_requests_threshold_critical}"
  unauthorized_requests_threshold_critical = "${var.apimanagement_unauthorized_requests_threshold_critical}"
}

module "appservices" {
  source = "./app-services"

  environment = "${var.environment}"
  message     = "${var.message}"
  delay       = "${var.delay}"

  filter_tags_use_defaults = "${var.filter_tags_use_defaults}"
  filter_tags_custom       = "${var.filter_tags_custom}"

  http_2xx_requests_threshold_critical = "${var.appservices_http_2xx_requests_threshold_critical}"
  http_2xx_requests_threshold_warning  = "${var.appservices_http_2xx_requests_threshold_warning}"
  http_5xx_requests_threshold_critical = "${var.appservices_http_5xx_requests_threshold_critical}"
  http_5xx_requests_threshold_warning  = "${var.appservices_http_5xx_requests_threshold_warning}"
  http_4xx_requests_threshold_critical = "${var.appservices_http_4xx_requests_threshold_critical}"
  http_4xx_requests_threshold_warning  = "${var.appservices_http_4xx_requests_threshold_warning}"
  memory_usage_threshold_critical      = "${var.appservices_memory_usage_threshold_critical}"
  memory_usage_threshold_warning       = "${var.appservices_memory_usage_threshold_warning}"
  response_time_threshold_critical     = "${var.appservices_response_time_threshold_critical}"
  response_time_threshold_warning      = "${var.appservices_response_time_threshold_warning}"
}

module "eventhub" {
  source = "./eventhub"

  environment = "${var.environment}"
  message     = "${var.message}"
  delay       = "${var.delay}"

  filter_tags_use_defaults = "${var.filter_tags_use_defaults}"
  filter_tags_custom       = "${var.filter_tags_custom}"

  errors_rate_thresold_critical          = "${var.eventhub_errors_rate_thresold_critical}"
  errors_rate_thresold_warning           = "${var.eventhub_errors_rate_thresold_warning}"
  failed_requests_rate_thresold_critical = "${var.eventhub_failed_requests_rate_thresold_critical}"
  failed_requests_rate_thresold_warning  = "${var.eventhub_failed_requests_rate_thresold_warning}"
}

module "iothub" {
  source = "./iothubs"

  environment = "${var.environment}"
  message     = "${var.message}"
  delay       = "${var.delay}"

  filter_tags = "${var.non_taggable_filter_tags}"

  dropped_d2c_telemetry_egress_threshold_critical  = "${var.iothub_dropped_d2c_telemetry_egress_threshold_critical}"
  dropped_d2c_telemetry_egress_threshold_warning   = "${var.iothub_dropped_d2c_telemetry_egress_threshold_warning}"
  failed_c2d_methods_rate_threshold_critical       = "${var.iothub_failed_c2d_methods_rate_threshold_critical}"
  failed_c2d_methods_rate_threshold_warning        = "${var.iothub_failed_c2d_methods_rate_threshold_warning}"
  failed_c2d_twin_read_rate_threshold_critical     = "${var.iothub_failed_c2d_twin_read_rate_threshold_critical}"
  failed_c2d_twin_read_rate_threshold_warning      = "${var.iothub_failed_c2d_twin_read_rate_threshold_warning}"
  failed_c2d_twin_update_rate_threshold_critical   = "${var.iothub_failed_c2d_twin_update_rate_threshold_critical}"
  failed_c2d_twin_update_rate_threshold_warning    = "${var.iothub_failed_c2d_twin_update_rate_threshold_warning}"
  failed_d2c_twin_read_rate_threshold_critical     = "${var.iothub_failed_d2c_twin_read_rate_threshold_critical}"
  failed_d2c_twin_read_rate_threshold_warning      = "${var.iothub_failed_d2c_twin_read_rate_threshold_warning}"
  failed_d2c_twin_update_rate_threshold_critical   = "${var.iothub_failed_d2c_twin_update_rate_threshold_critical}"
  failed_d2c_twin_update_rate_threshold_warning    = "${var.iothub_failed_d2c_twin_update_rate_threshold_warning}"
  failed_jobs_rate_threshold_critical              = "${var.iothub_failed_jobs_rate_threshold_critical}"
  failed_jobs_rate_threshold_warning               = "${var.iothub_failed_jobs_rate_threshold_warning}"
  failed_listjobs_rate_threshold_critical          = "${var.iothub_failed_listjobs_rate_threshold_critical}"
  failed_listjobs_rate_threshold_warning           = "${var.iothub_failed_listjobs_rate_threshold_warning}"
  failed_queryjobs_rate_threshold_critical         = "${var.iothub_failed_queryjobs_rate_threshold_critical}"
  failed_queryjobs_rate_threshold_warning          = "${var.iothub_failed_queryjobs_rate_threshold_warning}"
  fallback_d2c_telemetry_egress_threshold_critical = "${var.iothub_fallback_d2c_telemetry_egress_threshold_critical}"
  fallback_d2c_telemetry_egress_threshold_warning  = "${var.iothub_fallback_d2c_telemetry_egress_threshold_warning}"
  invalid_d2c_telemetry_egress_threshold_critical  = "${var.iothub_invalid_d2c_telemetry_egress_threshold_critical}"
  invalid_d2c_telemetry_egress_threshold_warning   = "${var.iothub_invalid_d2c_telemetry_egress_threshold_warning}"
  orphaned_d2c_telemetry_egress_threshold_critical = "${var.iothub_orphaned_d2c_telemetry_egress_threshold_critical}"
  orphaned_d2c_telemetry_egress_threshold_warning  = "${var.iothub_orphaned_d2c_telemetry_egress_threshold_warning}"
}

module "redis" {
  source = "./redis"

  environment = "${var.environment}"
  message     = "${var.message}"
  delay       = "${var.delay}"

  filter_tags_use_defaults = "${var.filter_tags_use_defaults}"
  filter_tags_custom       = "${var.filter_tags_custom}"

  evictedkeys_limit_threshold_critical      = "${var.redis_evictedkeys_limit_threshold_critical}"
  evictedkeys_limit_threshold_warning       = "${var.redis_evictedkeys_limit_threshold_warning}"
  percent_processor_time_threshold_critical = "${var.redis_percent_processor_time_threshold_critical}"
  percent_processor_time_threshold_warning  = "${var.redis_percent_processor_time_threshold_warning}"
  server_load_rate_threshold_critical       = "${var.redis_server_load_rate_threshold_critical}"
  server_load_rate_threshold_warning        = "${var.redis_server_load_rate_threshold_warning}"
}

module "sqldatabase" {
  source = "./sql-database"

  environment = "${var.environment}"
  message     = "${var.message}"
  delay       = "${var.delay}"

  filter_tags_use_defaults = "${var.filter_tags_use_defaults}"
  filter_tags_custom       = "${var.filter_tags_custom}"

  cpu_threshold_critical       = "${var.sqldatabase_cpu_threshold_critical}"
  cpu_threshold_warning        = "${var.sqldatabase_cpu_threshold_warning}"
  deadlock_threshold_critical  = "${var.sqldatabase_deadlock_threshold_critical}"
  diskspace_threshold_critical = "${var.sqldatabase_diskspace_threshold_critical}"
  diskspace_threshold_warning  = "${var.sqldatabase_diskspace_threshold_warning}"
  dtu_threshold_critical       = "${var.sqldatabase_dtu_threshold_critical}"
  dtu_threshold_warning        = "${var.sqldatabase_dtu_threshold_warning}"
}

module "storage" {
  source = "./storage"

  environment = "${var.environment}"
  message     = "${var.message}"
  delay       = "${var.delay}"

  filter_tags_use_defaults = "${var.filter_tags_use_defaults}"
  filter_tags_custom       = "${var.filter_tags_custom}"

  authorization_error_requests_threshold_critical = "${var.storage_authorization_error_requests_threshold_critical}"
  availability_threshold_critical                 = "${var.storage_availability_threshold_critical}"
  client_other_error_requests_threshold_critical  = "${var.storage_client_other_error_requests_threshold_critical}"
  latency_threshold_critical                      = "${var.storage_latency_threshold_critical}"
  network_error_requests_threshold_critical       = "${var.storage_network_error_requests_threshold_critical}"
  server_other_error_requests_threshold_critical  = "${var.storage_server_other_error_requests_threshold_critical}"
  successful_requests_threshold_critical          = "${var.storage_successful_requests_threshold_critical}"
  throttling_error_requests_threshold_critical    = "${var.storage_throttling_error_requests_threshold_critical}"
  timeout_error_requests_threshold_critical       = "${var.storage_timeout_error_requests_threshold_critical}"
}

module "streamanalytics" {
  source = "./stream-analytics"

  environment = "${var.environment}"
  message     = "${var.message}"
  delay       = "${var.delay}"

  filter_tags_use_defaults = "${var.filter_tags_use_defaults}"
  filter_tags_custom       = "${var.filter_tags_custom}"

  conversion_errors_threshold_critical        = "${var.streamanalytics_conversion_errors_threshold_critical}"
  conversion_errors_threshold_warning         = "${var.streamanalytics_conversion_errors_threshold_warning}"
  failed_function_requests_threshold_critical = "${var.streamanalytics_failed_function_requests_threshold_critical}"
  function_requests_threshold_warning         = "${var.streamanalytics_function_requests_threshold_warning}"
  runtime_errors_threshold_critical           = "${var.streamanalytics_runtime_errors_threshold_critical}"
  runtime_errors_threshold_warning            = "${var.streamanalytics_runtime_errors_threshold_warning}"
  su_utilization_threshold_critical           = "${var.streamanalytics_su_utilization_threshold_critical}"
  su_utilization_threshold_warning            = "${var.streamanalytics_su_utilization_threshold_warning}"
}
