Azure Cosmos DB DataDog monitors
================================

How to use this module
----------------------

```
module "datadog-monitors-azure-cosmosdb" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/azure/cosmosdb?ref={revision}"

  message = "${module.datadog-message-alerting.alerting-message}"
  environment = "${var.environment}"
}
```

How to define cosmos_db_ru_utilization_collection variable
----------------------------------------------------------

At the time this module is defined, we can't define Cosmos DB collection with Terraform, so we have to define a variable making the connection between collections and RU max

```
variable cosmos_db_ru_utilization_collection {
    type    = "map"
    default = {
        "collection_1" = "ru_max_1"
        "collection_2" = "ru_max_2"
        ...
    } 
}
```

Purpose
-------
Creates a DataDog monitors with the following checks :

* No request
* Too many 4xx requests
* Too many 5xx requests
* Collection RU utilization

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cosmos_db_4xx_request_rate_threshold_critical | Critical threshold for Cosmos DB 4xx requests monitor | string | `80` | no |
| cosmos_db_4xx_request_rate_threshold_warning | Warning threshold for Cosmos DB 4xx requests monitor | string | `50` | no |
| cosmos_db_4xx_requests_message | Custom message for Cosmos DB 4xx requests monitor | string | `` | no |
| cosmos_db_4xx_requests_silenced | Groups to mute for Cosmos DB 4xx requests monitor | map | `<map>` | no |
| cosmos_db_5xx_request_rate_threshold_critical | Critical threshold for Cosmos DB 5xx requests monitor | string | `80` | no |
| cosmos_db_5xx_request_rate_threshold_warning | Warning threshold for Cosmos DB 5xx requests monitor | string | `50` | no |
| cosmos_db_5xx_requests_message | Custom message for Cosmos DB 5xx requests monitor | string | `` | no |
| cosmos_db_5xx_requests_silenced | Groups to mute for Cosmos DB 5xx requests monitor | map | `<map>` | no |
| cosmos_db_no_request_message | Custom message for Cosmos DB no request monitor | string | `` | no |
| cosmos_db_no_request_silenced | Groups to mute for Cosmos DB no request monitor | map | `<map>` | no |
| cosmos_db_ru_utilization_collection | Group to associate Cosmos DB collection to RU max | map | - | yes |
| cosmos_db_ru_utilization_message | Custom message for Cosmos DB collection RU utilization monitor | string | `` | no |
| cosmos_db_ru_utilization_rate_threshold_critical | Critical threshold for Cosmos DB collection RU utilization monitor | string | `90` | no |
| cosmos_db_ru_utilization_rate_threshold_warning | Warning threshold for Cosmos DB collection RU utilization monitor | string | `80` | no |
| cosmos_db_ru_utilization_silenced | Groups to mute for Cosmos DB collection RU utilization monitor | map | `<map>` | no |
| delay | Delay in seconds for the metric evaluation | string | `900` | no |
| environment | Architecture environment | string | - | yes |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when a monitor is triggered | string | - | yes |
| subscription_id | ID of the subscription | string | - | yes |

Related documentation
---------------------

DataDog documentation : [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)  
You must search `cosmosdb`, there is no integration for now.

Azure metrics documentation : [https://docs.microsoft.com/fr-fr/azure/monitoring-and-diagnostics/monitoring-supported-metrics#microsoftdocumentdbdatabaseaccounts](https://docs.microsoft.com/fr-fr/azure/monitoring-and-diagnostics/monitoring-supported-metrics#microsoftdocumentdbdatabaseaccounts)

