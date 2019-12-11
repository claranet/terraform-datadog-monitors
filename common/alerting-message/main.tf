data "template_file" "alerting-message" {
  template = <<EOF
$${prepend_text}
{{#is_alert}} $${message_alert} {{/is_alert}}
{{#is_warning}} $${message_warning} {{/is_warning}}
{{#is_no_data}} $${message_nodata} {{/is_no_data}}
{{#is_recovery}} $${message_recovery} {{/is_recovery}}
$${append_text}
EOF

  vars = {
    message_alert    = var.message_alert
    message_warning  = coalesce(var.message_warning, var.message_alert)
    message_nodata   = coalesce(var.message_nodata, var.message_alert)
    message_recovery = join(" ", compact(distinct(list(var.message_alert, var.message_warning, var.message_nodata))))
    prepend_text     = var.prepend_text
    append_text      = var.append_text
  }
}

