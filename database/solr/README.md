# DATABASE SOLR DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-database-solr" {
  source      = "claranet/monitors/datadog//database/solr"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Solr does not respond
- Solr searcher warmup time too high
- Too many errors on Solr search handler

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| environment | Architecture environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `15` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| message | Message sent when a monitor is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before begin to monitor new host | `number` | `300` | no |
| not\_responding\_enabled | Flag to enable Solr does not repsond monitor | `bool` | `true` | no |
| not\_responding\_extra\_tags | Extra tags for solr does not respond monitor | `list(string)` | `[]` | no |
| not\_responding\_group\_by | Not responding tags to group data | `list(string)` | <pre>[<br>  "instance"<br>]<br></pre> | no |
| not\_responding\_message | Custom message for Solr does not respond monitor | `string` | `""` | no |
| not\_responding\_no\_data\_timeframe | Solr not responding monitor no data timeframe | `number` | `10` | no |
| not\_responding\_threshold\_warning | Solr not responding limit (warning threshold) | `number` | `3` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| search\_handler\_errors\_enabled | Flag to enable Solr search handler errors monitor | `bool` | `true` | no |
| search\_handler\_errors\_extra\_tags | Extra tags for Search handler errors monitor | `list(string)` | `[]` | no |
| search\_handler\_errors\_group\_by | Search handler errors tags to group datas | `list(string)` | <pre>[<br>  "instance"<br>]<br></pre> | no |
| search\_handler\_errors\_message | Custom message for Solr search handler errors monitor | `string` | `""` | no |
| search\_handler\_errors\_rate\_threshold\_critical | Handler errors rate critical threshold | `number` | `50` | no |
| search\_handler\_errors\_rate\_threshold\_warning | Handler errors rate warning threshold | `number` | `10` | no |
| search\_handler\_errors\_time\_aggregator | Time aggregator for the Handler errors monitor | `string` | `"min"` | no |
| search\_handler\_errors\_timeframe | Timeframe for the search handler errors monitor | `string` | `"last_5m"` | no |
| searcher\_warmup\_time\_aggregator | Time aggregator for the searcher warmup time monitor | `string` | `"max"` | no |
| searcher\_warmup\_time\_enabled | Flag to enable Solr searcher warmup time monitor | `bool` | `true` | no |
| searcher\_warmup\_time\_extra\_tags | Extra tags for searcher warmum time monitor | `list(string)` | `[]` | no |
| searcher\_warmup\_time\_group\_by | Search warmup time tags to group datas | `list(string)` | <pre>[<br>  "instance"<br>]<br></pre> | no |
| searcher\_warmup\_time\_message | Custom message for Solr searcher warmup time monitor | `string` | `""` | no |
| searcher\_warmup\_time\_threshold\_critical | Searcher warmup time critical threshold in ms | `number` | `5000` | no |
| searcher\_warmup\_time\_threshold\_warning | Searcher warmup time warning threshold in ms | `number` | `2000` | no |
| searcher\_warmup\_time\_timeframe | Timeframe for the searcher warmup time monitor | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| not\_responding\_id | id for monitor not\_responding |
| search\_handler\_errors\_id | id for monitor search\_handler\_errors |
| searcher\_warmup\_time\_id | id for monitor searcher\_warmup\_time |

## Related documentation

 - [Integration Datadog & Solr](https://docs.datadoghq.com/integrations/solr/)
