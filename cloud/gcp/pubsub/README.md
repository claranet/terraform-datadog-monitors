How to use this module
----------------------

```
module "datadog-monitors-gcp-pubsub" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/gcp/pubsub?ref={revision}"

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

* [GCP Pub/Sub Metrics](https://cloud.google.com/monitoring/api/metrics_gcp#gcp-pubsub)
* [Datadog GCP Pub/Sub integration](https://docs.datadoghq.com/integrations/google_cloud_pubsub/)
