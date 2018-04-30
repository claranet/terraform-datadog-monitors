AWS MongoDB Service DataDog monitors
==========================================

Link to integration documentation :

[https://docs.datadoghq.com/integrations/mongo/](https://docs.datadoghq.com/integrations/mongo/)


**Prepare your ReplicaSet** :

Add a user to your ReplicaSet (on the primary instance)


```
use admin  
db.auth("admin", "admin-password") ## This is optional is you don't have any admin password  
db.createUser({"user":"datadog", "pwd": "{{PASSWORD}}", "roles" : [ {role: 'read', db: 'admin' }, {role: 'clusterMonitor', db: 'admin'}, {role: 'read', db: 'local' }]})
```

**Configure your Datadog agent**

Add this file conf.d/mongo.yaml

```

init_config:

instances:
      -   server: mongodb://datadog:password@[MONGO_URI]
          tags:
              - mytag1
              - mytag2
      -   server: mongodb://datadog:password@[MONGO_URI]
          tags:
              - mytag1
              - mytag2
```

**Monitor ReplicaSet Health**

Name: [environment] Replica Set heath for {{ replset_name }}

This monitor will check the health of your ReplicaSet

Metrics are :

1: The replicaSet is OK  
0: The replicaSet is KO  

This monitor will trigger an alert for each ReplicaSet.


How to use this module
----------------------

```
module "datadog-monitors-aws-mongodb" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//databases/mongodb?ref={revision}"

  message     = "${module.datadog-message-alerting.alerting-message}"
  environment = "${var.environment}"

}
```

Purpose
-------

Creates a DataDog monitors with the following checks : 
* Mongodb ReplicaSet status

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| delay | Delay in seconds for the metric evaluation | string | `15` | no |
| environment | Architecture Environment | string | - | yes |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when an alert is triggered | string | - | yes |
| mongodb_replicaset_aggregator | Monitor aggregator for Mongodb replicaset [available values: min, max, sum or avg] | string | `avg` | no |
| mongodb_replicaset_message | Custom message for Mongodb replicaset monitor | string | `` | no |
| mongodb_replicaset_silenced | Groups to mute for Mongodb replicaset monitor | map | `<map>` | no |
| mongodb_replicaset_timeframe | Monitor timeframe for Mongodb replicaset [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
