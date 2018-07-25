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

