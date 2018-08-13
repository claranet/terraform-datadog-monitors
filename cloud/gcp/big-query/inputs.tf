#
# Datadog global variables
#

variable "environment" {
  description = "Architecture environment"
  type        = "string"
}

variable "filter_tags" {
  description = "Tags used for filtering"
  default     = "*"
}

variable "message" {
  description = "Message sent when a monitor is triggered"
}

variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
}

variable "new_host_delay" {
  description = "Delay in seconds for the new host evaluation"
  default     = 300
}

#
# Concurrent queries
#

variable "concurrent_queries_message" {
  description = "Custom message for the Concurrent Queries monitor"
  type        = "string"
  default     = ""
}

variable "concurrent_queries_timeframe" {
  description = "Timeframe for the Concurrent Queries monitor"
  type        = "string"
  default     = "last_5m"
}

variable "concurrent_queries_threshold_warning" {
  description = "Concurrent Queries (warning threshold) (hard limit 50)"
  type        = "string"
  default     = 40
}

variable "concurrent_queries_threshold_critical" {
  description = "Concurrent Queries (critical threshold) (hard limit 50)"
  type        = "string"
  default     = 45
}

variable "concurrent_queries_silenced" {
  description = "Groups to mute for GCP Big Query Concurrent Queries monitor"
  type        = "map"
  default     = {}
}

variable "concurrent_queries_extra_tags" {
  description = "Extra tags for GCP Big Query Concurrent Queries monitor"
  type        = "list"
  default     = []
}

#
# Execution Time
#

variable "execution_time_message" {
  description = "Custom message for the Execution Time monitor"
  type        = "string"
  default     = ""
}

variable "execution_time_timeframe" {
  description = "Timeframe for the Execution Time monitor"
  type        = "string"
  default     = "last_5m"
}

variable "execution_time_threshold_warning" {
  description = "Average Execution Time in seconds (warning threshold)"
  type        = "string"
  default     = 100
}

variable "execution_time_threshold_critical" {
  description = "Average Execution Time in seconds (critical threshold)"
  type        = "string"
  default     = 150
}

variable "execution_time_silenced" {
  description = "Groups to mute for GCP Big Query Execution Time monitor. Muted by default."
  type        = "map"

  default = {}
}

variable "execution_time_extra_tags" {
  description = "Extra tags for GCP Big Query Execution Time monitor"
  type        = "list"
  default     = []
}

#
# Scanned Bytes
#

variable "scanned_bytes_message" {
  description = "Custom message for the Scanned Bytes monitor"
  type        = "string"
  default     = ""
}

variable "scanned_bytes_timeframe" {
  description = "Timeframe for the Scanned Bytes monitor"
  type        = "string"
  default     = "last_4h"
}

variable "scanned_bytes_threshold_warning" {
  description = "Scanned Bytes Bytes (warning threshold)"
  type        = "string"
  default     = 0
}

variable "scanned_bytes_threshold_critical" {
  description = "Scanned Bytes Bytes (critical threshold)"
  type        = "string"
  default     = 1
}

variable "scanned_bytes_silenced" {
  description = "Groups to mute for GCP Big Query Scanned Bytes monitor. Muted by default."
  type        = "map"

  default = {}
}

variable "scanned_bytes_extra_tags" {
  description = "Extra tags for GCP Big Query Scanned Bytes monitor"
  type        = "list"
  default     = []
}

#
# Scanned Bytes Billed
#

variable "scanned_bytes_billed_message" {
  description = "Custom message for the Scanned Bytes Billed monitor"
  type        = "string"
  default     = ""
}

variable "scanned_bytes_billed_timeframe" {
  description = "Timeframe for the Scanned Bytes Billed monitor"
  type        = "string"
  default     = "last_4h"
}

variable "scanned_bytes_billed_threshold_warning" {
  description = "Scanned Bytes Billed Bytes (warning threshold)"
  type        = "string"
  default     = 0
}

variable "scanned_bytes_billed_threshold_critical" {
  description = "Scanned Bytes Billed Bytes (critical threshold)"
  type        = "string"
  default     = 1
}

variable "scanned_bytes_billed_silenced" {
  description = "Groups to mute for GCP Big Query Scanned Bytes Billed monitor. Muted by default."
  type        = "map"

  default = {}
}

variable "scanned_bytes_billed_extra_tags" {
  description = "Extra tags for GCP Big Query Scanned Bytes Billed monitor"
  type        = "list"
  default     = []
}

#
# Available Slots
#

variable "available_slots_message" {
  description = "Custom message for the Available Slots monitor"
  type        = "string"
  default     = ""
}

variable "available_slots_timeframe" {
  description = "Timeframe for the Available Slots monitor"
  type        = "string"
  default     = "last_5m"
}

variable "available_slots_threshold_warning" {
  description = "Available Slots (warning threshold)"
  type        = "string"
  default     = 300
}

variable "available_slots_threshold_critical" {
  description = "Available Slots (critical threshold)"
  type        = "string"
  default     = 200
}

variable "available_slots_silenced" {
  description = "Groups to mute for GCP Big Query Available Slots monitor."
  type        = "map"
  default     = {}
}

variable "available_slots_extra_tags" {
  description = "Extra tags for GCP Big Query Available Slots monitor"
  type        = "list"
  default     = []
}

#
# Stored Bytes
#

variable "stored_bytes_message" {
  description = "Custom message for the Stored Bytes monitor"
  type        = "string"
  default     = ""
}

variable "stored_bytes_timeframe" {
  description = "Timeframe for the Stored Bytes monitor"
  type        = "string"
  default     = "last_5m"
}

variable "stored_bytes_threshold_warning" {
  description = "Stored Bytes in fraction (warning threshold)"
  type        = "string"
  default     = 0
}

variable "stored_bytes_threshold_critical" {
  description = "Stored Bytes in fraction (critical threshold)"
  type        = "string"
  default     = 1
}

variable "stored_bytes_silenced" {
  description = "Groups to mute for GCP Big Query Stored Bytes monitor. Muted by default."
  type        = "map"

  default = {}
}

variable "stored_bytes_extra_tags" {
  description = "Extra tags for GCP Big Query Stored Bytes monitor"
  type        = "list"
  default     = []
}

#
# Table Count
#

variable "table_count_message" {
  description = "Custom message for the Table Count monitor"
  type        = "string"
  default     = ""
}

variable "table_count_timeframe" {
  description = "Timeframe for the Table Count monitor"
  type        = "string"
  default     = "last_4h"
}

variable "table_count_threshold_warning" {
  description = "Table Count (warning threshold)"
  type        = "string"
  default     = 0
}

variable "table_count_threshold_critical" {
  description = "Table Count (critical threshold)"
  type        = "string"
  default     = 1
}

variable "table_count_silenced" {
  description = "Groups to mute for GCP Big Query Table Count monitor. Muted by default."
  type        = "map"

  default = {}
}

variable "table_count_extra_tags" {
  description = "Extra tags for GCP Big Query Table Count monitor"
  type        = "list"
  default     = []
}

#
# Uploaded Bytes
#

variable "uploaded_bytes_message" {
  description = "Custom message for the Uploaded Bytes monitor"
  type        = "string"
  default     = ""
}

variable "uploaded_bytes_timeframe" {
  description = "Timeframe for the Uploaded Bytes monitor"
  type        = "string"
  default     = "last_4h"
}

variable "uploaded_bytes_threshold_warning" {
  description = "Uploaded Bytes in Bytes (warning threshold)"
  type        = "string"
  default     = 0
}

variable "uploaded_bytes_threshold_critical" {
  description = "Uploaded Bytes in Bytes (critical threshold)"
  type        = "string"
  default     = 1
}

variable "uploaded_bytes_silenced" {
  description = "Groups to mute for GCP Big Query Uploaded Bytes monitor. Muted by default."
  type        = "map"

  default = {}
}

variable "uploaded_bytes_extra_tags" {
  description = "Extra tags for GCP Big Query Uploaded Bytes monitor"
  type        = "list"
  default     = []
}

#
# Uploaded Bytes Billed
#

variable "uploaded_bytes_billed_message" {
  description = "Custom message for the Uploaded Bytes Billed monitor"
  type        = "string"
  default     = ""
}

variable "uploaded_bytes_billed_timeframe" {
  description = "Timeframe for the Uploaded Bytes Billed monitor"
  type        = "string"
  default     = "last_4h"
}

variable "uploaded_bytes_billed_threshold_warning" {
  description = "Uploaded Bytes Billed in Bytes (warning threshold)"
  type        = "string"
  default     = 0
}

variable "uploaded_bytes_billed_threshold_critical" {
  description = "Uploaded Bytes Billed in Bytes (critical threshold)"
  type        = "string"
  default     = 1
}

variable "uploaded_bytes_billed_silenced" {
  description = "Groups to mute for GCP Big Query Uploaded Bytes Billed monitor. Muted by default."
  type        = "map"

  default = {}
}

variable "uploaded_bytes_billed_extra_tags" {
  description = "Extra tags for GCP Big Query Scanned Bytes monitor"
  type        = "list"
  default     = []
}
