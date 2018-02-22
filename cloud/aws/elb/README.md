AWS ELB DataDog monitors
========================

How to use this module
----------------------

```
module "datadog-monitors-aws-elb" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/aws/elb?ref={revision}"

  environment = "${var.environment}"
  message = "${module.datadog-message-alerting.alerting-message}"
}

```

Purpose
-------
Creates DataDog monitors with the following checks :

* ELB no healthy hosts
* ELB latency too high
* ELB http code 4xx percent to high
* ELB http code 5xx percent to high
* ELB backend http code 4xx percent to high
* ELB backend http code 5xx percent to high

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| dd_aws_elb | # ELB | string | `disable` | no |
| elb_4xx_threshold_critical | loadbalancer 4xx critical threshold in percentage | string | `10` | no |
| elb_4xx_threshold_warning | loadbalancer 4xx warning threshold in percentage | string | `5` | no |
| elb_5xx_threshold_critical | loadbalancer 5xx critical threshold in percentage | string | `10` | no |
| elb_5xx_threshold_warning | loadbalancer 5xx warning threshold in percentage | string | `5` | no |
| elb_backend_4xx_threshold_critical | loadbalancer backend 4xx critical threshold in percentage | string | `10` | no |
| elb_backend_4xx_threshold_warning | loadbalancer backend 4xx warning threshold in percentage | string | `5` | no |
| elb_backend_5xx_threshold_critical | loadbalancer backend 5xx critical threshold in percentage | string | `10` | no |
| elb_backend_5xx_threshold_warning | loadbalancer backend 5xx warning threshold in percentage | string | `5` | no |
| elb_backend_latency_critical | latency critical threshold in seconds | string | `5` | no |
| elb_backend_latency_warning | latency warning threshold in seconds | string | `1` | no |
| environment | Architecture Environment | string | - | yes |
| evaluation_delay | Delay in seconds for the metric evaluation | string | `600` | no |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when an alert is triggered | string | - | yes |