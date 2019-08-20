# NETWORK HTTP DataDog monitors

## How to use this module

```
module "datadog-monitors-network-http" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//network/http?ref={revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- HTTP cannot connect
- SSL certificate expiration
- SSL invalid certificate

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cannot\_connect\_enabled | Flag to enable HTTP cannot connect monitor | string | `"true"` | no |
| cannot\_connect\_extra\_tags | Extra tags for HTTP cannot connect monitor | list(string) | `[]` | no |
| cannot\_connect\_last | Parameter 'last' for the service check | string | `"6"` | no |
| cannot\_connect\_message | Custom message for HTTP cannot connect monitor | string | `""` | no |
| cannot\_connect\_no\_data\_timeframe | HTTP cannot connect monitor no data timeframe | string | `"10"` | no |
| cannot\_connect\_threshold\_critical | HTTP cannot connect monitor (warning threshold) | string | `"3"` | no |
| cannot\_connect\_threshold\_ok | HTTP cannot connect monitor (ok threshold) | string | `"3"` | no |
| cannot\_connect\_threshold\_warning | HTTP cannot connect monitor (warning threshold) | string | `"2"` | no |
| certificate\_expiration\_date\_enabled | Flag to enable Certificate Expiration Date monitor | string | `"true"` | no |
| certificate\_expiration\_date\_extra\_tags | Extra tags for Certificate Expiration Date monitor | list(string) | `[]` | no |
| certificate\_expiration\_date\_message | Custom message for the Certificate Expiration Date monitor | string | `""` | no |
| certificate\_expiration\_date\_threshold\_critical | Certificate Expiration Date critical threshold | string | `"8"` | no |
| certificate\_expiration\_date\_threshold\_warning | Certificate Expiration Date warning threshold | string | `"30"` | no |
| certificate\_expiration\_date\_time\_aggregator | Time aggregator for the Certificate Expiration Date monitor | string | `"max"` | no |
| certificate\_expiration\_date\_timeframe | Timeframe for the Certificate Expiration Date monitor | string | `"last_5m"` | no |
| environment | Architecture Environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"15"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| invalid\_ssl\_certificate\_enabled | Flag to enable SSL invalid certificate monitor | string | `"true"` | no |
| invalid\_ssl\_certificate\_extra\_tags | Extra tags for SSL invalid certificate monitor | list(string) | `[]` | no |
| invalid\_ssl\_certificate\_last | Parameter 'last' for the service check | string | `"6"` | no |
| invalid\_ssl\_certificate\_message | Custom message for SSL invalid certificate monitor | string | `""` | no |
| invalid\_ssl\_certificate\_no\_data\_timeframe | SSL invalid certificate monitor no data timeframe | string | `"10"` | no |
| invalid\_ssl\_certificate\_threshold\_critical | SSL invalid certificate monitor (warning threshold) | string | `"5"` | no |
| invalid\_ssl\_certificate\_threshold\_warning | SSL invalid certificate monitor (warning threshold) | string | `"5"` | no |
| message | Message sent when an alert is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| cannot\_connect\_id | id for monitor cannot_connect |
| certificate\_expiration\_date\_id | id for monitor certificate_expiration_date |
| invalid\_ssl\_certificate\_id | id for monitor invalid_ssl_certificate |

## Related documentation

- [Datadog HTTP integration](https://docs.datadoghq.com/integrations/http_check/)
