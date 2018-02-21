# Global Terraform
variable "environment" {
  description = "Architecture Environment"
  type        = "string"
}

# Global DataDog
variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 600
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
variable "dd_aws_elb" {
  default = "disable"
}

variable "elb_4xx_threshold_warning" {
  description = "loadbalancer 4xx warning threshold in percentage"
  default     = 5
}

variable "elb_4xx_threshold_critical" {
  description = "loadbalancer 4xx critical threshold in percentage"
  default     = 10
}

variable "elb_5xx_threshold_warning" {
  description = "loadbalancer 5xx warning threshold in percentage"
  default     = 5
}

variable "elb_5xx_threshold_critical" {
  description = "loadbalancer 5xx critical threshold in percentage"
  default     = 10
}

variable "elb_backend_4xx_threshold_warning" {
  description = "loadbalancer backend 4xx warning threshold in percentage"
  default     = 5
}

variable "elb_backend_4xx_threshold_critical" {
  description = "loadbalancer backend 4xx critical threshold in percentage"
  default     = 10
}

variable "elb_backend_5xx_threshold_warning" {
  description = "loadbalancer backend 5xx warning threshold in percentage"
  default     = 5
}

variable "elb_backend_5xx_threshold_critical" {
  description = "loadbalancer backend 5xx critical threshold in percentage"
  default     = 10
}

variable "elb_backend_latency_warning" {
  description = "latency warning threshold in seconds"
  default     = 1
}

variable "elb_backend_latency_critical" {
  description = "latency critical threshold in seconds"
  default     = 5
}
