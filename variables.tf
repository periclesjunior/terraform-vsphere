variable "vsphere_user" {
  description = "vSphere user name"
}

variable "vsphere_password" {
  description = "vSphere password"
}

variable "vsphere_server" {
  description = "vCenter server FQDN or IP"
}

variable "vsphere_datacenter" {
  description = "Datacenter used for the vSphere virtual machines"
}

variable "vsphere_datastore" {
  description = "Datastore used for the vSphere virtual machines"
}

variable "vsphere_resource_pool" {
  description = "Pool used for the vSphere virtual machines"
}

variable "vsphere_network" {
  description = "Network used for the vSphere virtual machines"
}

variable "vsphere_host" {
  description = "Host used for the vSphere virtual machines"
}

variable "vsphere_virtual_machine_template" {
  description = "Template used for the vSphere virtual machines"
}

variable "vsphere_virtual_machine_name" {
  description = "The name of the vSphere virtual machines and the hostname of the machine"
}

variable "vsphere_virtual_machine_cpus" {
  description = "Number of vCPU for the vSphere virtual machines"
}

variable "vsphere_virtual_machine_memory" {
  description = "Amount of RAM for the vSphere virtual machines (example: 1024)"
}

variable "vsphere_virtual_machine_domain" {
  description = ""
}

variable "vsphere_virtual_machine_ip" {
  description = "Ip used for the vSpgere virtual machine"
}

variable "vsphere_virtual_machine_netmask" {
  description = "Netmask used for the vSphere virtual machine (example: 24)"
}

variable "vsphere_virtual_machine_gateway" {
  description = "Gateway for the vSphere virtual machine"
}

variable "vsphere_virtual_machine_dns" {
  description = "DNS for the vSphere virtual machine"
}

variable "vsphere_virtual_machine_dns_suffix" {
  description = "DNS suffix for the vSphere virtual machine"
}
