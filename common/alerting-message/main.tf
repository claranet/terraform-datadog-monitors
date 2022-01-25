data "template_file" "alerting-message" {
  template = <<EOF
$${prepend_text}
{{#is_alert}} $${message_alert} {{/is_alert}}
{{#is_alert_recovery}} $${message_alert}} {{/is_alert_recovery}}
{{#is_alert_to_warning}} $${message_alert} $${message_warning} {{/is_alert_to_warning}}

{{#is_warning}} $${message_warning} {{/is_warning}}
{{#is_warning_recovery}} $${message_warning} {{/is_warning_recovery}}

{{#is_no_data}} $${message_nodata} {{/is_no_data}}
{{#is_no_data_recovery}} $${message_nodata} {{/is_no_data_recovery}}
$${append_text}
EOF

  vars = {
    message_alert    = var.message_alert
    message_warning  = var.message_warning == null ? var.message_alert : var.message_warning
    message_nodata   = var.message_nodata == null ? var.message_alert : var.message_nodata
    prepend_text     = var.prepend_text
    append_text      = var.append_text
  }
}
