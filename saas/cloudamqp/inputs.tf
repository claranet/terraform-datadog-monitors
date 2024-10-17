# Global variables
variable "tags" {
  type    = list(string)
  default = ["type:messagebroker", "provider:cloudamqp", "resource:rabbitmq"]
}

# Global DataDog
variable "filter_tags_use_defaults" {
  description = "Use default filter tags convention"
  default     = "true"
}

variable "filter_tags_custom" {
  description = "Tags used for custom filtering when filter_tags_use_defaults is false"
  default     = "host:*.cloudamqp.com"
}

variable "filter_tags_custom_excluded" {
  description = "Tags excluded for custom filtering when filter_tags_use_defaults is false"
  default     = ""
}

variable "message" {
  description = "Message sent when a monitor is triggered"
}

variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 15
}

variable "new_host_delay" {
  description = "Delay in seconds before begin to monitor new host"
  default     = 300
}

variable "new_group_delay" {
  description = "Delay in seconds before monitor new resource"
  default     = 300
}

variable "timeout_h" {
  description = "Default auto-resolving state (in hours)"
  default     = 0
}

variable "prefix_slug" {
  description = "Prefix string to prepend between brackets on every monitors names"
  default     = ""
}

variable "notify_no_data" {
  description = "Will raise no data alert if set to true"
  default     = true
}

#
# Free Space in nodes
#
variable "disk_free_space_message" {
  description = "Custom message for the Disk Space is Low monitor"
  type        = string
  default     = "{{#is_alert}}\nDisk space is extremely low. \nThis can be caused by an overload of messages or persistent messages that are being mismanaged. \nPlease resolve.\n{{/is_alert}}"
}

variable "disk_free_space_time_aggregator" {
  description = "Time aggregator for the Disk Space is Low monitor"
  type        = string
  default     = "avg"
}

variable "disk_free_space_timeframe" {
  description = "Timeframe for the Disk Space is Low monitor"
  type        = string
  default     = "last_5m"
}

variable "disk_free_space_threshold_critical" {
  description = "Disk Space is Low critical threshold"
  type        = string
  default     = 1
}

variable "disk_free_space_enabled" {
  description = "Flag to enable Disk Space is Low monitor"
  type        = string
  default     = "true"
}

variable "disk_free_space_extra_tags" {
  description = "Extra tags for Disk Space is Low monitor"
  type        = list(string)
  default     = []
}

#
# Unacknowledged Messages high
#
variable "unacknowledged_messages_high_message" {
  description = "Custom message for the Unacknowledged Messages monitor"
  type        = string
  default     = "{{#is_alert}}\nThe ratio of unacknowledged to acknowledged messages in this queue is higher than usual. \nPlease check your message pipeline. \n{{/is_alert}}"
}

variable "unacknowledged_messages_high_time_aggregator" {
  description = "Time aggregator for the Unacknowledged Messages monitor"
  type        = string
  default     = "avg"
}

variable "unacknowledged_messages_high_timeframe" {
  description = "Timeframe for the Unacknowledged Messages monitor"
  type        = string
  default     = "last_5m"
}

variable "unacknowledged_messages_high_threshold_critical" {
  description = "Unacknowledged Messages  critical threshold"
  type        = string
  default     = 120
}

variable "unacknowledged_messages_high_enabled" {
  description = "Flag to enable Unacknowledged Messages monitor"
  type        = string
  default     = "true"
}

variable "unacknowledged_messages_high_extra_tags" {
  description = "Extra tags for Unacknowledged Messages monitor"
  type        = list(string)
  default     = []
}

#
# High memory usage
#
variable "memory_usage_high_message" {
  description = "Custom message for the High memory usage monitor"
  type        = string
  default     = "RabbitMQ is using too many resources on host: {{host.name}}. It may block connections and won't be able to perform many internal operations."
}

variable "memory_usage_high_time_aggregator" {
  description = "Time aggregator for the High memory usage monitor"
  type        = string
  default     = "avg"
}

variable "memory_usage_high_timeframe" {
  description = "Timeframe for the High memory usage monitor"
  type        = string
  default     = "last_5m"
}

variable "memory_usage_high_threshold_critical" {
  description = "High memory usage critical threshold"
  type        = string
  default     = 90
}

variable "memory_usage_high_enabled" {
  description = "Flag to enable High memory usage monitor"
  type        = string
  default     = "true"
}

variable "memory_usage_high_extra_tags" {
  description = "Extra tags for High memory usage monitor"
  type        = list(string)
  default     = []
}

#
# Messages are ready
#
variable "messages_ready_message" {
  description = "Custom message for the Messages are ready monitor"
  type        = string
  default     = "Messages are ready in {{rabbitmq_queue.name}}. With messages ready in your queue, ensure you have consumers to consume these messages."
}

variable "messages_ready_time_aggregator" {
  description = "Time aggregator for the Messages are ready monitor"
  type        = string
  default     = "avg"
}

variable "messages_ready_timeframe" {
  description = "Timeframe for the Messages are ready monitor"
  type        = string
  default     = "last_5m"
}

variable "messages_ready_threshold_critical" {
  description = "Messages are ready critical threshold"
  type        = string
  default     = 1
}

variable "messages_ready_enabled" {
  description = "Flag to enable Messages are ready monitor"
  type        = string
  default     = "true"
}

variable "messages_ready_extra_tags" {
  description = "Extra tags for Messages are ready monitor"
  type        = list(string)
  default     = []
}

#
# No consumers
#
variable "no_consumers_message" {
  description = "Custom message for the No consumers monitor"
  type        = string
  default     = "RabbitMQ currently has 0 consumers in {{rabbitmq_queue.name}} on {{host.name}}. This can lead to message accumulation which can impact application latency and increased memory usage to store the accumulated messages"
}

variable "no_consumers_time_aggregator" {
  description = "Time aggregator for the No consumers monitor"
  type        = string
  default     = "avg"
}

variable "no_consumers_timeframe" {
  description = "Timeframe for the No consumers monitor"
  type        = string
  default     = "last_5m"
}

variable "no_consumers_enabled" {
  description = "Flag to enable No consumers monitor"
  type        = string
  default     = "true"
}

variable "no_consumers_extra_tags" {
  description = "Extra tags for No consumers monitor"
  type        = list(string)
  default     = []
}

#
# Messages unacknowledged rate
#
variable "unack_rate_message" {
  description = "Custom message for the Messages unacknowledged rate monitor"
  type        = string
  default     = "The rate at which messages are being delivered without receiving acknowledgement is higher than usual. There may be errors or performance issues downstream.\n\nHost: {{host.name}}\nRabbitMQ Queue: {{rabbitmq_queue.name}}"
}

variable "unack_rate_time_aggregator" {
  description = "Time aggregator for the Messages unacknowledged rate monitor"
  type        = string
  default     = "avg"
}

variable "unack_rate_timeframe" {
  description = "Timeframe for the Messages unacknowledged rate monitor"
  type        = string
  default     = "last_4h"
}

variable "unack_rate_enabled" {
  description = "Flag to enable Messages unacknowledged rate monitor"
  type        = string
  default     = "true"
}

variable "unack_rate_extra_tags" {
  description = "Extra tags for Messages unacknowledged rate monitor"
  type        = list(string)
  default     = []
}
