# Global variables
variable "tags" {
  type    = list(string)
  default = ["type:caas", "provider:kubernetes", "resource:kubernetes-workload"]
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

variable "filter_tags_separator" {
  description = "Set the filter tags separator (, or AND)"
  default     = ","
}

variable "message" {
  description = "Message sent when a monitor is triggered"
}

variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 15
}

variable "new_host_delay" {
  description = "Delay in seconds before monitor new resource"
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

# Datadog monitors variables

variable "job_enabled" {
  description = "Flag to enable Job monitor"
  type        = string
  default     = "true"
}

variable "job_extra_tags" {
  description = "Extra tags for Job monitor"
  type        = list(string)
  default     = []
}

variable "job_message" {
  description = "Custom message for Job monitor"
  type        = string
  default     = ""
}

variable "job_threshold_warning" {
  description = "Job monitor (warning threshold)"
  type        = string
  default     = 3
}

variable "cronjob_enabled" {
  description = "Flag to enable Cronjob monitor"
  type        = string
  default     = "true"
}

variable "cronjob_extra_tags" {
  description = "Extra tags for Cronjob monitor"
  type        = list(string)
  default     = []
}

variable "cronjob_message" {
  description = "Custom message for Cronjob monitor"
  type        = string
  default     = ""
}

variable "cronjob_threshold_warning" {
  description = "Cronjob monitor (warning threshold)"
  type        = string
  default     = 3
}

variable "replica_available_enabled" {
  description = "Flag to enable Available replica monitor"
  type        = string
  default     = "true"
}

variable "replica_available_extra_tags" {
  description = "Extra tags for Available replicamonitor"
  type        = list(string)
  default     = []
}

variable "replica_available_message" {
  description = "Custom message for Available replica monitor"
  type        = string
  default     = ""
}

variable "replica_available_time_aggregator" {
  description = "Monitor aggregator for Available replica [available values: min, max or avg]"
  type        = string
  default     = "max"
}

variable "replica_available_timeframe" {
  description = "Monitor timeframe for Available replica [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "replica_available_threshold_critical" {
  default     = 1
  description = "Available replica critical threshold"
}

variable "replica_ready_enabled" {
  description = "Flag to enable Ready replica monitor"
  type        = string
  default     = "true"
}

variable "replica_ready_extra_tags" {
  description = "Extra tags for Ready replica monitor"
  type        = list(string)
  default     = []
}

variable "replica_ready_message" {
  description = "Custom message for Ready replica monitor"
  type        = string
  default     = ""
}

variable "replica_ready_time_aggregator" {
  description = "Monitor aggregator for Ready replica [available values: min, max or avg]"
  type        = string
  default     = "max"
}

variable "replica_ready_timeframe" {
  description = "Monitor timeframe for Ready replica [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "replica_ready_threshold_critical" {
  default     = 1
  description = "Ready replica critical threshold"
}

variable "replica_current_enabled" {
  description = "Flag to enable Current replica monitor"
  type        = string
  default     = "true"
}

variable "replica_current_extra_tags" {
  description = "Extra tags for Current replica monitor"
  type        = list(string)
  default     = []
}

variable "replica_current_message" {
  description = "Custom message for Current replica monitor"
  type        = string
  default     = ""
}

variable "replica_current_time_aggregator" {
  description = "Monitor aggregator for Current replica [available values: min, max or avg]"
  type        = string
  default     = "max"
}

variable "replica_current_timeframe" {
  description = "Monitor timeframe for Current replica [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "replica_current_threshold_critical" {
  default     = 1
  description = "Current replica critical threshold"
}

# DaemonSet not ready
variable "daemonset_pods_not_ready_enabled" {
  description = "Flag to enable DaemonSet pods not ready monitor"
  type        = string
  default     = "true"
}

variable "daemonset_pods_not_ready_message" {
  description = "Custom message for DaemonSet pods not ready monitor"
  type        = string
  default     = ""
}

variable "daemonset_pods_not_ready_time_aggregator" {
  description = "Monitor aggregator for DaemonSet pods not ready [available values: min, max or avg]"
  type        = string
  default     = "max"
}

variable "daemonset_pods_not_ready_timeframe" {
  description = "Monitor timeframe for DaemonSet pods not ready [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_30m"
}

variable "daemonset_pods_not_ready_threshold_critical" {
  description = "DaemonSet pods not ready critical threshold"
  type        = number
  default     = 1
}

variable "daemonset_pods_not_ready_extra_tags" {
  description = "Extra tags for DaemonSet pods not ready monitor"
  type        = list(string)
  default     = []
}

# StatefulSet not ready
variable "statefulset_pods_not_ready_enabled" {
  description = "Flag to enable StatefulSet pods not ready monitor"
  type        = string
  default     = "true"
}

variable "statefulset_pods_not_ready_message" {
  description = "Custom message for StatefulSet pods not ready monitor"
  type        = string
  default     = ""
}

variable "statefulset_pods_not_ready_time_aggregator" {
  description = "Monitor aggregator for StatefulSet pods not ready [available values: min, max or avg]"
  type        = string
  default     = "max"
}

variable "statefulset_pods_not_ready_timeframe" {
  description = "Monitor timeframe for StatefulSet pods not ready [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "statefulset_pods_not_ready_threshold_critical" {
  description = "StatefulSet pods not ready critical threshold"
  type        = number
  default     = 100
}

variable "statefulset_pods_not_ready_extra_tags" {
  description = "Extra tags for StatefulSet pods not ready monitor"
  type        = list(string)
  default     = []
}

# Deployments replica too low
variable "deployments_replica_too_low_enabled" {
  description = "Flag to enable Deployment replica too low monitor"
  type        = string
  default     = "true"
}

variable "deployments_replica_too_low_message" {
  description = "Custom message for Deployment replica too low monitor"
  type        = string
  default     = ""
}

variable "deployments_replica_too_low_time_aggregator" {
  description = "Monitor aggregator for Deployment replica too low [available values: min, max or avg]"
  type        = string
  default     = "max"
}

variable "deployments_replica_too_low_timeframe" {
  description = "Monitor timeframe for Deployment replica too low [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "deployments_replica_too_low_threshold_critical" {
  description = "Deployment replica too low critical threshold"
  type        = number
  default     = 0
}

variable "deployments_replica_too_low_extra_tags" {
  description = "Extra tags for Deployment replica too low monitor"
  type        = list(string)
  default     = []
}

# HPA cannot scale up further
variable "hpa_cannot_scaleup_further_enabled" {
  description = "Flag to enable HPA cannot scale up further monitor"
  type        = string
  default     = "true"
}

variable "hpa_cannot_scaleup_further_message" {
  description = "Custom message for HPA cannot scale up further monitor"
  type        = string
  default     = ""
}

variable "hpa_cannot_scaleup_further_time_aggregator" {
  description = "Monitor aggregator for HPA cannot scale up further [available values: min, max or avg]"
  type        = string
  default     = "avg"
}

variable "hpa_cannot_scaleup_further_timeframe" {
  description = "Monitor timeframe for HPA cannot scale up further [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_30m"
}

variable "hpa_cannot_scaleup_further_threshold_critical" {
  description = "HPA cannot scale up further critical threshold"
  type        = number
  default     = 100
}

variable "hpa_cannot_scaleup_further_threshold_warning" {
  description = "HPA cannot scale up further warning threshold"
  type        = number
  default     = 90
}

variable "hpa_cannot_scaleup_further_extra_tags" {
  description = "Extra tags for HPA cannot scale up further monitor"
  type        = list(string)
  default     = []
}

# Pod Disruption Budget not respected
variable "pod_disruption_budget_not_respected_enabled" {
  description = "Flag to enable Pod Disruption Budget not respected monitor"
  type        = string
  default     = "true"
}

variable "pod_disruption_budget_not_respected_message" {
  description = "Custom message for Pod Disruption Budget not respected monitor"
  type        = string
  default     = ""
}

variable "pod_disruption_budget_not_respected_time_aggregator" {
  description = "Monitor aggregator for Pod Disruption Budget not respected [available values: min, max or avg]"
  type        = string
  default     = "max"
}

variable "pod_disruption_budget_not_respected_timeframe" {
  description = "Monitor timeframe for Pod Disruption Budget not respected [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "pod_disruption_budget_not_respected_threshold_critical" {
  description = "Pod Disruption Budget not respected critical threshold"
  type        = number
  default     = 0
}

variable "pod_disruption_budget_not_respected_extra_tags" {
  description = "Extra tags for Pod Disruption Budget not respected monitor"
  type        = list(string)
  default     = []
}

# General filter tags
variable "replica_group_by" {
  default     = ["kube_namespace", "kube_replica_set", "kube_cluster_name"]
  description = "Select group by element on replicaset monitors"
}

variable "deployment_group_by" {
  default     = ["kube_namespace", "kube_deployment", "kube_cluster_name"]
  description = "Select group by element on deployment monitors"
}

variable "jobfailed_group_by" {
  default = ["kube_job", "kube_cluster_name"]
}

variable "cronjobfailed_group_by" {
  default = ["kube_cronjob"]
}
