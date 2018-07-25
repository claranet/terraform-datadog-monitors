Custom Webcheck monitors
==========================================



How to use this module
----------------------

Run a cron Lambda that Lambda sends these metrics in DD :
custom.webcheck.steps : Number of queries done
custom.webcheck.errors : Number of errors while running the scenario
custom.webcheck.time : Total execution time
custom.webcheck.avg : Average execution time for a query Add a user to MongoDB (on the primary instance) :


Add a module in your Terraform project :

```
module "datadog-monitors-custom-webcheck" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//custom/webcheck?ref={revision}"

  message     = "${module.datadog-message-alerting.alerting-message}"
  environment = "${var.environment}"

}
```


Purpose
-------

Creates a DataDog monitors with the following checks : 
* MongoDB Primary status
* MongoDB Secondaries status
* MongoDB replication lag

**Monitor MongoDB Primary**

Name: [environment] MongoDB Primary

This monitor will check the health of the Primary node

This monitor will trigger an alert if there's no primary or if the primary state is wrong.


Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| delay | Delay in seconds for the metric evaluation | string | `15` | no |
| environment | Architecture Environment | string | - | yes |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when an alert is triggered | string | - | yes |


Related documentation 
---------------------

[]()

