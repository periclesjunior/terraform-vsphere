provider "vsphere" {
  user           = var.vsphere_user 
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = var.vsphere_resource_pool
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.vsphere_network
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_host" "host" {
  name          = var.vsphere_host
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.vsphere_virtual_machine_template
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "vm" {
  name                       = var.vsphere_virtual_machine_name
  resource_pool_id           = data.vsphere_resource_pool.pool.id
  datastore_id               = data.vsphere_datastore.datastore.id
  num_cpus                   = var.vsphere_virtual_machine_cpus
  memory                     = var.vsphere_virtual_machine_memory
  guest_id                   = data.vsphere_virtual_machine.template.guest_id
  firmware                   = data.vsphere_virtual_machine.template.firmware
  scsi_type                  = data.vsphere_virtual_machine.template.scsi_type
  wait_for_guest_net_timeout = 0
  wait_for_guest_ip_timeout  = 0

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = var.vsphere_virtual_machine_name
        domain    = var.vsphere_virtual_machine_domain
      }

      network_interface {
        ipv4_address = var.vsphere_virtual_machine_ip
        ipv4_netmask = var.vsphere_virtual_machine_netmask
      }

      ipv4_gateway = var.vsphere_virtual_machine_gateway
      dns_server_list = [var.vsphere_virtual_machine_dns]
      dns_suffix_list = [var.vsphere_virtual_machine_dns_suffix]
    }
  }
}

