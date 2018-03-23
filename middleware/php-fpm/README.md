PHP FPM Middleware DataDog monitors
===================================

How to use this module
----------------------

```
module "datadog-monitors-php-fpm-middleware" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//middleware/php-fpm?ref={revision}"

  message     = "${module.datadog-message-alerting.alerting-message}"
  environment = "${var.environment}"
}
```

Purpose
-------
Creates a DataDog monitors with the following checks :

* PHP FPM process
* PHP FPM load

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Architecture Environment | string | - | yes |
| evaluation_delay_metric | Delay in seconds for the metric evaluation | string | `600` | no |
| evaluation_delay_service | Delay in seconds for the metric evaluation | string | `15` | no |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when an alert is triggered | string | - | yes |
| php_fpm_busy_message | Custom message for PHP FPM busy worker monitor | string | `` | no |
| php_fpm_busy_silenced | Groups to mute for PHP FPM busy worker monitor | map | `<map>` | no |
| php_fpm_busy_threshold_critical | php fpm busy critical threshold | string | `0.9` | no |
| php_fpm_busy_threshold_warning | php fpm busy warning threshold | string | `0.8` | no |
| php_fpm_connect_message | Custom message for PHP FPM process monitor | string | `` | no |
| php_fpm_connect_silenced | Groups to mute for PHP FPM process monitor | map | `<map>` | no |