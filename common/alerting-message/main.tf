data "template_file" "alerting-message" {
  template = <<EOF
$${prepend_text}
{{#is_alert}} $${message_alert} {{/is_alert}}
{{#is_warning}} $${message_warning} {{/is_warning}}
{{#is_no_data}} $${message_nodata} {{/is_no_data}}
{{#is_recovery}} $${message_alert} $${message_warning} $${message_nodata} {{/is_recovery}}
$${append_text}
EOF

  vars = {
    message_alert   = var.message_alert
    message_warning = var.message_warning
    message_nodata  = coalesce(var.message_nodata, var.message_alert)
    prepend_text    = var.prepend_text
    append_text     = var.append_text
  }
}

