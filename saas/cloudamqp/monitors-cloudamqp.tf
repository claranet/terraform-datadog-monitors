#
# Free Space in nodes
#
resource "datadog_monitor" "disk_free_space" {
  count   = var.disk_free_space_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{instance.name}}] RabbitMQ Disk Space is Low"
  message = coalesce(var.disk_free_space_message, var.message)

  type = "query alert"

  query = <<EOQ
  ${var.disk_free_space_time_aggregator}(${var.disk_free_space_timeframe}):
    avg:rabbitmq.node.disk_alarm${module.filter-tags.query_alert} by {instance,rabbitmq_node}
    >= 1
EOQ

  monitor_thresholds {
    critical = var.disk_free_space_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = false
  notify_no_data      = false

  tags = concat(local.common_tags, var.tags, var.disk_free_space_extra_tags)
}

#
# Unacknowledged Messages high
#
resource "datadog_monitor" "unacknowledged_messages_high" {
  count   = var.unacknowledged_messages_high_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{instance.name}}] RabbitMQ Unacknowledged Messages are higher than usual"
  message = coalesce(var.unacknowledged_messages_high_message, var.message)
  type    = "query alert"

  query = <<EOQ
  ${var.unacknowledged_messages_high_time_aggregator}(${var.unacknowledged_messages_high_timeframe}):100
    * sum:rabbitmq.queue.messages_unacknowledged${module.filter-tags.query_alert} by {instance}
    / (sum:rabbitmq.queue.messages_unacknowledged${module.filter-tags.query_alert} by {instance}
    + sum:rabbitmq.queue.messages_ready${module.filter-tags.query_alert} by {instance})
    > ${var.unacknowledged_messages_high_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.unacknowledged_messages_high_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = false
  notify_no_data      = false

  tags = concat(local.common_tags, var.tags, var.unacknowledged_messages_high_extra_tags)
}

#
# High memory usage
#
resource "datadog_monitor" "memory_usage_high" {
  count   = var.memory_usage_high_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{instance.name}}] RabbitMQ Level of memory usage is too high for host: {{host.name}}"
  message = coalesce(var.memory_usage_high_message, var.message)
  type    = "query alert"

  query = <<EOQ
  ${var.memory_usage_high_time_aggregator}(${var.memory_usage_high_timeframe}):
      (avg:system.mem.total${module.filter-tags.query_alert} by {instance,host} - avg:system.mem.usable${module.filter-tags.query_alert} by {instance,host})
      / avg:system.mem.total${module.filter-tags.query_alert} by {instance,host}
    * 100
    > ${var.memory_usage_high_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.memory_usage_high_threshold_warning
    critical = var.memory_usage_high_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = false

  tags = concat(local.common_tags, var.tags, var.memory_usage_high_extra_tags)
}

#
# Messages are ready
#
resource "datadog_monitor" "messages_ready" {
  count   = var.messages_ready_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{instance.name}}] RabbitMQ Queue message(s) ready"
  message = coalesce(var.messages_ready_message, var.message)
  type    = "query alert"

  query = <<EOQ
  ${var.messages_ready_time_aggregator}(${var.messages_ready_timeframe}):
    rabbitmq.queue.messages_ready${module.filter-tags.query_alert} by {host,rabbitmq_queue}
    > ${var.messages_ready_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.messages_ready_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = false
  notify_no_data      = false

  tags = concat(local.common_tags, var.tags, var.messages_ready_extra_tags)
}

#
# No consumers
#
resource "datadog_monitor" "no_consumers" {
  count   = var.no_consumers_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{instance.name}}] RabbitMQ Number of consumers is 0 in {{rabbitmq_queue.name}}"
  message = coalesce(var.no_consumers_message, var.message)
  type    = "query alert"

  query = <<EOQ
  ${var.no_consumers_time_aggregator}(${var.no_consumers_timeframe}):
    rabbitmq.queue.consumers${module.filter-tags.query_alert} by {instance,rabbitmq_queue}
    < 1
EOQ

  monitor_thresholds {
    critical = 1
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = false
  notify_no_data      = false

  tags = concat(local.common_tags, var.tags, var.no_consumers_extra_tags)
}

#
# Messages unacknowledged rate
#
resource "datadog_monitor" "unack_rate" {
  count   = var.unack_rate_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{instance.name}}] RabbitMQ Messages unacknowledged rate is higher than usual on: {{host.name}}"
  message = coalesce(var.unack_rate_message, var.message)
  type    = "query alert"

  query = <<EOQ
  ${var.unack_rate_time_aggregator}(${var.unack_rate_timeframe}):
    anomalies(avg:rabbitmq.queue.messages_unacknowledged.rate${module.filter-tags.query_alert}
      by {rabbitmq_queue,instance,host},
      'agile', 2,
      direction='above',
      interval=60,
      alert_window='last_15m',
      count_default_zero='true',
      seasonality='hourly')
    >= 1
EOQ

  monitor_threshold_windows {
    recovery_window = "last_15m"
    trigger_window  = "last_15m"
  }

  monitor_thresholds {
    critical          = 1
    critical_recovery = "0"
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = false
  notify_no_data      = false

  tags = concat(local.common_tags, var.tags, var.unack_rate_extra_tags)
}
