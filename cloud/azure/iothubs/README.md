Azure Redis DataDog monitors
============================

How to use this module
----------------------

```
module "iothubs" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/azure/iothubs?ref=MON-80-azure-hub-iot-monitors"
  
  jobs_failed_message                   = "${module.datadog-message-alerting.alerting-message}"
  listjobs_failed_message               = "${module.datadog-message-alerting.alerting-message}"
  queryjobs_failed_message              = "${module.datadog-message-alerting.alerting-message}"
  status_message                        = "${module.datadog-message-alerting.alerting-message}"
  total_devices_message                 = "${module.datadog-message-alerting.alerting-message}"
  c2d_methods_failed_message            = "${module.datadog-message-alerting.alerting-message}"
  c2d_twin_read_failed_message          = "${module.datadog-message-alerting.alerting-message}"
  c2d_twin_update_failed_message        = "${module.datadog-message-alerting.alerting-message}"
  d2c_twin_read_failed_message          = "${module.datadog-message-alerting.alerting-message}"
  d2c_twin_update_failed_message        = "${module.datadog-message-alerting.alerting-message}"
  d2c_telemetry_egress_dropped_message  = "${module.datadog-message-alerting.alerting-message}"
  d2c_telemetry_egress_orphaned_message = "${module.datadog-message-alerting.alerting-message}"
  d2c_telemetry_egress_invalid_message  = "${module.datadog-message-alerting.alerting-message}"
  d2c_telemetry_egress_fallback_message = "${module.datadog-message-alerting.alerting-message}"
  d2c_telemetry_ingress_nosent_message  = "${module.datadog-message-alerting.alerting-message}"
  
  environment     = "${var.environment}"
  stack           = "${var.stack}"
  client_name     = "${var.client_name}"
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
| c2d_methods_failed_message |  | string | - | yes |
| c2d_methods_failed_threshold_critical |  | string | `10` | no |
| c2d_methods_failed_threshold_warning |  | string | `0` | no |
| c2d_twin_read_failed_message |  | string | - | yes |
| c2d_twin_read_failed_threshold_critical |  | string | `10` | no |
| c2d_twin_read_failed_threshold_warning |  | string | `0` | no |
| c2d_twin_update_failed_message |  | string | - | yes |
| c2d_twin_update_failed_threshold_critical |  | string | `10` | no |
| c2d_twin_update_failed_threshold_warning |  | string | `0` | no |
| client_name |  | string | - | yes |
| d2c_telemetry_egress_dropped_message |  | string | - | yes |
| d2c_telemetry_egress_dropped_threshold_critical |  | string | `1000` | no |
| d2c_telemetry_egress_dropped_threshold_warning |  | string | `500` | no |
| d2c_telemetry_egress_fallback_message |  | string | - | yes |
| d2c_telemetry_egress_fallback_threshold_critical |  | string | `1000` | no |
| d2c_telemetry_egress_fallback_threshold_warning |  | string | `500` | no |
| d2c_telemetry_egress_invalid_message |  | string | - | yes |
| d2c_telemetry_egress_invalid_threshold_critical |  | string | `1000` | no |
| d2c_telemetry_egress_invalid_threshold_warning |  | string | `500` | no |
| d2c_telemetry_egress_orphaned_message |  | string | - | yes |
| d2c_telemetry_egress_orphaned_threshold_critical |  | string | `1000` | no |
| d2c_telemetry_egress_orphaned_threshold_warning |  | string | `500` | no |
| d2c_telemetry_ingress_nosent_message |  | string | - | yes |
| d2c_twin_read_failed_message |  | string | - | yes |
| d2c_twin_read_failed_threshold_critical |  | string | `10` | no |
| d2c_twin_read_failed_threshold_warning |  | string | `0` | no |
| d2c_twin_update_failed_message |  | string | - | yes |
| d2c_twin_update_failed_threshold_critical |  | string | `10` | no |
| d2c_twin_update_failed_threshold_warning |  | string | `0` | no |
| delay |  | string | `600` | no |
| environment |  | string | - | yes |
| jobs_failed_message |  | string | - | yes |
| jobs_failed_threshold_critical |  | string | `10` | no |
| jobs_failed_threshold_warning | # IOT hubs | string | `0` | no |
| listjobs_failed_message |  | string | - | yes |
| listjobs_failed_threshold_critical |  | string | `10` | no |
| listjobs_failed_threshold_warning |  | string | `0` | no |
| queryjobs_failed_message |  | string | - | yes |
| queryjobs_failed_threshold_critical |  | string | `10` | no |
| queryjobs_failed_threshold_warning |  | string | `0` | no |
| stack |  | string | - | yes |
| status_message |  | string | - | yes |
| subscription_id |  | string | - | yes |
| total_devices_message |  | string | - | yes |

Related documentation
---------------------

DataDog documentation: https://docs.datadoghq.com/integrations/azure_iot_hub/

Azure IOT Hubs metrics documentation: https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-monitor-resource-health