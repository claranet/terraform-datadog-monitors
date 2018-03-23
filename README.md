# DataDog Monitors #

This repository is used to store all our monitors templates.

Here is the repository organization :

- cloud
    - aws
        - [alb](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/aws/alb/)
        - [apigateway](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/aws/apigateway/)
        - [elasticsearch](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/aws/elasticsearch/)
        - [elb](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/aws/elb/)
        - [kinesis-firehose](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/aws/kinesis-firehose/)
        - [rds](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/aws/rds/)
        - [vpn](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/aws/vpn/)
    - azure
        - [apimanagement](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/azure/apimanagement)
        - [app-services](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/azure/app-services/r)
        - [eventhub](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/azure/eventhub/)
        - [iothubs](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/azure/iothubs/)
        - [redis](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/azure/redis/)
        - [sql-database](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/azure/sql-database/)
        - [storage](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/azure/storage/)
        - [stream-analytics](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/azure/stream-analytics/)
- common
    - alerting-message
- databases
    - [mongodb](https://bitbucket.org/morea/terraform.feature.datadog/src/master/databases/mongodb/)
- datadog-samples
- incubator
- middleware
    - [apache](https://bitbucket.org/morea/terraform.feature.datadog/src/master/middleware/apache/)
    - [nginx](https://bitbucket.org/morea/terraform.feature.datadog/src/master/middleware/nginx/)
    - [php-fpm](https://bitbucket.org/morea/terraform.feature.datadog/src/master/middleware/php-fpm/)
- system
    - [generic](https://bitbucket.org/morea/terraform.feature.datadog/src/master/system/generic/)


### How to contribute ? ###

First, you may refresh your knowledge and look at the [terminalogy](https://confluence.fr.clara.net/display/DAT/Getting+started)

If you want to report an issue please be sure to follow this page : [How to report an issue](https://confluence.fr.clara.net/display/DAT/Project+and+Workflow)

It explains the different stages of a request, from the `Backlog` to the `Merged`.

If you want to contribute to any request, you must follow our [best practices](https://confluence.fr.clara.net/display/DAT/Templates+monitors).

### Important notes ###

* Each folder can be import as a feature on terraform, you must choose the one that you need.
* Each of these features contains the most commons monitors, but they probably not fulfill all your customer needs
* You still can create some DataDog monitors after importing a feature, it's even advisable to complete your needs
* You will find a complete `README.md` on each feature, explaining the feature's workaround
* The `alerting-message` module defines the alert channel and must be included in each configuration, you have to define it (Pager, Slack...)

### The DataDog provider ###

Before importing some features, you must define the DataDog provider in your `main.tf`

```
provider "datadog" {
  api_key = "${var.datadog_api_key}"
  app_key = "${var.datadog_app_key}"
}
```

Both of the `datadog_api_key` and `datadog_app_key` are unique to the client.

### Module Declaration example ###

A quick example to how import the monitors that you need :

```
module "datadog-monitors-feature" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git/{monitors_feature_path}?ref={revision}"

  environment = "${var.environment}"
  message = "${module.datadog-message-alerting.alerting-message}"
}
```

`{monitors_feature_path}` could be defined as `/cloud/aws/elb` for example.
