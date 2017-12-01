###MongoDB Monitors

Link to integration documentation :

``https://docs.datadoghq.com/integrations/mongo/``

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
