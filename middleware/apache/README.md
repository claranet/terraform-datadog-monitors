Apache Middleware DataDog monitors
==================================

How to use this module
----------------------

```
module "datadog-monitors-apache-middleware" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//middleware/apache?ref={revision}"

  message     = "${module.datadog-message-alerting.alerting-message}"
  environment = "${var.environment}"
}
```

Purpose
-------
Creates a DataDog monitors with the following checks :

* Apache process

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Architecture Environment | string | - | yes |
| evaluation_delay | Delay in seconds for the metric evaluation | string | `15` | no |
| message | Message sent when an alert is triggered | string | - | yes |
