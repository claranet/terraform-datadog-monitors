AWS ElasticSearch Service DataDog monitors
==========================================

How to use this module
----------------------

```
module "datadog-monitors-aws-elasticsearch" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/aws/elasticsearch?ref={revision}"

  message = "${module.datadog-message-alerting.alerting-message}"
  environment = "${var.environment}"

  es_cluster_volume_size = "100"
}

```

Purpose
-------
Creates DataDog monitors with the following checks :

* Cluster status not green
* Free disk space low
* CPU High

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cpu_message | Custom message for ES cluster cpu monitor | string | `` | no |
| cpu_silenced | Groups to mute for ES cluster cpu monitor | map | `<map>` | no |
| cpu_threshold_critical | CPU usage in percent (critical threshold) | string | `90` | no |
| cpu_threshold_warning | CPU usage in percent (warning threshold) | string | `80` | no |
| delay | Delay in seconds for the metric evaluation | string | `900` | no |
| diskspace_message | Custom message for ES cluster diskspace monitor | string | `` | no |
| diskspace_silenced | Groups to mute for ES cluster diskspace monitor | map | `<map>` | no |
| diskspace_threshold_critical | Disk free space in percent (critical threshold) | string | `10` | no |
| diskspace_threshold_warning | Disk free space in percent (warning threshold) | string | `20` | no |
| environment | Architecture Environment | string | - | yes |
| es_cluster_status_message | Custom message for ES cluster status monitor | string | `` | no |
| es_cluster_status_silenced | Groups to mute for ES cluster status monitor | map | `<map>` | no |
| es_cluster_volume_size | ElasticSearch Domain volume size (in GB) | string | - | yes |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when an alert is triggered | string | - | yes |

Related documentation
---------------------

DataDog documentation: [https://docs.datadoghq.com/integrations/amazon_es/](https://docs.datadoghq.com/integrations/amazon_es/)

AWS ElasticSearch Service Instance metrics documentation: [https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/es-metricscollected.html](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/es-metricscollected.html)
