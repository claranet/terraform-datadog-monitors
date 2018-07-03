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

Purpose
-------
Creates a DataDog monitors with the following checks :

* No request
* Too many 4xx requests
* Too many 5xx requests

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cosmos_db_4xx_request_rate_threshold_critical |  | string | `80` | no |
| cosmos_db_4xx_request_rate_threshold_warning |  | string | `50` | no |
| cosmos_db_4xx_requests_message | Custom message for Cosmos DB 4xx requests monitor | string | `` | no |
| cosmos_db_4xx_requests_silenced | Groups to mute for Cosmos DB 4xx requests monitor | map | `<map>` | no |
| cosmos_db_5xx_request_rate_threshold_critical |  | string | `80` | no |
| cosmos_db_5xx_request_rate_threshold_warning |  | string | `50` | no |
| cosmos_db_5xx_requests_message | Custom message for Cosmos DB 5xx requests monitor | string | `` | no |
| cosmos_db_5xx_requests_silenced | Groups to mute for Cosmos DB 5xx requests monitor | map | `<map>` | no |
| cosmos_db_no_request_message | Custom message for Cosmos DB no request monitor | string | `` | no |
| cosmos_db_no_request_silenced | Groups to mute for Cosmos DB no request monitor | map | `<map>` | no |
| delay | Delay in seconds for the metric evaluation | string | `900` | no |
| environment | Architecture environment | string | - | yes |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when a monitor is triggered | string | - | yes |
| subscription_id | ID of the subscription | string | - | yes |

Related documentation
---------------------

To be defined
