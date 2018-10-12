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
  version = "1.1.0" # if you use version before 1.0.4 you will have diff on monitor type

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

- [caas](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/caas/)
	- [kubernetes](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/caas/kubernetes/)
		- [ark](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/caas/kubernetes/ark/)
		- [ingress](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/caas/kubernetes/ingress/)
- [cloud](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/)
	- [aws](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/aws/)
		- [alb](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/aws/alb/)
		- [apigateway](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/aws/apigateway/)
		- [elasticache](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/aws/elasticache/)
			- [common](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/aws/elasticache/common/)
			- [memcached](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/aws/elasticache/memcached/)
			- [redis](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/aws/elasticache/redis/)
		- [elasticsearch](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/aws/elasticsearch/)
		- [elb](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/aws/elb/)
		- [kinesis-firehose](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/aws/kinesis-firehose/)
		- [rds](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/aws/rds/)
			- [aurora](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/aws/rds/aurora/)
				- [mysql](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/aws/rds/aurora/mysql/)
				- [postgresql](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/aws/rds/aurora/postgresql/)
			- [common](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/aws/rds/common/)
		- [vpn](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/aws/vpn/)
	- [azure](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/azure/)
		- [apimanagement](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/azure/apimanagement/)
		- [app-services](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/azure/app-services/)
		- [cosmosdb](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/azure/cosmosdb/)
		- [datalakestore](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/azure/datalakestore/)
		- [eventhub](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/azure/eventhub/)
		- [iothubs](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/azure/iothubs/)
		- [keyvault](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/azure/keyvault/)
		- [mysql](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/azure/mysql/)
		- [postgresql](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/azure/postgresql/)
		- [redis](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/azure/redis/)
		- [serverfarms](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/azure/serverfarms/)
		- [servicebus](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/azure/servicebus/)
		- [sql-database](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/azure/sql-database/)
		- [storage](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/azure/storage/)
		- [stream-analytics](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/azure/stream-analytics/)
	- [gcp](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/gcp/)
		- [big-query](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/gcp/big-query/)
		- [cloud-sql](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/gcp/cloud-sql/)
			- [common](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/gcp/cloud-sql/common/)
			- [mysql](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/gcp/cloud-sql/mysql/)
		- [lb](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/gcp/lb/)
		- [pubsub](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/cloud/gcp/pubsub/)
- [common](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/common/)
	- [alerting-message](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/common/alerting-message/)
	- [filter-tags](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/common/filter-tags/)
- [database](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/database/)
	- [elasticsearch](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/database/elasticsearch/)
	- [mongodb](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/database/mongodb/)
	- [mysql](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/database/mysql/)
	- [postgresql](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/database/postgresql/)
	- [redis](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/database/redis/)
- [middleware](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/middleware/)
	- [apache](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/middleware/apache/)
	- [nginx](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/middleware/nginx/)
	- [php-fpm](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/middleware/php-fpm/)
- [system](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/system/)
	- [generic](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/system/generic/)
	- [unreachable](https://git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors/tree/master/system/unreachable/)
