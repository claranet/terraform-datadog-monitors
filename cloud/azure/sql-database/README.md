Azure SQL Database DataDog monitors
============================

How to use this module
----------------------

```
module "datadog-monitors-azure-storage" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/azure/sql-database?ref={revision}"

  message = "${module.datadog-message-alerting.alerting-message}"

  environment = "${var.environment}"
  client_name = "${var.client_name}"
}
```

Purpose
-------
Creates a DataDog monitors with the following checks :

* CPU High
* Free disk space low
* DTU Consumption high
* SQL deadlocks

Inputs
------

| Name | Type | Default | Required |
|------|:----:|:-------:|:--------:|
| client_name | Client name | string | - | yes |
| delay | Delay in seconds for the metric evaluation | string | `600` | no |
| environment | Architecture environment | string | - | yes |
| message | Message sent when a monitor is triggered | string | - | yes |
| use_filter_tags | Filter the data with service tags if true | string | `false` | no |
| dd_azure_sqldb | string | `disabled` | yes |
| cpu_threshold_warning | string | `85` | no |
| cpu_threshold_critical | string | `90` | no |
| diskspace_threshold_warning | string | `80` | no |
| diskspace_threshold_critical | string | `90` | no |
| dtu_threshold_warning | string | `85` | no |
| dtu_threshold_critical | string | `90` | no |
| deadlock_threshold_critical | string | `1` | no |
