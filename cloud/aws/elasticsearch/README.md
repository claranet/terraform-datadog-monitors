# CLOUD AWS ELASTICSEARCH DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-aws-elasticsearch" {
  source = "claranet/monitors/datadog//cloud/aws/elasticsearch"
  version = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message

  es_cluster_volume_size = 42
}

```

## Purpose

Creates DataDog monitors with the following checks:

- ElasticSearch cluster CPU high
- ElasticSearch cluster free storage space
- ElasticSearch cluster status is not green

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cpu\_enabled | Flag to enable ES cluster cpu monitor | string | `"true"` | no |
| cpu\_extra\_tags | Extra tags for ES cluster cpu monitor | list(string) | `[]` | no |
| cpu\_message | Custom message for ES cluster cpu monitor | string | `""` | no |
| cpu\_threshold\_critical | CPU usage in percent (critical threshold) | string | `"90"` | no |
| cpu\_threshold\_warning | CPU usage in percent (warning threshold) | string | `"80"` | no |
| cpu\_time\_aggregator | Monitor aggregator for ES cluster cpu [available values: min, max or avg] | string | `"min"` | no |
| cpu\_timeframe | Monitor timeframe for ES cluster cpu [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_15m"` | no |
| diskspace\_enabled | Flag to enable ES cluster diskspace monitor | string | `"true"` | no |
| diskspace\_extra\_tags | Extra tags for ES cluster diskspace monitor | list(string) | `[]` | no |
| diskspace\_message | Custom message for ES cluster diskspace monitor | string | `""` | no |
| diskspace\_threshold\_critical | Disk free space in percent (critical threshold) | string | `"10"` | no |
| diskspace\_threshold\_warning | Disk free space in percent (warning threshold) | string | `"20"` | no |
| diskspace\_time\_aggregator | Monitor aggregator for ES cluster diskspace [available values: min, max or avg] | string | `"max"` | no |
| diskspace\_timeframe | Monitor timeframe for ES cluster diskspace [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_15m"` | no |
| environment | Architecture Environment | string | n/a | yes |
| es\_cluster\_status\_enabled | Flag to enable ES cluster status monitor | string | `"true"` | no |
| es\_cluster\_status\_extra\_tags | Extra tags for ES cluster status monitor | list(string) | `[]` | no |
| es\_cluster\_status\_message | Custom message for ES cluster status monitor | string | `""` | no |
| es\_cluster\_status\_timeframe | Monitor timeframe for ES cluster status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_30m"` | no |
| es\_cluster\_volume\_size | ElasticSearch Domain volume size (in GB) | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"900"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| message | Message sent when an alert is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |
| notify\_no\_data | Will raise no data alert if set to true | string | `"true"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| es\_cluster\_status\_id | id for monitor es_cluster_status |
| es\_cpu\_90\_15min\_id | id for monitor es_cpu_90_15min |
| es\_free\_space\_low\_id | id for monitor es_free_space_low |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/amazon_es/](https://docs.datadoghq.com/integrations/amazon_es/)

AWS ElasticSearch Service Instance metrics documentation: [https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/es-metricscollected.html](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/es-metricscollected.html)
