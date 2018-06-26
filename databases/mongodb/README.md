AWS MongoDB Service DataDog monitors
==========================================



How to use this module
----------------------

Add a user to MongoDB (on the primary instance) :

```
use admin
db.auth("admin", "admin-password") ## This is optional if you don't have any admin password
db.createUser({"user":"datadog", "pwd": "{{PASSWORD}}", "roles" : [ {role: 'read', db: 'admin' }, {role: 'clusterMonitor', db: 'admin'}, {role: 'read', db: 'local' }]})
```

Add a module in your Terraform project :

```
module "datadog-monitors-aws-mongodb" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//databases/mongodb?ref={revision}"

  message     = "${module.datadog-message-alerting.alerting-message}"
  environment = "${var.environment}"

}
```

Configure your Datadog agent for kubernetes with this config :

```
datadog:
  confd:
    mongo.yaml: |-
      ad_identifiers:
        - mongodb
      init_config:
      instances:
        - server: mongodb://datadog:password@%%host%%/admin
          tags:
            - dd_monitoring:enabled
            - dd_mongodb:enabled
            - env:prod
```


Purpose
-------

Creates a DataDog monitors with the following checks : 
* MongoDB Primary status
* MongoDB Secondaries status
* MongoDB replication lag

**Monitor MongoDB Primary**

Name: [environment] MongoDB Primary

This monitor will check the health of the Primary node

This monitor will trigger an alert if there's no primary or if the primary state is wrong.


**Monitor MongoDB Secondary**

Name: [environment] MongoDB Secondary

This monitor will check the health for secondaries nodes

This monitor will trigger an alert if a secondary is missing or if there's a wrong state


**Monitor MongoDB Replication lag**

Name: [environment] MongoDB Replication lag

This monitor will check the replication lag

This monitor will trigger an alert if the replication high is too high


Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| delay | Delay in seconds for the metric evaluation | string | `15` | no |
| environment | Architecture Environment | string | - | yes |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when an alert is triggered | string | - | yes |
| mongodb_desired_servers_count | Number of servers that should be instanciated for this cluster | string | `3` | no |
| mongodb_lag_critical | Critical replication lag in s | string | `5` | no |
| mongodb_lag_warning | Warn replication lag in s | string | `2` | no |
| mongodb_primary_aggregator | Monitor aggregator for MongoDB primary state [available values: min, max] | string | `max` | no |
| mongodb_primary_message | Custom message for MongoDB primary monitor | string | `` | no |
| mongodb_primary_silenced | Groups to mute for MongoDB primary state monitor | map | `<map>` | no |
| mongodb_primary_timeframe | Monitor timeframe for MongoDB wrong state for primary node [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_1m` | no |
| mongodb_replication_aggregator | Monitor aggregator for MongoDB replication lag [available values: min, max, sum or avg] | string | `avg` | no |
| mongodb_replication_message | Custom message for MongoDB replication monitor | string | `` | no |
| mongodb_replication_silenced | Groups to mute for MongoDB replication lag monitor | map | `<map>` | no |
| mongodb_replication_timeframe | Monitor timeframe for MongoDB replication lag  [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_1m` | no |
| mongodb_secondary_aggregator | Monitor aggregator for MongoDB secondary state [available values: min, max] | string | `max` | no |
| mongodb_secondary_message | Custom message for MongoDB secondary monitor | string | `` | no |
| mongodb_secondary_silenced | Groups to mute for MongoDB secondary state monitor | map | `<map>` | no |
| mongodb_secondary_timeframe | Monitor timeframe for MongoDB wrong state for secondaries nodes [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| mongodb_server_count_aggregator | Monitor aggregator for MongoDB server count [available values: min, max] | string | `min` | no |
| mongodb_server_count_message | Custom message for MongoDB server count | string | `` | no |
| mongodb_server_count_silenced | Groups to mute for MongoDB server count monitor | map | `<map>` | no |
| mongodb_server_count_timeframe | Monitor timeframe for MongoDB wrong server count [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_15m` | no |


Related documentation 
---------------------

[https://docs.datadoghq.com/integrations/mongo/](https://docs.datadoghq.com/integrations/mongo/)

