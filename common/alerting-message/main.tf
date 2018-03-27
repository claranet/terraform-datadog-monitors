locals {
  oncall_nodata = "${var.oncall_nodata == "" ? var.oncall_alert : var.oncall_nodata}"
}

data "template_file" "alerting-message" {
  template = <<EOF
$${prepend_text}
{{#is_alert}}$${oncall_alert}{{/is_alert}}
{{#is_recovery}}$${oncall_alert}{{/is_recovery}}
{{#is_warning}}$${oncall_warning}{{/is_warning}}
{{#is_warning_recovery}}$${oncall_warning}{{/is_warning_recovery}}
{{#is_no_data}}$${oncall_nodata}{{/is_no_data}}
{{#is_no_data_recovery}}$${oncall_nodata}{{/is_no_data_recovery}}
$${append_text}
EOF

  vars {
    oncall_alert   = "${var.oncall_alert}"
    oncall_warning = "${var.oncall_warning}"
    oncall_nodata  = "${local.oncall_nodata}"
    prepend_text   = "${var.prepend_text}"
    append_text    = "${var.append_text}"
  }
}
