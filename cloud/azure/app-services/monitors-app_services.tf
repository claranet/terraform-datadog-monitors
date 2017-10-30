# Monitoring App Services response time
resource "datadog_monitor" "appservices_reponse_time" {
  name               = "[${var.environment}] App Services response time {{value}}s is above ${var.reponse_time_threshold_critical}s"
  type               = "query alert"
  message            = "{{#is_alert}}${var.critical_escalation_group}{{/is_alert}}{{#is_recovery}}${var.critical_escalation_group}{{/is_recovery}}"
  escalation_message = "${var.reponse_time_escalation_message}"

  query = "avg(last_${var.reponse_time_last_time_window_code}):avg:azure.app_services.average_response_time{*} >= ${var.reponse_time_threshold_critical}"

  evaluation_delay = "${var.reponse_time_appserv_eval_delay}"

  thresholds {
    warning  = "${var.reponse_time_threshold_warning}"
    critical = "${var.reponse_time_threshold_critical}"
  }

  notify_no_data    = "${var.reponse_time_notify_no_data}"
  renotify_interval = "${var.reponse_time_renotify_interval}"

  timeout_h    = "${var.reponse_time_timeout_h}"
  include_tags = "${var.reponse_time_include_tags}"

  tags = "${var.reponse_time_tags}"
}

# Monitoring App Services memory usage
resource "datadog_monitor" "appservices_memory_usage" {
  name               = "[${var.environment}] App Services memory usage {{value}} bytes is above ${ceil(var.memory_usage_threshold_critical/1000000)}MiB"
  type               = "query alert"
  message            = "{{#is_alert}}${var.critical_escalation_group}{{/is_alert}}{{#is_recovery}}${var.critical_escalation_group}{{/is_recovery}}"
  escalation_message = "${var.memory_usage_escalation_message}"

  query = "avg(last_${var.memory_usage_last_time_window_code}):avg:azure.app_services.memory_working_set{*} >= ${var.memory_usage_threshold_critical}"

  evaluation_delay = "${var.memory_usage_appserv_eval_delay}"

  thresholds {
    warning  = "${var.memory_usage_threshold_warning}"
    critical = "${var.memory_usage_threshold_critical}"
  }

  notify_no_data    = "${var.memory_usage_notify_no_data}"
  renotify_interval = "${var.memory_usage_renotify_interval}"

  timeout_h    = "${var.memory_usage_timeout_h}"
  include_tags = "${var.memory_usage_include_tags}"

  tags = "${var.memory_usage_tags}"
}
