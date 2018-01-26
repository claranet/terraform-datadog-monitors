AWS ALB DataDog monitors
==========================================

How to use this module
----------------------

```
module "datadog-monitors-aws-alb" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/aws/alb?ref={revision}"

  environment = "${var.environment}"
  message = "${module.datadog-message-alerting.alerting-message}"
}

```

Purpose
-------
Creates DataDog monitors with the following checks :

* ALB no healthy hosts
* ALB latency too high
* ALB http code 5xx percent to high
* ALB http code 4xx percent to high
* ALB target http code 5xx percent to high
* ALB target http code 4xx percent to high

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| delay | Delay in seconds for the metric evaluation | string | `900` | no |
| environment | Architecture environment | string | - | yes |
| filter_tags | Tags used for custom filtering | string | `*` | no |
| httpcode_elb_4xx_threshold_critical | loadbalancer 4xx critical threshold in percentage | string | `80` | no |
| httpcode_elb_4xx_threshold_warning | loadbalancer 4xx warning threshold in percentage | string | `60` | no |
| httpcode_elb_5xx_threshold_critical | loadbalancer 5xx critical threshold in percentage | string | `80` | no |
| httpcode_elb_5xx_threshold_warning | loadbalancer 5xx warning threshold in percentage | string | `60` | no |
| httpcode_target_4xx_threshold_critical | target 4xx critical threshold in percentage | string | `80` | no |
| httpcode_target_4xx_threshold_warning | target 4xx warning threshold in percentage | string | `60` | no |
| httpcode_target_5xx_threshold_critical | target 5xx critical threshold in percentage | string | `80` | no |
| httpcode_target_5xx_threshold_warning | target 5xx warning threshold in percentage | string | `60` | no |
| message | Message sent when a monitor is triggered | string | - | yes |
| latency_threshold_critical | latency critical threshold in milliseconds | string | `1000` | no |
| latency_threshold_warning | latency warning threshold in milliseconds | string | `500` | no |

Related documentation
---------------------

DataDog blog: [https://www.datadoghq.com/blog/monitor-application-load-balancer/](https://www.datadoghq.com/blog/monitor-application-load-balancer/)

AWS ALB metrics documentation: [https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-cloudwatch-metrics.html](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-cloudwatch-metrics.html)
