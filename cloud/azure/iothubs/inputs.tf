# Global Terraform
variable "environment" {
  description = "Architecture Environment"
  type        = "string"
}

variable "subscription_id" {
  description = "Azure account id used as filter for monitors"
  type        = "string"
}

variable "provider" {
  description = "Cloud provider which the monitor and its based metric depend on"
  type        = "string"
  default     = "azure"
}

variable "service" {
  description = "Service monitored by this set of monitors"
  type        = "string"
  default     = "storage"
}

# Global DataDog
variable "delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 600
}

variable "message" {
  description = "Message sent when an alert is triggered"
}

variable "use_filter_tags" {
  description = "Filter the data with service tags if true"
  default     = "true"
}

# Azure IOT hubs specific
variable "failed_jobs_rate_threshold_warning" {
  description = "Jobs Failed rate limit (warning threshold)"
  default     = 0
}

variable "failed_jobs_rate_threshold_critical" {
  description = "Jobs Failed rate limit (critical threshold)"
  default     = 10
}

variable "failed_listjobs_rate_threshold_warning" {
  description = "ListJobs Failed rate limit (warning threshold)"
  default     = 0
}

variable "failed_listjobs_rate_threshold_critical" {
  description = "ListJobs Failed rate limit (critical threshold)"
  default     = 10
}

variable "failed_queryjobs_rate_threshold_warning" {
  description = "QueryJobs Failed rate limit (warning threshold)"
  default     = 0
}

variable "failed_queryjobs_rate_threshold_critical" {
  description = "QueryJobs Failed rate limit (critical threshold)"
  default     = 10
}

variable "failed_c2d_methods_rate_threshold_warning" {
  description = "C2D Methods Failed rate limit (warning threshold)"
  default     = 0
}

variable "failed_c2d_methods_rate_threshold_critical" {
  description = "C2D Methods Failed rate limit (critical threshold)"
  default     = 10
}

variable "failed_c2d_twin_read_rate_threshold_warning" {
  description = "C2D Twin Read Failed rate limit (warning threshold)"
  default     = 0
}

variable "failed_c2d_twin_read_rate_threshold_critical" {
  description = "C2D Twin Read Failed rate limit (critical threshold)"
  default     = 10
}

variable "failed_c2d_twin_update_rate_threshold_warning" {
  description = "C2D Twin Update Failed rate limit (warning threshold)"
  default     = 0
}

variable "failed_c2d_twin_update_rate_threshold_critical" {
  description = "C2D Twin Update Failed rate limit (critical threshold)"
  default     = 10
}

variable "failed_d2c_twin_read_rate_threshold_warning" {
  description = "D2C Twin Read Failed rate limit (warning threshold)"
  default     = 0
}

variable "failed_d2c_twin_read_rate_threshold_critical" {
  description = "D2C Twin Read Failed rate limit (critical threshold)"
  default     = 10
}

variable "failed_d2c_twin_update_rate_threshold_warning" {
  description = "D2C Twin Update Failed rate limit (warning threshold)"
  default     = 0
}

variable "failed_d2c_twin_update_rate_threshold_critical" {
  description = "D2C Twin Update Failed rate limit (critical threshold)"
  default     = 10
}

variable "dropped_d2c_telemetry_egress_threshold_warning" {
  description = "D2C Telemetry Dropped limit (warning threshold)"
  default     = 500
}

variable "dropped_d2c_telemetry_egress_threshold_critical" {
  description = "D2C Telemetry Dropped limit (critical threshold)"
  default     = 1000
}

variable "orphaned_d2c_telemetry_egress_threshold_warning" {
  description = "D2C Telemetry Orphaned limit (warning threshold)"
  default     = 500
}

variable "orphaned_d2c_telemetry_egress_threshold_critical" {
  description = "D2C Telemetry Orphaned limit (critical threshold)"
  default     = 1000
}

variable "invalid_d2c_telemetry_egress_threshold_warning" {
  description = "D2C Telemetry Invalid limit (warning threshold)"
  default     = 500
}

variable "invalid_d2c_telemetry_egress_threshold_critical" {
  description = "D2C Telemetry Invalid limit (critical threshold)"
  default     = 1000
}

variable "fallback_d2c_telemetry_egress_threshold_warning" {
  description = "D2C Telemetry Fallback limit (warning threshold)"
  default     = 500
}

variable "fallback_d2c_telemetry_egress_threshold_critical" {
  description = "D2C Telemetry Fallback limit (critical threshold)"
  default     = 1000
}
