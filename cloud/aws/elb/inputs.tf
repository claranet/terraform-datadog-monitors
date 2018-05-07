# Global Terraform
variable "environment" {
  description = "Architecture Environment"
  type        = "string"
}

# Global DataDog
variable "delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
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

## ELB
variable "elb_no_healthy_instance_silenced" {
  description = "Groups to mute for ELB no healty instance monitor"
  type        = "map"
  default     = {}
}

variable "elb_no_healthy_instance_message" {
  description = "Custom message for ELB no healty instance monitor"
  type        = "string"
  default     = ""
}

variable "elb_no_healthy_instance_timeframe" {
  description = "Monitor timeframe for ELB no healty instance [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "elb_4xx_silenced" {
  description = "Groups to mute for ELB 4xx errors monitor"
  type        = "map"
  default     = {}
}

variable "elb_4xx_message" {
  description = "Custom message for ELB 4xx errors monitor"
  type        = "string"
  default     = ""
}

variable "elb_4xx_timeframe" {
  description = "Monitor timeframe for ELB 4xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "elb_4xx_threshold_warning" {
  description = "loadbalancer 4xx warning threshold in percentage"
  default     = 5
}

variable "elb_4xx_threshold_critical" {
  description = "loadbalancer 4xx critical threshold in percentage"
  default     = 10
}

variable "elb_5xx_silenced" {
  description = "Groups to mute for ELB 5xx errors monitor"
  type        = "map"
  default     = {}
}

variable "elb_5xx_message" {
  description = "Custom message for ELB 5xx errors monitor"
  type        = "string"
  default     = ""
}

variable "elb_5xx_timeframe" {
  description = "Monitor timeframe for ELB 5xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "elb_5xx_threshold_warning" {
  description = "loadbalancer 5xx warning threshold in percentage"
  default     = 5
}

variable "elb_5xx_threshold_critical" {
  description = "loadbalancer 5xx critical threshold in percentage"
  default     = 10
}

variable "elb_backend_4xx_silenced" {
  description = "Groups to mute for ELB backend 4xx errors monitor"
  type        = "map"
  default     = {}
}

variable "elb_backend_4xx_message" {
  description = "Custom message for ELB backend 4xx errors monitor"
  type        = "string"
  default     = ""
}

variable "elb_backend_4xx_timeframe" {
  description = "Monitor timeframe for ELB backend 4xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "elb_backend_4xx_threshold_warning" {
  description = "loadbalancer backend 4xx warning threshold in percentage"
  default     = 5
}

variable "elb_backend_4xx_threshold_critical" {
  description = "loadbalancer backend 4xx critical threshold in percentage"
  default     = 10
}

variable "elb_backend_5xx_silenced" {
  description = "Groups to mute for ELB backend 5xx errors monitor"
  type        = "map"
  default     = {}
}

variable "elb_backend_5xx_message" {
  description = "Custom message for ELB backend 5xx errors monitor"
  type        = "string"
  default     = ""
}

variable "elb_backend_5xx_timeframe" {
  description = "Monitor timeframe for ELB backend 5xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "elb_backend_5xx_threshold_warning" {
  description = "loadbalancer backend 5xx warning threshold in percentage"
  default     = 5
}

variable "elb_backend_5xx_threshold_critical" {
  description = "loadbalancer backend 5xx critical threshold in percentage"
  default     = 10
}

variable "elb_backend_latency_silenced" {
  description = "Groups to mute for ELB backend latency monitor"
  type        = "map"
  default     = {}
}

variable "elb_backend_latency_message" {
  description = "Custom message for ELB backend latency monitor"
  type        = "string"
  default     = ""
}

variable "elb_backend_latency_timeframe" {
  description = "Monitor timeframe for ELB backend latency [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "elb_backend_latency_warning" {
  description = "latency warning threshold in seconds"
  default     = 1
}

variable "elb_backend_latency_critical" {
  description = "latency critical threshold in seconds"
  default     = 5
}

variable "artificial_requests_count" {
  default     = 5
  description = "Number of false requests used to mitigate false positive in case of low trafic"
}
