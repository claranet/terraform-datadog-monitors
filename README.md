# DataDog Monitors
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![Apache V2 License](http://img.shields.io/badge/license-Apache%20V2-blue.svg)](LICENSE) [![ ](https://git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors/badges/master/pipeline.svg)](https://git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors/commits/master)

This repository aims to provide a base of generic and pre configured monitors for [Datadog](https://www.datadoghq.com/) templated thanks to [Terraform](https://www.terraform.io/) and the [Datadog Provider](https://github.com/terraform-providers/terraform-provider-datadog).

## Important notes

* This repository provide multiple Terraform modules which could be imported, you must choose the one(s) you need.
* Each of these modules contains the most commons monitors, but they probably do not fulfill all your needs.
* You still can create some specific DataDog monitors after importing a module, it's even advisable to complete your needs.
* You will find a complete `README.md` on each module, explaining how to use it and its specificities if there.
* The `alerting-message` module could be used to easily generate a templating message to re-use and could be used multiple times to suit different use cases.
* Some monitors are disabled by default because not generic or "plug and play" enough, if you use them you will need to tweak them or in some cases disabled another one which could "duplicate" the check.

## Getting started

### Terraform

Here is the minimum version required to use these modules of integrations.

```
terraform {
  required_version = ">= 0.12.19"
}

```

### DataDog provider

Here is the last tester terraform provider version for datadog but next versions should work too.

```
provider "datadog" {
  version = "2.6.0" # last tested working version

  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
}

```

Both of the `datadog_api_key` and `datadog_app_key` are unique to the each datadog account. You can define them in `terraform.tfvars` file:

```
datadog_api_key = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
datadog_app_key = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
```

### Variables

Some variables need to be declared.

```
variable "environment" {
  type    = string
  default = "dev"
}

variable "datadog_api_key" {
  type = string
}

variable "datadog_app_key" {
  type = string
}

```

### Modules declaration example

A quick example of alerting message module declaration:

```
locals {
  oncall_24x7         = "@pagerduty-MyPagerService_NBH"
  oncall_office_hours = "@pagerduty-MyPagerService_BH"
}

module "datadog-message-alerting" {
  source = "claranet/monitors/datadog//common/alerting-message"
  version = "{revision}"

  message_alert   = local.oncall_24x7
  message_warning = local.oncall_office_hours
  message_nodata  = local.oncall_24x7
}

module "datadog-message-alerting-bh-only" {
  source = "claranet/monitors/datadog//common/alerting-message"
  version = "{revision}"

  message_alert   = local.oncall_office_hours
  message_warning = local.oncall_office_hours
  message_nodata  = local.oncall_office_hours
}

module "datadog-monitors-system-generic" {
  source = "claranet/monitors/datadog//system/generic"
  version = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message

  memory_message = module.datadog-message-alerting-bh-only.alerting-message
  # Use variables to customize monitors configuration
}

# Other monitors modules to declare ...
#module "datadog-monitors-my-monitors-set" {
#  source = "claranet/monitors/datadog//my/monitors/set"
#  version = "{revision}"
#
#  environment = var.environment
#  message     = module.datadog-message-alerting.alerting-message
#}

```

* Replace `{revision}` to the last git tag available on this repository.
* The `//` is very important, it's a terraform specific syntax used to separate git url and folder path.
* `my/monitors/set` represents the path to a monitors set sub directory listed below.

## Monitors summary

- [caas](https://github.com/claranet/terraform-datadog-monitors/tree/master/caas/)
	- [docker](https://github.com/claranet/terraform-datadog-monitors/tree/master/caas/docker/)
	- [kubernetes](https://github.com/claranet/terraform-datadog-monitors/tree/master/caas/kubernetes/)
		- [ark](https://github.com/claranet/terraform-datadog-monitors/tree/master/caas/kubernetes/ark/)
		- [cluster](https://github.com/claranet/terraform-datadog-monitors/tree/master/caas/kubernetes/cluster/)
		- [ingress](https://github.com/claranet/terraform-datadog-monitors/tree/master/caas/kubernetes/ingress/)
			- [vts](https://github.com/claranet/terraform-datadog-monitors/tree/master/caas/kubernetes/ingress/vts/)
		- [node](https://github.com/claranet/terraform-datadog-monitors/tree/master/caas/kubernetes/node/)
		- [pod](https://github.com/claranet/terraform-datadog-monitors/tree/master/caas/kubernetes/pod/)
		- [velero](https://github.com/claranet/terraform-datadog-monitors/tree/master/caas/kubernetes/velero/)
		- [workload](https://github.com/claranet/terraform-datadog-monitors/tree/master/caas/kubernetes/workload/)
- [cloud](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/)
	- [aws](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/aws/)
		- [alb](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/aws/alb/)
		- [apigateway](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/aws/apigateway/)
		- [beanstalk](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/aws/beanstalk/)
		- [ecs](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/aws/ecs/)
			- [common](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/aws/ecs/common/)
			- [ec2-cluster](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/aws/ecs/ec2-cluster/)
			- [fargate](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/aws/ecs/fargate/)
		- [elasticache](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/aws/elasticache/)
			- [common](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/aws/elasticache/common/)
			- [memcached](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/aws/elasticache/memcached/)
			- [redis](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/aws/elasticache/redis/)
		- [elasticsearch](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/aws/elasticsearch/)
		- [elb](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/aws/elb/)
		- [kinesis-firehose](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/aws/kinesis-firehose/)
		- [lambda](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/aws/lambda/)
		- [nlb](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/aws/nlb/)
		- [rds](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/aws/rds/)
			- [aurora](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/aws/rds/aurora/)
				- [mysql](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/aws/rds/aurora/mysql/)
				- [postgresql](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/aws/rds/aurora/postgresql/)
			- [common](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/aws/rds/common/)
		- [sqs](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/aws/sqs/)
		- [vpn](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/aws/vpn/)
	- [azure](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/azure/)
		- [apimanagement](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/azure/apimanagement/)
		- [app-gateway](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/azure/app-gateway/)
		- [app-services](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/azure/app-services/)
		- [azure-search](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/azure/azure-search/)
		- [cosmosdb](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/azure/cosmosdb/)
		- [datalakestore](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/azure/datalakestore/)
		- [eventgrid](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/azure/eventgrid/)
		- [eventhub](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/azure/eventhub/)
		- [functions](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/azure/functions/)
		- [iothubs](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/azure/iothubs/)
		- [keyvault](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/azure/keyvault/)
		- [load-balancer](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/azure/load-balancer/)
		- [mysql](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/azure/mysql/)
		- [postgresql](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/azure/postgresql/)
		- [redis](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/azure/redis/)
		- [serverfarms](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/azure/serverfarms/)
		- [servicebus](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/azure/servicebus/)
		- [sql-database](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/azure/sql-database/)
		- [sql-elasticpool](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/azure/sql-elasticpool/)
		- [storage](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/azure/storage/)
		- [stream-analytics](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/azure/stream-analytics/)
		- [virtual-machine](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/azure/virtual-machine/)
	- [gcp](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/gcp/)
		- [big-query](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/gcp/big-query/)
		- [cloud-sql](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/gcp/cloud-sql/)
			- [common](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/gcp/cloud-sql/common/)
			- [mysql](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/gcp/cloud-sql/mysql/)
		- [gce](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/gcp/gce/)
			- [instance](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/gcp/gce/instance/)
		- [lb](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/gcp/lb/)
		- [pubsub](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/gcp/pubsub/)
			- [subscription](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/gcp/pubsub/subscription/)
			- [topic](https://github.com/claranet/terraform-datadog-monitors/tree/master/cloud/gcp/pubsub/topic/)
- [common](https://github.com/claranet/terraform-datadog-monitors/tree/master/common/)
	- [alerting-message](https://github.com/claranet/terraform-datadog-monitors/tree/master/common/alerting-message/)
	- [filter-tags](https://github.com/claranet/terraform-datadog-monitors/tree/master/common/filter-tags/)
- [database](https://github.com/claranet/terraform-datadog-monitors/tree/master/database/)
	- [elasticsearch](https://github.com/claranet/terraform-datadog-monitors/tree/master/database/elasticsearch/)
	- [mongodb](https://github.com/claranet/terraform-datadog-monitors/tree/master/database/mongodb/)
	- [mysql](https://github.com/claranet/terraform-datadog-monitors/tree/master/database/mysql/)
	- [postgresql](https://github.com/claranet/terraform-datadog-monitors/tree/master/database/postgresql/)
	- [redis](https://github.com/claranet/terraform-datadog-monitors/tree/master/database/redis/)
	- [solr](https://github.com/claranet/terraform-datadog-monitors/tree/master/database/solr/)
	- [sqlserver](https://github.com/claranet/terraform-datadog-monitors/tree/master/database/sqlserver/)
- [middleware](https://github.com/claranet/terraform-datadog-monitors/tree/master/middleware/)
	- [apache](https://github.com/claranet/terraform-datadog-monitors/tree/master/middleware/apache/)
	- [kong](https://github.com/claranet/terraform-datadog-monitors/tree/master/middleware/kong/)
	- [nginx](https://github.com/claranet/terraform-datadog-monitors/tree/master/middleware/nginx/)
	- [php-fpm](https://github.com/claranet/terraform-datadog-monitors/tree/master/middleware/php-fpm/)
- [network](https://github.com/claranet/terraform-datadog-monitors/tree/master/network/)
	- [dns](https://github.com/claranet/terraform-datadog-monitors/tree/master/network/dns/)
	- [http](https://github.com/claranet/terraform-datadog-monitors/tree/master/network/http/)
		- [ssl](https://github.com/claranet/terraform-datadog-monitors/tree/master/network/http/ssl/)
		- [webcheck](https://github.com/claranet/terraform-datadog-monitors/tree/master/network/http/webcheck/)
	- [tls](https://github.com/claranet/terraform-datadog-monitors/tree/master/network/tls/)
- [saas](https://github.com/claranet/terraform-datadog-monitors/tree/master/saas/)
	- [new-relic](https://github.com/claranet/terraform-datadog-monitors/tree/master/saas/new-relic/)
- [system](https://github.com/claranet/terraform-datadog-monitors/tree/master/system/)
	- [generic](https://github.com/claranet/terraform-datadog-monitors/tree/master/system/generic/)
	- [unreachable](https://github.com/claranet/terraform-datadog-monitors/tree/master/system/unreachable/)

