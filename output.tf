output "ip" {
   value = vsphere_virtual_machine.vm.*.default_ip_address
}

# show IP, run 'terraform refresh' if not populated
output "name" {
   value = vsphere_virtual_machine.vm.*.name
}
