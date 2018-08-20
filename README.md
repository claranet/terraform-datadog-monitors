# DataDog Monitors #

This repository is used to store all our monitors templates ready to use for generic purpose.

### How to contribute ? ###

First, you may refresh your knowledge and look at the [terminology](https://confluence.fr.clara.net/display/DAT/Getting+started).

To contribute you will need to [report an issue](https://confluence.fr.clara.net/display/DAT/Project+and+Workflow).

If you would like to resolve an issue or implement new monitors you must follow our [best practices](https://confluence.fr.clara.net/display/DAT/Templates+monitors).

### Important notes ###

* This repository represents a terraform feature and each first level directory could be imported as a terraform module, you must choose the one(s) you need.
* Each of these modules contains the most commons monitors, but they probably do not fulfill all your customer needs
* You still can create some specific DataDog monitors after importing a module, it's even advisable to complete your needs
* You will find a complete `README.md` on each module, explaining how to use it.
* The `alerting-message` module could be used to easily generate a templating message to use by default but it could be used also multiple times to generate messages for specific monitors.

### The DataDog provider ###

Before importing some modules, you must define the DataDog provider in your `main.tf`

```
provider "datadog" {
  version = "1.0.4" # if you use previous version you will have diff on monitor type

  api_key = "${var.datadog_api_key}"
  app_key = "${var.datadog_app_key}"
}
```

Both of the `datadog_api_key` and `datadog_app_key` are unique to the client.

### Module Declaration example ###

 A quick example of using a set of monitors for a given terraform module:

```

variable "oncall_24x7" {
  default = "@pagerduty-Public_Cloud_FR_-_Yoda_-_Unibail_HNO"
}

variable "oncall_office_hours" {
  default = "@pagerduty-Public_Cloud_FR_-_Yoda_-_Unibail_HO"
}

variable "oncall_nodata" {
  default = "@pagerduty-Public_Cloud_FR_-_Yoda_-_Unibail_HNO"
}

module "datadog-message-alerting" {
  source                       = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//common/alerting-message"

  message_alert                = "${var.oncall_24x7}"
  message_warning              = "${var.oncall_office_hours}"
  message_nodata               = "${var.oncall_nodata}"
}

module "datadog-monitors-my-monitors-set" {
  source                       = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//my/monitors/set?ref={revision}"

  environment                  = "${var.environment}"
  message                      = "${module.datadog-message-alerting.alerting-message}"
}
```

`my/monitors/set` represents the path to a monitors set sub directory listed above.  
The `//` is very important, it's a terraform specific syntax used to separate git url and folder path.

### Monitors summary ###

- [cloud](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/)
	- [aws](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/aws/)
		- [alb](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/aws/alb/)
		- [apigateway](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/aws/apigateway/)
		- [elasticsearch](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/aws/elasticsearch/)
		- [elb](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/aws/elb/)
		- [kinesis-firehose](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/aws/kinesis-firehose/)
		- [rds](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/aws/rds/)
		- [vpn](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/aws/vpn/)
	- [azure](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/azure/)
		- [apimanagement](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/azure/apimanagement/)
		- [app-services](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/azure/app-services/)
		- [eventhub](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/azure/eventhub/)
		- [iothubs](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/azure/iothubs/)
		- [redis](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/azure/redis/)
		- [servicebus](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/azure/servicebus/)
		- [sql-database](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/azure/sql-database/)
		- [storage](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/azure/storage/)
		- [stream-analytics](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/azure/stream-analytics/)
- [common](https://bitbucket.org/morea/terraform.feature.datadog/src/master/common/)
	- [alerting-message](https://bitbucket.org/morea/terraform.feature.datadog/src/master/common/alerting-message/)
	- [filter-tags](https://bitbucket.org/morea/terraform.feature.datadog/src/master/common/filter-tags/)
- [database](https://bitbucket.org/morea/terraform.feature.datadog/src/master/database/)
	- [mongodb](https://bitbucket.org/morea/terraform.feature.datadog/src/master/database/mongodb/)
	- [redis](https://bitbucket.org/morea/terraform.feature.datadog/src/master/database/redis/)
- [middleware](https://bitbucket.org/morea/terraform.feature.datadog/src/master/middleware/)
	- [apache](https://bitbucket.org/morea/terraform.feature.datadog/src/master/middleware/apache/)
	- [nginx](https://bitbucket.org/morea/terraform.feature.datadog/src/master/middleware/nginx/)
	- [php-fpm](https://bitbucket.org/morea/terraform.feature.datadog/src/master/middleware/php-fpm/)
- [system](https://bitbucket.org/morea/terraform.feature.datadog/src/master/system/)
	- [generic](https://bitbucket.org/morea/terraform.feature.datadog/src/master/system/generic/)
