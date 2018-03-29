Azure Redis DataDog monitors
============================

How to use this module
----------------------

```
module "datadog-monitors-azure-redis" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/azure/redis?ref={revision}"

  message     = "${module.datadog-message-alerting.alerting-message}"
  environment = "${var.environment}"
}
```

Purpose
-------
Creates a DataDog monitors with the following checks :

* Service status check
* Evicted keys count check
* Processor time (percent) threshold
* Server CPU load threshold

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| delay | Delay in seconds for the metric evaluation | string | `900` | no |
| environment | Architecture environment | string | - | yes |
| evictedkeys_limit_message | Custom message for Redis evicted keys monitor | string | `` | no |
| evictedkeys_limit_silenced | Groups to mute for Redis evicted keys monitor | map | `<map>` | no |
| evictedkeys_limit_threshold_critical | Evicted keys limit (critical threshold) | string | `100` | no |
| evictedkeys_limit_threshold_warning | Evicted keys limit (warning threshold) | string | `0` | no |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when a Redis monitor is triggered | string | - | yes |
| percent_processor_time_message | Custom message for Redis processor monitor | string | `` | no |
| percent_processor_time_silenced | Groups to mute for Redis processor monitor | map | `<map>` | no |
| percent_processor_time_threshold_critical | Processor time percent (critical threshold) | string | `80` | no |
| percent_processor_time_threshold_warning | Processor time percent (warning threshold) | string | `60` | no |
| server_load_rate_message | Custom message for Redis server load monitor | string | `` | no |
| server_load_rate_silenced | Groups to mute for Redis server load monitor | map | `<map>` | no |
| server_load_rate_threshold_critical | Server CPU load rate (critical threshold) | string | `90` | no |
| server_load_rate_threshold_warning | Server CPU load rate (warning threshold) | string | `70` | no |
| status_message | Custom message for Redis status monitor | string | `` | no |
| status_silenced | Groups to mute for Redis status monitor | map | `<map>` | no |

Related documentation
---------------------

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_redis_cache/](https://docs.datadoghq.com/integrations/azure_redis_cache/)

Azure Redis metrics documentation: [https://docs.microsoft.com/en-us/azure/redis-cache/cache-how-to-monitor](https://docs.microsoft.com/en-us/azure/redis-cache/cache-how-to-monitor)
