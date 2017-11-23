Azure Storage DataDog monitors
==============================

How to use this module
----------------------

```
module "datadog-monitors-azure-storage" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/azure/storage?ref={revision}"

  message = "${module.datadog-message-alerting.alerting-message}"
  environment = "${var.environment}"
  subscription_id = "${var.subscription_id}"
}
```

Purpose
-------
Creates a DataDog monitors with the following checks :

* Service availability
* End to end latency
* Minimum successful requests
* Maximum timeout error requests
* Maximum network error requests
* Maximum throttling error requests
* Maximum server other error requests
* Maximum client other error requests
* Maximum authorization error requests

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| delay | Delay in seconds for the metric evaluation | string | `600` | no |
| environment | Architecture environment | string | - | yes |
| message | Message sent when a monitor is triggered | string | - | yes |
| filter_tags_default | Use default tagging convention | string | `true` | no |
| filter_tags_custom | Tags used for custom filtering when filter_tags_default is false | string | `*` | no |
| availability_threshold_critical | Minimum threshold of availability | string | `90` | no |
| successful_requests_threshold_critical | Minimum threshold of successful requests | string | `90` | no |
| latency_threshold_critical | Maximum threshold of latency in ms | string | `1000` | no |
| timeout_error_requests_threshold_critical | Maximum threshold of timeout error requests in percent | string | `35` | no |
| network_error_requests_threshold_critical | Maximum threshold of network error requests in percent | string | `35` | no |
| throttling_error_requests_threshold_critical | Maximum threshold of throttling error requests in percent | string | `50` | no |
| server_other_error_requests_threshold_critical | Maximum threshold of server other error requests in percent | string | `50` | no |
| client_other_error_requests_threshold_critical | Maximum threshold of client other error requests in percent | string | `75` | no |
| authorization_error_requests_threshold_critical | Maximum threshold of authorization error requests in percent | string | `75` | no |

Related documentation
---------------------

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_storage/](https://docs.datadoghq.com/integrations/azure_storage/)

DataDog blog: [https://www.datadoghq.com/blog/monitor-azure-storage-datadog/](https://www.datadoghq.com/blog/monitor-azure-storage-datadog/)

Azure Redis metrics documentation: [https://docs.microsoft.com/en-us/azure/storage/common/storage-monitor-storage-account](https://docs.microsoft.com/en-us/azure/storage/common/storage-monitor-storage-account)

