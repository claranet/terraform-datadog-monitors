Nginx Middleware DataDog monitors
=================================

How to use this module
----------------------

```
module "datadog-monitors-nginx-middleware" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//middleware/nginx?ref={revision}"

  message     = "${module.datadog-message-alerting.alerting-message}"
  environment = "${var.environment}"
}
```

Purpose
-------
Creates a DataDog monitors with the following checks :

* Nginx process

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Architecture Environment | string | - | yes |
| evaluation_delay | Delay in seconds for the metric evaluation | string | `15` | no |
| message | Message sent when an alert is triggered | string | - | yes |
| nginx_process_message | Custom message for Nginx process monitor | string | `` | no |
| nginx_process_silenced | Groups to mute for Nginx process monitor | map | `<map>` | no |
