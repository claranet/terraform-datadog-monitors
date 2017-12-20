Azure Stream Analytics DataDog monitors
=======================================

How to use this module
----------------------

```
module "datadog-monitors-azure-redis" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/azure/stream-analytics?ref={revision}"

  message = "${module.datadog-message-alerting.alerting-message}"
  environment = "${var.environment}"
  subscription_id = "${var.subscription_id}"
}
```

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| conversion_errors_threshold_critical | Conversion errors limit (critical threshold) | string | `10` | no |
| conversion_errors_threshold_warning | Conversion errors limit (warning threshold) | string | `0` | no |
| delay | Delay in seconds for the metric evaluation | string | `600` | no |
| environment | Architecture environment | string | - | yes |
| failed_function_requests_threshold_critical | Failed Function Request rate limit (critical threshold) | string | `10` | no |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| function_requests_threshold_warning | Failed Function Request rate limit (warning threshold) | string | `0` | no |
| message | Message sent when a Redis monitor is triggered | string | - | yes |
| runtime_errors_threshold_critical | Runtime errors limit (critical threshold) | string | `10` | no |
| runtime_errors_threshold_warning | Runtime errors limit (warning threshold) | string | `0` | no |
| su_utilization_threshold_critical | Streaming Unit utilization rate limit (critical threshold) | string | `80` | no |
| su_utilization_threshold_warning | Streaming Unit utilization rate limit (warning threshold) | string | `60` | no |

Related documentation
---------------------

DataDog documentation: [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)
