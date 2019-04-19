output "disk_pressure_id" {
  description = "id for monitor disk_pressure"
  value       = "${datadog_monitor.disk_pressure.*.id}"
}

output "disk_out_id" {
  description = "id for monitor disk_out"
  value       = "${datadog_monitor.disk_out.*.id}"
}

output "memory_pressure_id" {
  description = "id for monitor memory_pressure"
  value       = "${datadog_monitor.memory_pressure.*.id}"
}

output "ready_id" {
  description = "id for monitor ready"
  value       = "${datadog_monitor.ready.*.id}"
}

output "kubelet_ping_id" {
  description = "id for monitor kubelet_ping"
  value       = "${datadog_monitor.kubelet_ping.*.id}"
}

output "kubelet_syncloop_id" {
  description = "id for monitor kubelet_syncloop"
  value       = "${datadog_monitor.kubelet_syncloop.*.id}"
}

output "unregister_net_device_id" {
  description = "id for monitor unregister_net_device"
  value       = "${datadog_monitor.unregister_net_device.*.id}"
}

output "node_unschedulable_id" {
  description = "id for monitor node_unschedulable"
  value       = "${datadog_monitor.node_unschedulable.*.id}"
}
