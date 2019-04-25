# Global Terraform
variable "environment" {
  description = "Architecture Environment"
  type        = "string"
}

# Global DataDog
variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
}

variable "new_host_delay" {
  description = "Delay in seconds before monitor new resource"
  default     = 300
}

variable "prefix_slug" {
  description = "Prefix string to prepend between brackets on every monitors names"
  default     = ""
}

variable "message" {
  description = "Message sent when an alert is triggered"
}

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

## NLB
variable "nlb_no_healthy_instance_silenced" {
  description = "Groups to mute for NLB no healty instance monitor"
  type        = "map"
  default     = {}
}

variable "nlb_no_healthy_instance_enabled" {
  description = "Flag to enable NLB no healty instance monitor"
  type        = "string"
  default     = "true"
}

variable "nlb_no_healthy_instance_extra_tags" {
  description = "Extra tags for NLB no healty instance monitor"
  type        = "list"
  default     = []
}

variable "nlb_no_healthy_instance_message" {
  description = "Custom message for NLB no healty instance monitor"
  type        = "string"
  default     = ""
}

variable "nlb_no_healthy_instance_time_aggregator" {
  description = "Monitor aggregator for NLB no healty instance [available values: min or max]"
  type        = "string"
  default     = "min"
}

variable "nlb_no_healthy_instance_timeframe" {
  description = "Monitor timeframe for NLB no healty instance [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "nlb_reset_silenced" {
  description = "Groups to mute for NLB reset monitor"
  type        = "map"
  default     = {}
}

variable "nlb_reset_enabled" {
  description = "Flag to enable NLB reset monitor"
  type        = "string"
  default     = "true"
}

variable "nlb_reset_extra_tags" {
  description = "Extra tags for NLB reset monitor"
  type        = "list"
  default     = []
}

variable "nlb_reset_message" {
  description = "Custom message for NLB reset monitor"
  type        = "string"
  default     = ""
}

variable "nlb_reset_timeframe" {
  description = "Monitor timeframe for NLB reset [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "nlb_reset_threshold_warning" {
  description = "newtork loadbalancer reset warning threshold in percentage"
  default     = 5
}

variable "nlb_reset_threshold_critical" {
  description = "network loadbalancer reset critical threshold in percentage"
  default     = 10
}

variable "artificial_requests_count" {
  default     = 5
  description = "Number of false requests used to mitigate false positive in case of low trafic"
}
