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

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cpu_threshold_critical | CPU usage in percent (critical threshold) | string | `90` | no |
| cpu_threshold_warning | CPU usage in percent (warning threshold) | string | `` | no |
| deadlock_threshold_critical | Amount of Deadlocks (critical threshold) | string | `1` | no |
| delay | Delay in seconds for the metric evaluation | string | `600` | no |
| diskspace_threshold_critical | Disk space used in percent (critical threshold) | string | `90` | no |
| diskspace_threshold_warning | Disk space used in percent (warning threshold) | string | `80` | no |
| dtu_threshold_critical | Amount of DTU used (critical threshold) | string | `90` | no |
| dtu_threshold_warning | Amount of DTU used (warning threshold) | string | `85` | no |
| environment | Architecture Environment | string | - | yes |
| message | Message sent when an alert is triggered | string | - | yes |
| provider | Cloud provider which the monitor and its based metric depend on | string | `azure` | no |
| service | Service monitored by this set of monitors | string | `sql-database` | no |
| subscription_id | Azure account id used as filter for monitors | string | - | yes |
| use_filter_tags | Filter the data with service tags if true | string | `true` | no |
