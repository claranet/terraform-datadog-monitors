How to use this module
----------------------

```
module "datadog-monitors-gcp-memorystore" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/gcp/memorystore?ref={revision}"

  project_id  = "${var.gcp_project_id}"
  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

Purpose
-------
Creates DataDog monitors with the following checks :

* 

Inputs
------

Related documentation
------------

* [GCP LB Metrics](https://cloud.google.com/monitoring/api/metrics_gcp#gcp-loadbalancing)
* [Datadog GCP integration](https://docs.datadoghq.com/integrations/google_cloud_platform/)
