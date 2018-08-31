# CAAS KUBERNETES INGRESS DataDog monitors

## How to use this module

```
module "datadog-monitors-caas-kubernetes-ingress" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//caas/kubernetes/ingress?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Nginx Ingress 5xx errors

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| artificial_requests_count | Number of false requests used to mitigate false positive in case of low trafic | string | `5` | no |
| environment | Architecture Environment | string | - | yes |
| evaluation_delay | Delay in seconds for the metric evaluation | string | `15` | no |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| ingress_5xx_enabled | Flag to enable Ingress 5xx errors monitor | string | `true` | no |
| ingress_5xx_extra_tags | Extra tags for Ingress 5xx errors monitor | list | `<list>` | no |
| ingress_5xx_message | Message sent when an alert is triggered | string | `` | no |
| ingress_5xx_silenced | Groups to mute for Ingress 5xx errors monitor | map | `<map>` | no |
| ingress_5xx_threshold_critical |  | string | `10` | no |
| ingress_5xx_threshold_warning |  | string | `5` | no |
| ingress_5xx_timeframe | Monitor timeframe for Ingress 5xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| message | Message sent when an alert is triggered | string | - | yes |
| new_host_delay | Delay in seconds before monitor new resource | string | `300` | no |

## Outputs

| Name | Description |
|------|-------------|
| Nginx_ingress_too_many_5xx_id | id for monitor Nginx_ingress_too_many_5xx |

Related documentation
---------------------

DataDog blog: https://www.datadoghq.com/blog/monitor-prometheus-metrics
https://github.com/kubernetes/ingress-nginx/pull/423/commits/1d38e3a38425f08de2f75fcae13896a3fec4d144

Nginx Ingress Controller setup
------------------------------
Enable the following flags in the Nginx Ingress Controller chart
controller.stats.enabled=true,controller.metrics.enabled=true
and the following Datadog agent configuration for each ingress controller:
```
datadog:
  confd:
    prometheus.yaml: |-
      #nginx_upstream_responses_total{ingress_class,namespace,server,status_code:{1xx,2xx,3xx,4xx,5xx},upstream}
      #nginx_upstream_requests_total{ingress_class,namespace,server,upstream}
      init_config:
      instances:
        # The prometheus endpoint to query from
        - prometheus_url: http://nginx-ingress-controller-metrics:9913/metrics
          # This is NOT the ingress namespace, it is the prefix that will be used for the custom metrics
          namespace: nginx-ingress
          # Filter on the following metrics only
          metrics:
            - "nginx_upstream_requests_total"
            - "nginx_upstream_responses_total"
          # Adapt the tags to the current convention and verify that the monitor will match
          tags:
              - dd_monitoring:enabled
              - dd_ingress:enabled
              - dd_ingress_class:nginx
              - env:prod
```
