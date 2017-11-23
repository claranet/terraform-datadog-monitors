data "template_file" "alerting-message" {
  template = <<EOF
$${prepend_text}
{{#is_alert}}$${oncall_24x7}{{/is_alert}}
{{#is_recovery}}$${oncall_24x7}{{/is_recovery}}
{{#is_warning}}$${oncall_office_hours}{{/is_warning}}
{{#is_warning_recovery}}$${oncall_office_hours}{{/is_warning_recovery}}
$${append_text}
EOF

  vars {
    oncall_24x7         = "${var.oncall_24x7}"
    oncall_office_hours = "${var.oncall_office_hours}"
    prepend_text        = "${var.prepend_text}"
    append_text         = "${var.append_text}"
  }
}
