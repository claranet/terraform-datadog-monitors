# v4+

See [Github releases](https://github.com/claranet/terraform-datadog-monitors/releases) for versions `>= v4.0.0`.

# v3.6.0 (January 27, 2021)

## Improvement

*   Add monitor for Google Cloud Platform Memorystore Redis system memory usage ratio
*   [[MN-587](https://onejira.atlassian.net/browse/MN-587)] - MN-587 Add ProxySQL monitors

# v3.5.0 (August 27, 2020)

## Bug

*   [[MN-581](https://onejira.atlassian.net/browse/MN-581)] - repair CI now pt-monitoring is dead

## Improvement

*   [[MN-580](https://onejira.atlassian.net/browse/MN-580)] - Terraform 0.13 compatibility for datadog modules

# v3.4.0 (March 30, 2020)

## Bug

*   [[MN-574](https://onejira.atlassian.net/browse/MN-574)] - Fix k8s pod phases status

## Improvement

*   [[MN-563](https://onejira.atlassian.net/browse/MN-563)] - TFenv support
*   [[MN-571](https://onejira.atlassian.net/browse/MN-571)] - Azure AppGateway change metric

## New Feature

*   [[MN-221](https://onejira.atlassian.net/browse/MN-221)] - Monitors for Zookeeper
*   [[MN-496](https://onejira.atlassian.net/browse/MN-496)] - Customize the group by on the monitors

# v3.3.0 (January 23, 2020)

## Bug

*   [[MN-556](https://onejira.atlassian.net/browse/MN-556)] - Some monitors doesn't have customizable no_data_timeframe
*   [[MN-558](https://onejira.atlassian.net/browse/MN-558)] - AZure Application gateway monitoring healthy host check has no  data
*   [[MN-562](https://onejira.atlassian.net/browse/MN-562)] - Fix perpetual diff on no_data_timeframe

## Improvement

*   [[MN-527](https://onejira.atlassian.net/browse/MN-527)] - Disable memory forecast monitor for gcp cloudsql
*   [[MN-547](https://onejira.atlassian.net/browse/MN-547)] - Add monitor for MySQL lag and replication
*   [[MN-559](https://onejira.atlassian.net/browse/MN-559)] - Remove awk hack and use terraform-docs 0.8.0
*   [[MN-561](https://onejira.atlassian.net/browse/MN-561)] - Add targetgroup in group by for ALB monitors

## New Feature

*   [[MN-521](https://onejira.atlassian.net/browse/MN-521)] - Monitors for AWS ECS Fargate
*   [[MN-554](https://onejira.atlassian.net/browse/MN-554)] - Monitors for K8S Velero
*   [[MN-557](https://onejira.atlassian.net/browse/MN-557)] - SQL Server monitors
*   [[MN-560](https://onejira.atlassian.net/browse/MN-560)] - Monitors for solr

# v3.2.0 (December 13, 2019)

## Bug

*   [[MN-512](https://onejira.atlassian.net/browse/MN-512)] - Elasticsearch latency is a counter
*   [[MN-516](https://onejira.atlassian.net/browse/MN-516)] - ELB & ALB  "no healthy instances" monitor's value is not accurate
*   [[MN-518](https://onejira.atlassian.net/browse/MN-518)] - Respect best practice for message mention
*   [[MN-523](https://onejira.atlassian.net/browse/MN-523)] - Fix Azure server farm status aggregator
*   [[MN-524](https://onejira.atlassian.net/browse/MN-524)] - Azure virtual machine free space monitor has no data
*   [[MN-526](https://onejira.atlassian.net/browse/MN-526)] - Fix wrong percentage calculation on GCP pubsub messages unavailable
*   [[MN-530](https://onejira.atlassian.net/browse/MN-530)] - Fix RDS Replica Lag monitors name (use ms instead of %)
*   [[MN-532](https://onejira.atlassian.net/browse/MN-532)] - Syntax warning on ignore_changes attribute
*   [[MN-535](https://onejira.atlassian.net/browse/MN-535)] - Fix HCL2 syntax
*   [[MN-544](https://onejira.atlassian.net/browse/MN-544)] - kubernetescluster tag does not exist anymore

## Documentation

*   [[MN-519](https://onejira.atlassian.net/browse/MN-519)] - Opensource integrations and monitors

## Epic

*   [[MN-62](https://onejira.atlassian.net/browse/MN-62)] - Monitors for AWS ECS

## Improvement

*   [[MN-364](https://onejira.atlassian.net/browse/MN-364)] - Monitors for AWS NLB
*   [[MN-509](https://onejira.atlassian.net/browse/MN-509)] - Fix monitor name for storage account monitor
*   [[MN-510](https://onejira.atlassian.net/browse/MN-510)] - Fix metric for storage account queue monitor
*   [[MN-513](https://onejira.atlassian.net/browse/MN-513)] - Fix false alarms on Azure storage monitoring
*   [[MN-514](https://onejira.atlassian.net/browse/MN-514)] - Replace avg with min on ElasticSearch fetch latency
*   [[MN-517](https://onejira.atlassian.net/browse/MN-517)] - Make warning threshold customizable on load balancer healthy instances monitors
*   [[MN-531](https://onejira.atlassian.net/browse/MN-531)] - Add time aggregator on RDS Replica Lag Monitor
*   [[MN-541](https://onejira.atlassian.net/browse/MN-541)] - Add notify_no_data parameter on every monitors where it is true
*   [[MN-543](https://onejira.atlassian.net/browse/MN-543)] - alerting message could use common recovering conditional variable

## New Feature

*   [[MN-182](https://onejira.atlassian.net/browse/MN-182)] - Monitors structure and config examples / stack template
*   [[MN-366](https://onejira.atlassian.net/browse/MN-366)] - Monitors for Azure Application Gateway
*   [[MN-525](https://onejira.atlassian.net/browse/MN-525)] - Monitors for AWS Beanstalk

# v3.1.2 (September 09, 2019)

## Improvement

*   [[MN-508](https://onejira.atlassian.net/browse/MN-508)] - GCP Pub/Sub Topic no data removal

# v3.1.1 (September 06, 2019)

## Improvement

*   [[MN-507](https://onejira.atlassian.net/browse/MN-507)] - add manifest for pubsub monitors

# v3.1.0 (September 06, 2019)

## Bug

*   [[MN-481](https://onejira.atlassian.net/browse/MN-481)] - Fix alb latency metric unit and homogenize latency thresholds

## Documentation

*   [[MN-495](https://onejira.atlassian.net/browse/MN-495)] - Add requirements to kubernetes monitors readme

## Improvement

*   [[MN-400](https://onejira.atlassian.net/browse/MN-400)] - GCP Pub Sub improvements
*   [[MN-456](https://onejira.atlassian.net/browse/MN-456)] - remove as_count() on kubernetes_state.container.status_report.count.waiting
*   [[MN-480](https://onejira.atlassian.net/browse/MN-480)] - Increase alert treshold for Stream Analytics streaming units utilization
*   [[MN-482](https://onejira.atlassian.net/browse/MN-482)] - Ignore silenced since we now must use downtime instead
*   [[MN-484](https://onejira.atlassian.net/browse/MN-484)] - Ajust monitor Hub Too many d2c telemetry ingress not sent
*   [[MN-486](https://onejira.atlassian.net/browse/MN-486)] - Remove workaround for here doc fmt now it is fixed in terraform 0.12.6
*   [[MN-494](https://onejira.atlassian.net/browse/MN-494)] - Refactor auto update scripts
*   [[MN-502](https://onejira.atlassian.net/browse/MN-502)] - Increase basic system triggers timeframes
*   [[MN-504](https://onejira.atlassian.net/browse/MN-504)] - Update terraform and provider versions

## New Feature

*   [[MN-39](https://onejira.atlassian.net/browse/MN-39)] - Monitors for Newrelic
*   [[MN-413](https://onejira.atlassian.net/browse/MN-413)] - Terraform feature for pagerduty integration
*   [[MN-455](https://onejira.atlassian.net/browse/MN-455)] - Monitor for kubernetes_state.container.status_report.count.terminated
*   [[MN-46](https://onejira.atlassian.net/browse/MN-46)] - Monitors for AWS Lambdas
*   [[MN-472](https://onejira.atlassian.net/browse/MN-472)] - Monitors for AWS SQS
*   [[MN-485](https://onejira.atlassian.net/browse/MN-485)] - docker image for datadog terraform
*   [[MN-487](https://onejira.atlassian.net/browse/MN-487)] - Datadog monitors VM integration RAM reserved
*   [[MN-489](https://onejira.atlassian.net/browse/MN-489)] - Datadog monitors Azure VM Disk
*   [[MN-490](https://onejira.atlassian.net/browse/MN-490)] - Changelog generation on git repos
*   [[MN-492](https://onejira.atlassian.net/browse/MN-492)] - Indicate if a monitor is disabled by default on the README of each module
*   [[MN-493](https://onejira.atlassian.net/browse/MN-493)] - Datadog monitors VM integration - requests failed
*   [[MN-497](https://onejira.atlassian.net/browse/MN-497)] - Monitors for Docker
*   [[MN-498](https://onejira.atlassian.net/browse/MN-498)] - Monitors for Kong
*   [[MN-499](https://onejira.atlassian.net/browse/MN-499)] - Monitors HTTP, DNS and TLS

# v3.0.0 (July 05, 2019)

## Improvement

*   [[MN-476](https://onejira.atlassian.net/browse/MN-476)] - check and update sets with more than 1 notify no data
*   [[MN-479](https://onejira.atlassian.net/browse/MN-479)] - Upgrade datadog terraform provider to v2

## Bug

*   [[MN-460](https://onejira.atlassian.net/browse/MN-460)] - Fix filter tags usage on keyvault and cosmos monitors
*   [[MN-461](https://onejira.atlassian.net/browse/MN-461)] - Repair CI since it uses last 0.12 version image
*   [[MN-477](https://onejira.atlassian.net/browse/MN-477)] - Fix wrong variable in query for kubernetes node inodes monitor
*   [[MN-478](https://onejira.atlassian.net/browse/MN-478)] - Fix diff between CI and local env for sort command

## Epic

*   [[MN-459](https://onejira.atlassian.net/browse/MN-459)] - Upgrade to terraform 0.12 (HCL 2.0)

# v2.9.0 (May 09, 2019)

## Improvement

*   [[MN-441](https://onejira.atlassian.net/browse/MN-441)] - support extra tags for custom filtering
*   [[MN-446](https://onejira.atlassian.net/browse/MN-446)] - Monitor Azure SQL Elastic Pool

## New Feature

*   [[MN-182](https://onejira.atlassian.net/browse/MN-182)] - Monitors structure and config examples / stack template
*   [[MN-236](https://onejira.atlassian.net/browse/MN-236)] - Append optional custom field to name of monitor
*   [[MN-453](https://onejira.atlassian.net/browse/MN-453)] - Monitors for kubernetes kubelet volume stats space and inodes

## Bug

*   [[MN-442](https://onejira.atlassian.net/browse/MN-442)] - Do not notify nodata on node unschedulable monitor
*   [[MN-444](https://onejira.atlassian.net/browse/MN-444)] - Kubernetes status_report count waiting should not trigger on containercreating
*   [[MN-451](https://onejira.atlassian.net/browse/MN-451)] - Nodata alerts on Azure App Services downscale

## Epic

*   [[MN-449](https://onejira.atlassian.net/browse/MN-449)] - Datadog global CI

# v2.8.0 (April 23, 2019)

## Improvement

*   [[MN-320](https://onejira.atlassian.net/browse/MN-320)] - Prefer greater operator logic
*   [[MN-326](https://onejira.atlassian.net/browse/MN-326)] - use multi line query and EOQ everywhere
*   [[MN-327](https://onejira.atlassian.net/browse/MN-327)] - Fix warning name for load balancer
*   [[MN-328](https://onejira.atlassian.net/browse/MN-328)] - Improve mysql Innodb pool monitors
*   [[MN-330](https://onejira.atlassian.net/browse/MN-330)] - Fix grouping and counter on azure monitors
*   [[MN-331](https://onejira.atlassian.net/browse/MN-331)] - Improve mysql throughput monitor
*   [[MN-429](https://onejira.atlassian.net/browse/MN-429)] - Update reference from cloudnative to pt-mon
*   [[MN-437](https://onejira.atlassian.net/browse/MN-437)] - Update CI to use new gitlab runner

## New Feature

*   [[MN-114](https://onejira.atlassian.net/browse/MN-114)] - Monitors for Kubernetes
*   [[MN-390](https://onejira.atlassian.net/browse/MN-390)] - Monitors for Azure Functions

## Bug

*   [[MN-360](https://onejira.atlassian.net/browse/MN-360)] - Feature enable/disable monitors creation does not work
*   [[MN-415](https://onejira.atlassian.net/browse/MN-415)] - Remove Azure DBforMySQL Active connection query
*   [[MN-430](https://onejira.atlassian.net/browse/MN-430)] - Use "instance" dimension on Azure App Service monitors metrics

# v2.7.0 (April 05, 2019)

## Improvement

*   [[MN-385](https://onejira.atlassian.net/browse/MN-385)] - Add Azure EventGrid Datadog monitors
*   [[MN-417](https://onejira.atlassian.net/browse/MN-417)] - Monitors for Azure Virtual Machine
*   [[MN-418](https://onejira.atlassian.net/browse/MN-418)] - Monitors for Azure Load Balancer

## New Feature

*   [[MN-391](https://onejira.atlassian.net/browse/MN-391)] - Monitors for Azure Search
*   [[MN-424](https://onejira.atlassian.net/browse/MN-424)] - Monitors for GCE instance

## Bug

*   [[MN-405](https://onejira.atlassian.net/browse/MN-405)] - Fix Azure CosmosDb monitors due to metrics changes
*   [[MN-425](https://onejira.atlassian.net/browse/MN-425)] - Fix App Services response time monitor

# v2.6.0 (March 08, 2019)

## Bug

*   [[MN-402](https://onejira.atlassian.net/browse/MN-402)] - Fix Azure DBforMySQL Active connection monitor
*   [[MN-403](https://onejira.atlassian.net/browse/MN-403)] - Fix apache perpetual diff on apache connect monitor

## Improvement

*   [[MN-392](https://onejira.atlassian.net/browse/MN-392)] - Update terraform-docs version in CI for DD monitors
*   [[MN-397](https://onejira.atlassian.net/browse/MN-397)] - Exclude secretlist activity from Azure Key Vault latency monitor
*   [[MN-404](https://onejira.atlassian.net/browse/MN-404)] - Make mysql Innodb buffer pool more tolerant

# v2.5.1 (January 24, 2019)

## Bug

*   [[MN-387](https://onejira.atlassian.net/browse/MN-387)] - Azure IotHub monitors triggers nodata alerts since 2.5.0

# v2.5.0 (January 23, 2019)

## Bug

*   [[MN-335](https://onejira.atlassian.net/browse/MN-335)] - Fix successful monitors false alarms
*   [[MN-383](https://onejira.atlassian.net/browse/MN-383)] - Remove Azure Monitors using compute_consumption_percent
*   [[MN-386](https://onejira.atlassian.net/browse/MN-386)] - Caas Nginx Ingress monitor fix and update for VTS

## Improvement

*   [[MN-237](https://onejira.atlassian.net/browse/MN-237)] - Add new Azure Monitors
*   [[MN-295](https://onejira.atlassian.net/browse/MN-295)] - Remove Azure global feature
*   [[MN-317](https://onejira.atlassian.net/browse/MN-317)] - Prefix all cloudprovider filter tag with
*   [[MN-332](https://onejira.atlassian.net/browse/MN-332)] - Add filter_tags on IOTHub monitors
*   [[MN-344](https://onejira.atlassian.net/browse/MN-344)] - add default to hit ratio monitors
*   [[MN-377](https://onejira.atlassian.net/browse/MN-377)] - Monitor Azure SQL Server status with DD

## New Feature

*   [[MN-336](https://onejira.atlassian.net/browse/MN-336)] - Convert bitbucket pipeline to gitlab ci

# v2.4.0 (October 03, 2018)

## Bug

*   [[MN-301](https://onejira.atlassian.net/browse/MN-301)] - Manage exclude on the module for filters
*   [[MN-323](https://onejira.atlassian.net/browse/MN-323)] - fix pipeline using terraform-docs version 0.4.0

## Improvement

*   [[MN-309](https://onejira.atlassian.net/browse/MN-309)] - Improve monitors using as_count() and division

## New Feature

*   [[MN-246](https://onejira.atlassian.net/browse/MN-246)] - Monitors for Azure MySQL
*   [[MN-310](https://onejira.atlassian.net/browse/MN-310)] - Monitors for Azure Postgresql
*   [[MN-316](https://onejira.atlassian.net/browse/MN-316)] - Monitors for Azure server farms

# v2.3.1 (September 27, 2018)

## Bug

*   [[MN-313](https://onejira.atlassian.net/browse/MN-313)] - elasticache memcached hit ratio miss multiplication by 100

## Improvement

*   [[MN-306](https://onejira.atlassian.net/browse/MN-306)] - Use system.load.norm.5 instead of system.load.5
*   [[MN-307](https://onejira.atlassian.net/browse/MN-307)] - GCP CloudSQL failover monitor increase timeframe
*   [[MN-308](https://onejira.atlassian.net/browse/MN-308)] - Improve load balancer healthly host monitor
*   [[MN-311](https://onejira.atlassian.net/browse/MN-311)] - Generate modules.tf with dynamic path
*   [[MN-312](https://onejira.atlassian.net/browse/MN-312)] - Update readme with terraform-docs 0.4.0
*   [[MN-315](https://onejira.atlassian.net/browse/MN-315)] - Doc monitor / system / generic: free memory message

# v2.3.0 (September 20, 2018)

## Bug

*   [[MN-273](https://onejira.atlassian.net/browse/MN-273)] - service check query syntax does not work anymore
*   [[MN-304](https://onejira.atlassian.net/browse/MN-304)] - Add default function to all latency based aws monitors

## Improvement

*   [[MN-159](https://onejira.atlassian.net/browse/MN-159)] - Split delay variable in two separate variables (evaluation and new host)
*   [[MN-162](https://onejira.atlassian.net/browse/MN-162)] - Add possibilty to disable / enable monitors
*   [[MN-199](https://onejira.atlassian.net/browse/MN-199)] - Advanced monitors for Mongodb
*   [[MN-275](https://onejira.atlassian.net/browse/MN-275)] - manage diff on monitor type from terraform
*   [[MN-287](https://onejira.atlassian.net/browse/MN-287)] - Update service check monitors and doc
*   [[MN-288](https://onejira.atlassian.net/browse/MN-288)] - Update all monitors with new tagging convention
*   [[MN-293](https://onejira.atlassian.net/browse/MN-293)] - Optimize ci pipeline
*   [[MN-294](https://onejira.atlassian.net/browse/MN-294)] - handle specific example for readme auto generation
*   [[MN-300](https://onejira.atlassian.net/browse/MN-300)] - Improve and sandardize thresholds on GCP LB

## New Feature

*   [[MN-32](https://onejira.atlassian.net/browse/MN-32)] - Monitors for AWS Elasticache
*   [[MN-92](https://onejira.atlassian.net/browse/MN-92)] - Monitors for Mongodb
*   [[MN-105](https://onejira.atlassian.net/browse/MN-105)] - Monitors for PostgreSQL
*   [[MN-122](https://onejira.atlassian.net/browse/MN-122)] - Replication lag monitor for RDS
*   [[MN-142](https://onejira.atlassian.net/browse/MN-142)] - Monitors for MySQL
*   [[MN-224](https://onejira.atlassian.net/browse/MN-224)] - Monitors for GCP Cloud SQL
*   [[MN-226](https://onejira.atlassian.net/browse/MN-226)] - Monitors for GCP PubSub
*   [[MN-227](https://onejira.atlassian.net/browse/MN-227)] - Monitors for GCP LB
*   [[MN-228](https://onejira.atlassian.net/browse/MN-228)] - Monitors for ElasticSearch
*   [[MN-230](https://onejira.atlassian.net/browse/MN-230)] - Monitors for GCP BigQuery
*   [[MN-247](https://onejira.atlassian.net/browse/MN-247)] - Monitors for Ark backups
*   [[MN-248](https://onejira.atlassian.net/browse/MN-248)] - Monitors for Nginx Ingress Controller
*   [[MN-271](https://onejira.atlassian.net/browse/MN-271)] - Monitors for Redis
*   [[MN-281](https://onejira.atlassian.net/browse/MN-281)] - Monitor for disk forecast (system-generic)
*   [[MN-284](https://onejira.atlassian.net/browse/MN-284)] - Add extra tags management to monitors
*   [[MN-286](https://onejira.atlassian.net/browse/MN-286)] - Host Unreachable monitor on system generic
*   [[MN-289](https://onejira.atlassian.net/browse/MN-289)] - Monitors for Nginx
*   [[MN-290](https://onejira.atlassian.net/browse/MN-290)] - Monitors for Php-fpm

# v2.2.1 (August 08, 2018)

## Bug

*   [[MN-272](https://onejira.atlassian.net/browse/MN-272)] - php fpm has changed from port to ping_url for group by
*   [[MN-276](https://onejira.atlassian.net/browse/MN-276)] - Fix ALB / ELB space aggregator

# v2.2.0 (July 23, 2018)

## Improvement

*   [[MN-259](https://onejira.atlassian.net/browse/MN-259)] - Improve readme generator

## New Feature

*   [[MN-233](https://onejira.atlassian.net/browse/MN-233)] - Update main readme automatically
*   [[MN-234](https://onejira.atlassian.net/browse/MN-234)] - Automatically generate output for each monitor

# v2.1.1 (July 10, 2018)

## Bug

*   [[MN-239](https://onejira.atlassian.net/browse/MN-239)] - Fix alb no healthy instances thresholds

# v2.1.0 (June 29, 2018)

## Bug

*   [[MN-168](https://onejira.atlassian.net/browse/MN-168)] - Apache can connect fails on query error

## Improvement

*   [[MN-160](https://onejira.atlassian.net/browse/MN-160)] - Generalize the timeframe best practice
*   [[MN-170](https://onejira.atlassian.net/browse/MN-170)] - Increase timeframe of ALB no healthy instances monitor
*   [[MN-179](https://onejira.atlassian.net/browse/MN-179)] - No data events on Free disk inodes, Free disk space monitors
*   [[MN-184](https://onejira.atlassian.net/browse/MN-184)] - no_data_timeframe should never be defined
*   [[MN-185](https://onejira.atlassian.net/browse/MN-185)] - Monitors for Azure ServiceBus
*   [[MN-197](https://onejira.atlassian.net/browse/MN-197)] - Ignore cache and buffer on memory monitor

## New Feature

*   [[MN-191](https://onejira.atlassian.net/browse/MN-191)] - variabilize aggregator and timeframe when needed
*   [[MN-231](https://onejira.atlassian.net/browse/MN-231)] - Update readme for every monitors sets easily

## Documentation

*   [[MN-181](https://onejira.atlassian.net/browse/MN-181)] - update aws vpn readme to remove vpn_tunnel_address

# v2.0.1 (April 02, 2018)

## Bug

*   [[MN-166](https://onejira.atlassian.net/browse/MN-166)] - Fix apigateway latency notify on no data

# v2.0.0 (March 25, 2018)

## Bug

*   [[MN-81](https://onejira.atlassian.net/browse/MN-81)] - Fix basic monitors
*   [[MN-88](https://onejira.atlassian.net/browse/MN-88)] - Treshold too high on aws_elb_latency
*   [[MN-108](https://onejira.atlassian.net/browse/MN-108)] - typo monitor name apache middleware
*   [[MN-113](https://onejira.atlassian.net/browse/MN-113)] - fix AWS ElasticSearch status monitor (aws.es.cluster_statusyellow)
*   [[MN-121](https://onejira.atlassian.net/browse/MN-121)] - Fix ELB_backend_latency error
*   [[MN-127](https://onejira.atlassian.net/browse/MN-127)] - Fix system tag in agent.yml
*   [[MN-128](https://onejira.atlassian.net/browse/MN-128)] - [Datadog] Monitors for ELB issue with group by loadbalancer
*   [[MN-139](https://onejira.atlassian.net/browse/MN-139)] - no data support for monitor name templating

## Improvement

*   [[MN-66](https://onejira.atlassian.net/browse/MN-66)] - Refactor monitors repo with directories
*   [[MN-96](https://onejira.atlassian.net/browse/MN-96)] - Update old monitors with new best practices
*   [[MN-99](https://onejira.atlassian.net/browse/MN-99)] - Azure App Service monitor : count 2xx & 3xx http status codes as successful
*   [[MN-102](https://onejira.atlassian.net/browse/MN-102)] - Auto-recovery for no-data tolerant monitors
*   [[MN-124](https://onejira.atlassian.net/browse/MN-124)] - Add message input per monitor
*   [[MN-134](https://onejira.atlassian.net/browse/MN-134)] - RAM alerts are now in non-business hours alerting by default.
*   [[MN-135](https://onejira.atlassian.net/browse/MN-135)] - Use default on Event Hub query and update the used metrics
*   [[MN-136](https://onejira.atlassian.net/browse/MN-136)] - Use rates for Azure IoT Hub monitors
*   [[MN-137](https://onejira.atlassian.net/browse/MN-137)] - Use min as aggregate for Azure app services response time monitor
*   [[MN-140](https://onejira.atlassian.net/browse/MN-140)] - Add a default function for api gateway, elb and alb monitors

## New Feature

*   [[MN-48](https://onejira.atlassian.net/browse/MN-48)] - Monitors for API Gateway
*   [[MN-49](https://onejira.atlassian.net/browse/MN-49)] - improve basic monitors
*   [[MN-82](https://onejira.atlassian.net/browse/MN-82)] - Monitor message should be composed from variables
*   [[MN-91](https://onejira.atlassian.net/browse/MN-91)] - Monitors for AWS VPN
*   [[MN-107](https://onejira.atlassian.net/browse/MN-107)] - Monitors for AWS Elasticsearch Service
*   [[MN-110](https://onejira.atlassian.net/browse/MN-110)] - Monitors for AWS Kinesis Firehose streams
*   [[MN-112](https://onejira.atlassian.net/browse/MN-112)] - Monitors for AWS ALB

## Sub-task

*   [[MN-30](https://onejira.atlassian.net/browse/MN-30)] - Monitors for AWS RDS
*   [[MN-34](https://onejira.atlassian.net/browse/MN-34)] - Monitors for AWS ELB
*   [[MN-74](https://onejira.atlassian.net/browse/MN-74)] - Azure App Services monitors
*   [[MN-75](https://onejira.atlassian.net/browse/MN-75)] - Azure SQL monitors
*   [[MN-76](https://onejira.atlassian.net/browse/MN-76)] - Azure Redis monitors
*   [[MN-77](https://onejira.atlassian.net/browse/MN-77)] - Azure Event Hub monitors
*   [[MN-78](https://onejira.atlassian.net/browse/MN-78)] - Azure Stream Analytics monitors
*   [[MN-79](https://onejira.atlassian.net/browse/MN-79)] - Azure Storage monitors
*   [[MN-80](https://onejira.atlassian.net/browse/MN-80)] - Azure IOT Hub monitors
*   [[MN-90](https://onejira.atlassian.net/browse/MN-90)] - API Management monitors

## Story

*   [[MN-73](https://onejira.atlassian.net/browse/MN-73)] - Azure managed services monitors

## Documentation

*   [[MN-97](https://onejira.atlassian.net/browse/MN-97)] - Update readme on terraform monitors repo

# v1.0.0 (December 24, 2017)

## Improvement

*   [[MN-93](https://onejira.atlassian.net/browse/MN-93)] - AWS ELB custom tags
*   [[MN-131](https://onejira.atlassian.net/browse/MN-131)] - Replace comparator variable by a hardcode comparator in monitor name
*   [[MN-144](https://onejira.atlassian.net/browse/MN-144)] - Default nodata message must be 24x7

## New Feature

*   [[MN-43](https://onejira.atlassian.net/browse/MN-43)] - Agent installation

## Story

*   [[MN-27](https://onejira.atlassian.net/browse/MN-27)] - Monitors for main middlewares
