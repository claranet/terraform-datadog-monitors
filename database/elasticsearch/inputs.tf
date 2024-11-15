# Global variables
variable "tags" {
  type    = list(string)
  default = ["type:database", "provider:elasticsearch", "resource:elasticsearch"]
}

# Global DataDog
variable "filter_tags_use_defaults" {
  description = "Use default filter tags convention"
  default     = "true"
}

variable "filter_tags_custom" {
  description = "Tags used for custom filtering when filter_tags_use_defaults is false"
  default     = "*"
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
# Cluster Status Not Green
#
variable "cluster_status_not_green_message" {
  description = "Custom message for the Cluster Status monitor"
  type        = string
  default     = ""
}

variable "cluster_status_not_green_time_aggregator" {
  description = "Time aggregator for the Cluster Status monitor"
  type        = string
  default     = "avg"
}

variable "cluster_status_not_green_timeframe" {
  description = "Timeframe for the Cluster Status monitor"
  type        = string
  default     = "last_5m"
}

variable "cluster_status_not_green_threshold_warning" {
  description = "Cluster Status warning threshold"
  type        = string
  default     = 1
}

variable "cluster_status_not_green_threshold_critical" {
  description = "Cluster Status  critical threshold"
  type        = string
  default     = 0
}

variable "cluster_status_not_green_enabled" {
  description = "Flag to enable Cluster Status monitor"
  type        = string
  default     = "true"
}

variable "cluster_status_not_green_extra_tags" {
  description = "Extra tags for Cluster Status monitor"
  type        = list(string)
  default     = []
}

#
# Cluster Initializing Shards
#
variable "cluster_initializing_shards_message" {
  description = "Custom message for the Cluster Status monitor"
  type        = string
  default     = ""
}

variable "cluster_initializing_shards_time_aggregator" {
  description = "Time aggregator for the Cluster Status monitor"
  type        = string
  default     = "avg"
}

variable "cluster_initializing_shards_timeframe" {
  description = "Timeframe for the Cluster Status monitor"
  type        = string
  default     = "last_5m"
}

variable "cluster_initializing_shards_threshold_warning" {
  description = "Cluster Status warning threshold"
  type        = string
  default     = 1
}

variable "cluster_initializing_shards_threshold_critical" {
  description = "Cluster Status  critical threshold"
  type        = string
  default     = 2
}

variable "cluster_initializing_shards_enabled" {
  description = "Flag to enable Cluster Status monitor"
  type        = string
  default     = "true"
}

variable "cluster_initializing_shards_extra_tags" {
  description = "Extra tags for Cluster Status monitor"
  type        = list(string)
  default     = []
}

#
# Cluster Relocating Shards
#
variable "cluster_relocating_shards_message" {
  description = "Custom message for the Cluster Status monitor"
  type        = string
  default     = ""
}

variable "cluster_relocating_shards_time_aggregator" {
  description = "Time aggregator for the Cluster Status monitor"
  type        = string
  default     = "avg"
}

variable "cluster_relocating_shards_timeframe" {
  description = "Timeframe for the Cluster Status monitor"
  type        = string
  default     = "last_5m"
}

variable "cluster_relocating_shards_threshold_warning" {
  description = "Cluster Status warning threshold"
  type        = string
  default     = 1
}

variable "cluster_relocating_shards_threshold_critical" {
  description = "Cluster Status  critical threshold"
  type        = string
  default     = 2
}

variable "cluster_relocating_shards_enabled" {
  description = "Flag to enable Cluster Status monitor"
  type        = string
  default     = "true"
}

variable "cluster_relocating_shards_extra_tags" {
  description = "Extra tags for Cluster Status monitor"
  type        = list(string)
  default     = []
}

#
# Cluster Unassigned Shards
#
variable "cluster_unassigned_shards_message" {
  description = "Custom message for the Cluster Status monitor"
  type        = string
  default     = ""
}

variable "cluster_unassigned_shards_time_aggregator" {
  description = "Time aggregator for the Cluster Status monitor"
  type        = string
  default     = "avg"
}

variable "cluster_unassigned_shards_timeframe" {
  description = "Timeframe for the Cluster Status monitor"
  type        = string
  default     = "last_5m"
}

variable "cluster_unassigned_shards_threshold_warning" {
  description = "Cluster Status warning threshold"
  type        = string
  default     = 1
}

variable "cluster_unassigned_shards_threshold_critical" {
  description = "Cluster Status  critical threshold"
  type        = string
  default     = 2
}

variable "cluster_unassigned_shards_enabled" {
  description = "Flag to enable Cluster Status monitor"
  type        = string
  default     = "true"
}

variable "cluster_unassigned_shards_extra_tags" {
  description = "Extra tags for Cluster Status monitor"
  type        = list(string)
  default     = []
}

#
# Free Space in nodes
#
variable "node_free_space_message" {
  description = "Custom message for the Cluster Status monitor"
  type        = string
  default     = ""
}

variable "node_free_space_time_aggregator" {
  description = "Time aggregator for the Cluster Status monitor"
  type        = string
  default     = "sum"
}

variable "node_free_space_timeframe" {
  description = "Timeframe for the Cluster Status monitor"
  type        = string
  default     = "last_5m"
}

variable "node_free_space_threshold_warning" {
  description = "Cluster Status warning threshold"
  type        = string
  default     = 20
}

variable "node_free_space_threshold_critical" {
  description = "Cluster Status  critical threshold"
  type        = string
  default     = 10
}

variable "node_free_space_enabled" {
  description = "Flag to enable Cluster Status monitor"
  type        = string
  default     = "true"
}

variable "node_free_space_extra_tags" {
  description = "Extra tags for Cluster Status monitor"
  type        = list(string)
  default     = []
}

#
# JVM Heap Memory Usage
#
variable "jvm_heap_memory_usage_message" {
  description = "Custom message for the Cluster Status monitor"
  type        = string
  default     = ""
}

variable "jvm_heap_memory_usage_time_aggregator" {
  description = "Time aggregator for the Cluster Status monitor"
  type        = string
  default     = "avg"
}

variable "jvm_heap_memory_usage_timeframe" {
  description = "Timeframe for the Cluster Status monitor"
  type        = string
  default     = "last_5m"
}

variable "jvm_heap_memory_usage_threshold_warning" {
  description = "Cluster Status warning threshold"
  type        = string
  default     = 80
}

variable "jvm_heap_memory_usage_threshold_critical" {
  description = "Cluster Status  critical threshold"
  type        = string
  default     = 90
}

variable "jvm_heap_memory_usage_enabled" {
  description = "Flag to enable Cluster Status monitor"
  type        = string
  default     = "true"
}

variable "jvm_heap_memory_usage_extra_tags" {
  description = "Extra tags for Cluster Status monitor"
  type        = list(string)
  default     = []
}

#
# JVM Memory Young Usage
#
variable "jvm_memory_young_usage_message" {
  description = "Custom message for the Cluster Status monitor"
  type        = string
  default     = ""
}

variable "jvm_memory_young_usage_time_aggregator" {
  description = "Time aggregator for the Cluster Status monitor"
  type        = string
  default     = "avg"
}

variable "jvm_memory_young_usage_timeframe" {
  description = "Timeframe for the Cluster Status monitor"
  type        = string
  default     = "last_10m"
}

variable "jvm_memory_young_usage_threshold_warning" {
  description = "Cluster Status warning threshold"
  type        = string
  default     = 80
}

variable "jvm_memory_young_usage_threshold_critical" {
  description = "Cluster Status  critical threshold"
  type        = string
  default     = 90
}

variable "jvm_memory_young_usage_enabled" {
  description = "Flag to enable Cluster Status monitor"
  type        = string
  default     = "true"
}

variable "jvm_memory_young_usage_extra_tags" {
  description = "Extra tags for Cluster Status monitor"
  type        = list(string)
  default     = []
}

#
# JVM Memory Old Usage
#
variable "jvm_memory_old_usage_message" {
  description = "Custom message for the Cluster Status monitor"
  type        = string
  default     = ""
}

variable "jvm_memory_old_usage_time_aggregator" {
  description = "Time aggregator for the Cluster Status monitor"
  type        = string
  default     = "avg"
}

variable "jvm_memory_old_usage_timeframe" {
  description = "Timeframe for the Cluster Status monitor"
  type        = string
  default     = "last_10m"
}

variable "jvm_memory_old_usage_threshold_warning" {
  description = "Cluster Status warning threshold"
  type        = string
  default     = 80
}

variable "jvm_memory_old_usage_threshold_critical" {
  description = "Cluster Status  critical threshold"
  type        = string
  default     = 90
}

variable "jvm_memory_old_usage_enabled" {
  description = "Flag to enable Cluster Status monitor"
  type        = string
  default     = "true"
}

variable "jvm_memory_old_usage_extra_tags" {
  description = "Extra tags for Cluster Status monitor"
  type        = list(string)
  default     = []
}

#
# JVM Garbace Collector Old Collection Latency
#
variable "jvm_gc_old_collection_latency_message" {
  description = "Custom message for the Cluster Status monitor"
  type        = string
  default     = ""
}

variable "jvm_gc_old_collection_latency_time_aggregator" {
  description = "Time aggregator for the Cluster Status monitor"
  type        = string
  default     = "avg"
}

variable "jvm_gc_old_collection_latency_timeframe" {
  description = "Timeframe for the Cluster Status monitor"
  type        = string
  default     = "last_15m"
}

variable "jvm_gc_old_collection_latency_threshold_warning" {
  description = "Cluster Status warning threshold"
  type        = string
  default     = 200
}

variable "jvm_gc_old_collection_latency_threshold_critical" {
  description = "Cluster Status  critical threshold"
  type        = string
  default     = 300
}

variable "jvm_gc_old_collection_latency_enabled" {
  description = "Flag to enable Cluster Status monitor"
  type        = string
  default     = "true"
}

variable "jvm_gc_old_collection_latency_extra_tags" {
  description = "Extra tags for Cluster Status monitor"
  type        = list(string)
  default     = []
}

#
# JVM Garbace Collector Young Collection Latency
#
variable "jvm_gc_young_collection_latency_message" {
  description = "Custom message for the Cluster Status monitor"
  type        = string
  default     = ""
}

variable "jvm_gc_young_collection_latency_time_aggregator" {
  description = "Time aggregator for the Cluster Status monitor"
  type        = string
  default     = "avg"
}

variable "jvm_gc_young_collection_latency_timeframe" {
  description = "Timeframe for the Cluster Status monitor"
  type        = string
  default     = "last_15m"
}

variable "jvm_gc_young_collection_latency_threshold_warning" {
  description = "Cluster Status warning threshold"
  type        = string
  default     = 20
}

variable "jvm_gc_young_collection_latency_threshold_critical" {
  description = "Cluster Status  critical threshold"
  type        = string
  default     = 40
}

variable "jvm_gc_young_collection_latency_enabled" {
  description = "Flag to enable Cluster Status monitor"
  type        = string
  default     = "true"
}

variable "jvm_gc_young_collection_latency_extra_tags" {
  description = "Extra tags for Cluster Status monitor"
  type        = list(string)
  default     = []
}

#
# Indexing Latency
#
variable "indexing_latency_message" {
  description = "Custom message for the Cluster Status monitor"
  type        = string
  default     = ""
}

variable "indexing_latency_time_aggregator" {
  description = "Time aggregator for the Cluster Status monitor"
  type        = string
  default     = "avg"
}

variable "indexing_latency_timeframe" {
  description = "Timeframe for the Cluster Status monitor"
  type        = string
  default     = "last_10m"
}

variable "indexing_latency_threshold_warning" {
  description = "Cluster Status warning threshold"
  type        = string
  default     = 15
}

variable "indexing_latency_threshold_critical" {
  description = "Cluster Status  critical threshold"
  type        = string
  default     = 30
}

variable "indexing_latency_enabled" {
  description = "Flag to enable Cluster Status monitor"
  type        = string
  default     = "true"
}

variable "indexing_latency_extra_tags" {
  description = "Extra tags for Cluster Status monitor"
  type        = list(string)
  default     = []
}

#
# Flush Latency
#
variable "flush_latency_message" {
  description = "Custom message for the Cluster Status monitor"
  type        = string
  default     = ""
}

variable "flush_latency_time_aggregator" {
  description = "Time aggregator for the Cluster Status monitor"
  type        = string
  default     = "avg"
}

variable "flush_latency_timeframe" {
  description = "Timeframe for the Cluster Status monitor"
  type        = string
  default     = "last_15m"
}

variable "flush_latency_threshold_warning" {
  description = "Cluster Status warning threshold"
  type        = string
  default     = 100
}

variable "flush_latency_threshold_critical" {
  description = "Cluster Status  critical threshold"
  type        = string
  default     = 150
}

variable "flush_latency_enabled" {
  description = "Flag to enable Cluster Status monitor"
  type        = string
  default     = "true"
}

variable "flush_latency_extra_tags" {
  description = "Extra tags for Cluster Status monitor"
  type        = list(string)
  default     = []
}

#
# Open HTTP Connections Anomaly
#
variable "http_connections_anomaly_message" {
  description = "Custom message for the Cluster Status monitor"
  type        = string
  default     = ""
}

variable "http_connections_anomaly_time_aggregator" {
  description = "Time aggregator for the Cluster Status monitor"
  type        = string
  default     = "avg"
}

variable "http_connections_anomaly_timeframe" {
  description = "Timeframe for the Cluster Status monitor"
  type        = string
  default     = "last_4h"
}

variable "http_connections_anomaly_detection_algorithm" {
  description = "Anomaly Detection Algorithm used"
  type        = string
  default     = "agile"
}

variable "http_connections_anomaly_deviations" {
  description = "Deviations to detect the anomaly"
  type        = string
  default     = 2
}

variable "http_connections_anomaly_direction" {
  description = "Direction of the anomaly. It can be both, below or above."
  type        = string
  default     = "above"
}

variable "http_connections_anomaly_alert_window" {
  description = "Alert window."
  type        = string
  default     = "last_15m"
}

variable "http_connections_anomaly_interval" {
  description = "Interval."
  type        = string
  default     = 60
}

variable "http_connections_anomaly_count_default_zero" {
  description = "Count default zero."
  type        = string
  default     = "true"
}

variable "http_connections_anomaly_seasonality" {
  description = "Seasonality of the algorithm"
  type        = string
  default     = "hourly"
}

variable "http_connections_anomaly_threshold_warning" {
  description = "Cluster Status warning threshold"
  type        = string
  default     = 0.75
}

variable "http_connections_anomaly_threshold_critical" {
  description = "Cluster Status  critical threshold"
  type        = string
  default     = 1
}

variable "http_connections_anomaly_enabled" {
  description = "Flag to enable Cluster Status monitor"
  type        = string
  default     = "true"
}

variable "http_connections_anomaly_extra_tags" {
  description = "Extra tags for Cluster Status monitor"
  type        = list(string)
  default     = []
}

#
# Query Latency
#
variable "search_query_latency_message" {
  description = "Custom message for the Cluster Status monitor"
  type        = string
  default     = ""
}

variable "search_query_latency_time_aggregator" {
  description = "Time aggregator for the Cluster Status monitor"
  type        = string
  default     = "avg"
}

variable "search_query_latency_timeframe" {
  description = "Timeframe for the Cluster Status monitor"
  type        = string
  default     = "last_15m"
}

variable "search_query_latency_threshold_warning" {
  description = "Cluster Status warning threshold"
  type        = string
  default     = 10
}

variable "search_query_latency_threshold_critical" {
  description = "Cluster Status  critical threshold"
  type        = string
  default     = 20
}

variable "search_query_latency_enabled" {
  description = "Flag to enable Cluster Status monitor"
  type        = string
  default     = "true"
}

variable "search_query_latency_extra_tags" {
  description = "Extra tags for Cluster Status monitor"
  type        = list(string)
  default     = []
}

#
# Fetch Latency
#
variable "fetch_latency_message" {
  description = "Custom message for the Cluster Status monitor"
  type        = string
  default     = ""
}

variable "fetch_latency_time_aggregator" {
  description = "Time aggregator for the Cluster Status monitor"
  type        = string
  default     = "min"
}

variable "fetch_latency_timeframe" {
  description = "Timeframe for the Cluster Status monitor"
  type        = string
  default     = "last_15m"
}

variable "fetch_latency_threshold_warning" {
  description = "Cluster Status warning threshold"
  type        = string
  default     = 10
}

variable "fetch_latency_threshold_critical" {
  description = "Cluster Status  critical threshold"
  type        = string
  default     = 20
}

variable "fetch_latency_enabled" {
  description = "Flag to enable Cluster Status monitor"
  type        = string
  default     = "true"
}

variable "fetch_latency_extra_tags" {
  description = "Extra tags for Cluster Status monitor"
  type        = list(string)
  default     = []
}

#
# Search Query Change
#
variable "search_query_change_message" {
  description = "Custom message for the Cluster Status monitor"
  type        = string
  default     = ""
}

variable "search_query_change_time_aggregator" {
  description = "Time aggregator for the Cluster Status monitor"
  type        = string
  default     = "avg"
}

variable "search_query_change_timeframe" {
  description = "Timeframe for the Cluster Status monitor"
  type        = string
  default     = "last_10m"
}

variable "search_query_change_timeshift" {
  description = "Timeshift for the Cluster Status monitor"
  type        = string
  default     = "last_10m"
}

variable "search_query_change_threshold_warning" {
  description = "Cluster Status warning threshold"
  type        = string
  default     = 75
}

variable "search_query_change_threshold_critical" {
  description = "Cluster Status  critical threshold"
  type        = string
  default     = 100
}

variable "search_query_change_enabled" {
  description = "Flag to enable Cluster Status monitor"
  type        = string
  default     = "true"
}

variable "search_query_change_extra_tags" {
  description = "Extra tags for Cluster Status monitor"
  type        = list(string)
  default     = []
}

#
# Fetch Change
#
variable "fetch_change_message" {
  description = "Custom message for the Cluster Status monitor"
  type        = string
  default     = ""
}

variable "fetch_change_time_aggregator" {
  description = "Time aggregator for the Cluster Status monitor"
  type        = string
  default     = "avg"
}

variable "fetch_change_timeframe" {
  description = "Timeframe for the Cluster Status monitor"
  type        = string
  default     = "last_10m"
}

variable "fetch_change_timeshift" {
  description = "Timeshift for the Cluster Status monitor"
  type        = string
  default     = "last_10m"
}

variable "fetch_change_threshold_warning" {
  description = "Cluster Status warning threshold"
  type        = string
  default     = 75
}

variable "fetch_change_threshold_critical" {
  description = "Cluster Status  critical threshold"
  type        = string
  default     = 100
}

variable "fetch_change_enabled" {
  description = "Flag to enable Cluster Status monitor"
  type        = string
  default     = "true"
}

variable "fetch_change_extra_tags" {
  description = "Extra tags for Cluster Status monitor"
  type        = list(string)
  default     = []
}

#
# Field Data Evictions
#
variable "field_data_evictions_change_message" {
  description = "Custom message for the Cluster Status monitor"
  type        = string
  default     = ""
}

variable "field_data_evictions_change_time_aggregator" {
  description = "Time aggregator for the Cluster Status monitor"
  type        = string
  default     = "avg"
}

variable "field_data_evictions_change_timeframe" {
  description = "Timeframe for the Cluster Status monitor"
  type        = string
  default     = "last_15m"
}

variable "field_data_evictions_change_timeshift" {
  description = "Timeframe for the Cluster Status monitor"
  type        = string
  default     = "last_15m"
}

variable "field_data_evictions_change_threshold_warning" {
  description = "Cluster Status warning threshold"
  type        = string
  default     = 60
}

variable "field_data_evictions_change_threshold_critical" {
  description = "Cluster Status  critical threshold"
  type        = string
  default     = 120
}

variable "field_data_evictions_change_enabled" {
  description = "Flag to enable Cluster Status monitor"
  type        = string
  default     = "true"
}

variable "field_data_evictions_change_extra_tags" {
  description = "Extra tags for Cluster Status monitor"
  type        = list(string)
  default     = []
}

#
# Query Cache Evictions
#
variable "query_cache_evictions_change_message" {
  description = "Custom message for the Cluster Status monitor"
  type        = string
  default     = ""
}

variable "query_cache_evictions_change_time_aggregator" {
  description = "Time aggregator for the Cluster Status monitor"
  type        = string
  default     = "avg"
}

variable "query_cache_evictions_change_timeframe" {
  description = "Timeframe for the Cluster Status monitor"
  type        = string
  default     = "last_15m"
}

variable "query_cache_evictions_change_timeshift" {
  description = "Timeframe for the Cluster Status monitor"
  type        = string
  default     = "last_15m"
}

variable "query_cache_evictions_change_threshold_warning" {
  description = "Cluster Status warning threshold"
  type        = string
  default     = 60
}

variable "query_cache_evictions_change_threshold_critical" {
  description = "Cluster Status  critical threshold"
  type        = string
  default     = 120
}

variable "query_cache_evictions_change_enabled" {
  description = "Flag to enable Cluster Status monitor"
  type        = string
  default     = "true"
}

variable "query_cache_evictions_change_extra_tags" {
  description = "Extra tags for Cluster Status monitor"
  type        = list(string)
  default     = []
}

#
# Request Cache Evictions
#
variable "request_cache_evictions_change_message" {
  description = "Custom message for the Cluster Status monitor"
  type        = string
  default     = ""
}

variable "request_cache_evictions_change_time_aggregator" {
  description = "Time aggregator for the Cluster Status monitor"
  type        = string
  default     = "avg"
}

variable "request_cache_evictions_change_timeframe" {
  description = "Timeframe for the Cluster Status monitor"
  type        = string
  default     = "last_15m"
}

variable "request_cache_evictions_change_timeshift" {
  description = "Timeshift for the Cluster Status monitor"
  type        = string
  default     = "last_15m"
}

variable "request_cache_evictions_change_threshold_warning" {
  description = "Cluster Status warning threshold"
  type        = string
  default     = 60
}

variable "request_cache_evictions_change_threshold_critical" {
  description = "Cluster Status  critical threshold"
  type        = string
  default     = 120
}

variable "request_cache_evictions_change_enabled" {
  description = "Flag to enable Cluster Status monitor"
  type        = string
  default     = "true"
}

variable "request_cache_evictions_change_extra_tags" {
  description = "Extra tags for Cluster Status monitor"
  type        = list(string)
  default     = []
}

#
# Task Time in Queue
#
variable "task_time_in_queue_change_message" {
  description = "Custom message for the Cluster Status monitor"
  type        = string
  default     = ""
}

variable "task_time_in_queue_change_time_aggregator" {
  description = "Time aggregator for the Cluster Status monitor"
  type        = string
  default     = "avg"
}

variable "task_time_in_queue_change_timeframe" {
  description = "Timeframe for the Cluster Status monitor"
  type        = string
  default     = "last_10m"
}

variable "task_time_in_queue_change_timeshift" {
  description = "Timeshift for the Cluster Status monitor"
  type        = string
  default     = "last_10m"
}

variable "task_time_in_queue_change_threshold_warning" {
  description = "Cluster Status warning threshold"
  type        = string
  default     = 100
}

variable "task_time_in_queue_change_threshold_critical" {
  description = "Cluster Status  critical threshold"
  type        = string
  default     = 200
}

variable "task_time_in_queue_change_enabled" {
  description = "Flag to enable Cluster Status monitor"
  type        = string
  default     = "true"
}

variable "task_time_in_queue_change_extra_tags" {
  description = "Extra tags for Cluster Status monitor"
  type        = list(string)
  default     = []
}

#
# Service Check
#

variable "not_responding_enabled" {
  description = "Flag to enable Elasticsearch does not respond monitor"
  type        = string
  default     = "true"
}

variable "not_responding_message" {
  description = "Custom message for Elasticsearch does not respond monitor"
  type        = string
  default     = ""
}

variable "not_responding_threshold_warning" {
  description = "Elasticsearch not responding limit (warning threshold)"
  default     = 3
}

variable "not_responding_no_data_timeframe" {
  description = "Elasticsearch not responding monitor no data timeframe"
  type        = string
  default     = 10
}

variable "not_responding_extra_tags" {
  description = "Extra tags for Elasticsearch does not respond monitor"
  type        = list(string)
  default     = []
}

#
# SLM - Snapshots Failed
#

variable "slm_snapshots_failed_enabled" {
  description = "Flag to enable SLM Snapshots Failed monitor"
  type        = string
  default     = "true"
}

variable "slm_snapshots_failed_message" {
  description = "Custom message for SLM Snapshots Failed monitor"
  type        = string
  default     = ""
}

variable "slm_snapshots_failed_time_aggregator" {
  description = "Time aggregator for SLM Snapshots Failed monitor"
  type        = string
}

variable "slm_snapshots_failed_threshold_critical" {
  description = "SLM Snapshots Failed critical threshold"
  type        = string
  default     = 1
}

variable "slm_snapshots_failed_timeframe" {
  description = "SLM Snapshots Failed timeframe"
  type        = string
  default     = "last_5m"
}

variable "slm_snapshots_failed_extra_tags" {
  description = "Extra tags for SLM Snapshots Failed monitor"
  type        = list(string)
  default     = []
}

#
# SLM - Snapshot deletion failures
#

variable "slm_snapshot_deletion_failures_enabled" {
  description = "Flag to enable SLM Snapshot deletion failures monitor"
  type        = string
  default     = "true"
}

variable "slm_snapshot_deletion_failures_message" {
  description = "Custom message for SLM Snapshot deletion failures monitor"
  type        = string
  default     = ""
}

variable "slm_snapshot_deletion_failures_time_aggregator" {
  description = "Time aggregator for SLM Snapshot deletion failures monitor"
  type        = string
}

variable "slm_snapshot_deletion_failures_threshold_critical" {
  description = "SLM Snapshot deletion failures critical threshold"
  type        = string
  default     = 1
}

variable "slm_snapshot_deletion_failures_timeframe" {
  description = "SLM Snapshot deletion failures timeframe"
  type        = string
  default     = "last_5m"
}

variable "slm_snapshot_deletion_failures_extra_tags" {
  description = "Extra tags for SLM Snapshot deletion failures monitor"
  type        = list(string)
  default     = []
}
