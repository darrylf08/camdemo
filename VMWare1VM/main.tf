#####################################################################
##
##      Created 9/27/19 by bob. for VMWare1VM
##
#####################################################################

## REFERENCE {"vsphere_network":{"type": "vsphere_reference_network"}}

terraform {
  required_version = "> 0.8.0"
}

provider "vsphere" {
  user           = "${var.user}"
  password       = "${var.password}"
  vsphere_server = "${var.vsphere_server}"

  allow_unverified_ssl = "${var.allow_unverified_ssl}"
  version = "~> 1.2"
}


data "vsphere_virtual_machine" "vm_instance_template" {
  name          = "${var.vm_instance_template_name}"
  datacenter_id = "${data.vsphere_datacenter.vm_instance_datacenter.id}"
}

data "vsphere_datacenter" "vm_instance_datacenter" {
  name = "${var.vm_instance_datacenter_name}"
}

data "vsphere_datastore" "vm_instance_datastore" {
  name          = "${var.vm_instance_datastore_name}"
  datacenter_id = "${data.vsphere_datacenter.vm_instance_datacenter.id}"
}

data "vsphere_network" "network1" {
  name          = "${var.network1_network_name}"
  datacenter_id = "${data.vsphere_datacenter.vm_instance_datacenter.id}"
}

resource "vsphere_virtual_machine" "vm_instance" {
  name          = "${var.vm_instance_name}"
  datastore_id  = "${data.vsphere_datastore.vm_instance_datastore.id}"
  num_cpus      = "${var.vm_instance_number_of_vcpu}"
  memory        = "${var.vm_instance_memory}"
  guest_id = "${data.vsphere_virtual_machine.vm_instance_template.guest_id}"
  resource_pool_id = "${var.vm_instance_resource_pool}"
  network_interface {
    network_id = "${data.vsphere_network.network1.id}"
  }
  clone {
    template_uuid = "${data.vsphere_virtual_machine.vm_instance_template.id}"
  }
  disk {
    name = "${var.vm_instance_disk_name}"
    size = "${var.vm_instance_disk_size}"
  }
}