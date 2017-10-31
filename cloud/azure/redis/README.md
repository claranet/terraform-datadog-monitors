Azure Redis DataDog monitors
============================

How to use this module
----------------------

```
module "datadog-monitors-azure-redis" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/azure/redis?ref={revision}"

  message = "${module.datadog-message-alerting.alerting-message}"

  environment = "${var.environment}"
  client_name = "${var.client_name}"
}
```

Purpose
-------
Creates a DataDog monitors with the following checks :

* Service status check
* Evicted keys count check
* Processor time (percent) threshold
* Server CPU load threshold

Related documentation
---------------------

DataDog documentation: https://docs.datadoghq.com/integrations/azure_redis_cache/

Azure Redis metrics documentation: https://docs.microsoft.com/en-us/azure/redis-cache/cache-how-to-monitor
