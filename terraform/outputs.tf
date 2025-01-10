output "management_vm_ips" {
  description = "IP addresses of the management node"
  value       = harvester_virtualmachine.mgmtvm[*].network_interface[0].ip_address
}

output "worker_vm_ips" {
  description = "IP addresses of the worker nodes"
  value       = harvester_virtualmachine.worker[*].network_interface[0].ip_address
}

output "storage_vm_ip" {
  description = "IP address of the storage node (if created)"
  value       = length(harvester_virtualmachine.storage) > 0 ? harvester_virtualmachine.storage[0].network_interface[0].ip_address : null
}

