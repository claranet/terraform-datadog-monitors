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
| conversion_errors_threshold_critical |  | string | `10` | no |
| conversion_errors_threshold_warning |  | string | `0` | no |
| delay | Delay in seconds for the metric evaluation | string | `600` | no |
| environment | Architecture environment | string | - | yes |
| function_requests_threshold_critical |  | string | `10` | no |
| function_requests_threshold_warning |  | string | `0` | no |
| message | Message sent when a monitor is triggered | string | - | yes |
| notify_no_data |  | string | `false` | no |
| runtime_errors_threshold_critical |  | string | `10` | no |
| runtime_errors_threshold_warning |  | string | `0` | no |
| su_utilization_threshold_critical |  | string | `80` | no |
| su_utilization_threshold_warning | Monitor specific | string | `60` | no |
| subscription_id | Azure account id used as filter for monitors | string | - | yes |
| use_filter_tags | Filter the data with service tags if true | string | `true` | no |

Related documentation
---------------------

DataDog documentation: [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)
