AWS MongoDB Service DataDog monitors
==========================================



How to use this module
----------------------

Add a user to MongoDB (on the primary instance) :

```
use admin
db.auth("admin", "admin-password") ## This is optional is you don't have any admin password
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
| environment | Architecture Environment | string | - | yes |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when an alert is triggered | string | - | yes |
| mongodb_primary_message | Message sent when an alert is triggered on primary state | string | - | no |
| mongodb_secondary_message | Message sent when an alert is triggered on secondary state | string | - | no |
| mongodb_replication_message | Message sent when an alert is triggered on replication lag | string | - | no |
| mongodb_lag_warning | Replication lag in seconds to trigger a warn alert | string | 2 | no |
| mongodb_lag_critical | Replication lag in seconds to trigger a critical alert | string | 5 | no |
| mongodb_primary_silenced | Groups to mute for Mongodb primary state monitor | map | `<map>` | no |
| mongodb_secondary_silenced | Groups to mute for Mongodb secondary state monitor | map | `<map>` | no |
| mongodb_replication_silenced | Groups to mute for Mongodb replication lag monitor | map | `<map>` | no |
| mongodb_replication_aggregator | Monitor aggregator for Mongodb state on primary node | string | available values: min, max | no |
| mongodb_replication_aggregator | Monitor aggregator for Mongodb state for secondaries | string | available values: min, max | no |
| mongodb_replication_aggregator | Monitor aggregator for Mongodb replication lag | string | available values: min, max, sum or avg | no |
| mongodb_primary_timeframe | Time frame for MongoDB primary state | string | available values: `last_#m` (1, 5, 10, 15, or 30) | no |
| mongodb_secondary_timeframe | Time frame for MongoDB secondary state | string | available values: `last_#m` (1, 5, 10, 15, or 30) | no |
| mongodb_replication_timeframe | Time frame for MongoDB replication lag | string | available values: `last_#m` (1, 5, 10, 15, or 30) | no |


Related documentation 
---------------------

[https://docs.datadoghq.com/integrations/mongo/](https://docs.datadoghq.com/integrations/mongo/)

