resource "datadog_monitor" "datadog_cassandra_down" {
  name    = "Cassandra service is down"
  message = "{{#is_alert}}\n${var.alert_HNO} \n{{/is_alert}} \n{{#is_recovery}}\n${var.alert_HNO}\n{{/is_recovery}}"
  query   = "\"cassandra.can_connect\".over(\"cassandra-node\").by(\"host\",\"instance\").last(2).count_by_status()"
  type    = "service check"

  notify_no_data      = false
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = 300
  notify_no_data      = false
  renotify_interval   = 0
  no_data_timeframe   = 20
}

/*resource "datadog_monitor" "datadog_rule_27" {
name   = "OpsCenter process is down"
message = "{{#is_alert}}\n${var.alert_HNO} \n{{/is_alert}} \n${var.warning_HO}"
query   = "\"process.up\".over(\"opscenter\",process:\"opscenter\").last(1).count_by_status()"
type  = "service check"

notify_no_data      = false
renotify_interval   = 60
notify_audit        = false
timeout_h           = 0
include_tags        = true
locked              = false
require_full_window = true
new_host_delay      = 300
notify_no_data      = false
renotify_interval   = 0
no_data_timeframe   = 20

}*/

