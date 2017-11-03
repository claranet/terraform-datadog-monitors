Azure IOT Hubs DataDog monitors
============================

How to use this module
----------------------

```
module "iothubs" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/azure/iothubs?ref=MON-80-azure-hub-iot-monitors"
  
  message         = "${module.datadog-message-alerting.alerting-message}"
  environment     = "${var.environment}"
  subscription_id = "${var.subscription_id}"
}
```

Purpose
-------
Creates a DataDog monitors with the following checks :

* Service status check
* Jobs failed average check
* Query Jobs failed average check
* List Jobs failed average check
* Total devices count check
* C2D methods failed average check
* C2D twin read failed average check
* C2D twin update failed average check
* D2C twin read failed average check
* D2C twin update failed average check
* D2C telemetry egress dropped count check
* D2C telemetry egress orphaned count check
* D2C telemetry egress invalid count check
* D2C telemetry egress fallback count check
* D2C telemetry ingress no sent count check

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| c2d_methods_failed_threshold_critical | C2D Methods Failed rate limit (critical threshold) | string | `10` | no |
| c2d_methods_failed_threshold_warning | C2D Methods Failed rate limit (warning threshold) | string | `0` | no |
| c2d_twin_read_failed_threshold_critical | C2D Twin Read Failed rate limit (critical threshold) | string | `10` | no |
| c2d_twin_read_failed_threshold_warning | C2D Twin Read Failed rate limit (warning threshold) | string | `0` | no |
| c2d_twin_update_failed_threshold_critical | C2D Twin Update Failed rate limit (critical threshold) | string | `10` | no |
| c2d_twin_update_failed_threshold_warning | C2D Twin Update Failed rate limit (warning threshold) | string | `0` | no |
| d2c_telemetry_egress_dropped_threshold_critical | D2C Telemetry Dropped Failed limit (critical threshold) | string | `1000` | no |
| d2c_telemetry_egress_dropped_threshold_warning | D2C Telemetry Dropped Failed limit (warning threshold) | string | `500` | no |
| d2c_telemetry_egress_fallback_threshold_critical | D2C Telemetry Fallback Failed limit (critical threshold) | string | `1000` | no |
| d2c_telemetry_egress_fallback_threshold_warning | D2C Telemetry Fallback Failed limit (warning threshold) | string | `500` | no |
| d2c_telemetry_egress_invalid_threshold_critical | D2C Telemetry Invalid Failed limit (critical threshold) | string | `1000` | no |
| d2c_telemetry_egress_invalid_threshold_warning | D2C Telemetry Invalid Failed limit (warning threshold) | string | `500` | no |
| d2c_telemetry_egress_orphaned_threshold_critical | D2C Telemetry Orphaned Failed limit (critical threshold) | string | `1000` | no |
| d2c_telemetry_egress_orphaned_threshold_warning | D2C Telemetry Orphaned Failed limit (warning threshold) | string | `500` | no |
| d2c_twin_read_failed_threshold_critical | D2C Twin Read Failed rate limit (critical threshold) | string | `10` | no |
| d2c_twin_read_failed_threshold_warning | D2C Twin Read Failed rate limit (warning threshold) | string | `0` | no |
| d2c_twin_update_failed_threshold_critical | D2C Twin Update Failed rate limit (critical threshold) | string | `10` | no |
| d2c_twin_update_failed_threshold_warning | D2C Twin Update Failed rate limit (warning threshold) | string | `0` | no |
| delay | Delay in seconds for the metric evaluation | string | `600` | no |
| environment | Architecture Environment | string | - | yes |
| jobs_failed_threshold_critical | Jobs Failed rate limit (critical threshold) | string | `10` | no |
| jobs_failed_threshold_warning | Jobs Failed rate limit (warning threshold) | string | `0` | no |
| listjobs_failed_threshold_critical | ListJobs Failed rate limit (critical threshold) | string | `10` | no |
| listjobs_failed_threshold_warning | ListJobs Failed rate limit (warning threshold) | string | `0` | no |
| message | Message sent when an alert is triggered | string | - | yes |
| provider | What is the monitored provider | string | azure | no |
| queryjobs_failed_threshold_critical | QueryJobs Failed rate limit (critical threshold) | string | `10` | no |
| queryjobs_failed_threshold_warning | QueryJobs Failed rate limit (warning threshold) | string | `0` | no |
| service | What is the monitored service | string | storage | no |
| subscription_id | Subscription ID used to tag monitors | string | - | yes |

Related documentation
---------------------

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_iot_hub](https://docs.datadoghq.com/integrations/azure_iot_hub)

Azure IOT Hubs metrics documentation: [https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-monitor-resource-health](https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-monitor-resource-health)
