#####################################################################
##
##      Created 9/27/19 by bob. for VMWare1VM
##
#####################################################################

variable "user" {
  type = "string"
  description = "Generated"
}

variable "password" {
  type = "string"
  description = "Generated"
}

variable "vsphere_server" {
  type = "string"
  description = "Generated"
}

variable "allow_unverified_ssl" {
  type = "string"
  description = "Generated"
}

variable "vm_instance_name" {
  type = "string"
  description = "Virtual machine name for vm_instance"
}

variable "vm_instance_number_of_vcpu" {
  type = "string"
  description = "Number of virtual cpu's."
}

variable "vm_instance_memory" {
  type = "string"
  description = "Memory allocation."
}

variable "vm_instance_disk_name" {
  type = "string"
  description = "The name of the disk. Forces a new disk if changed. This should only be a longer path if attaching an external disk."
}

variable "vm_instance_disk_size" {
  type = "string"
  description = "The size of the disk, in GiB."
}

variable "vm_instance_template_name" {
  type = "string"
  description = "Generated"
}

variable "vm_instance_datacenter_name" {
  type = "string"
  description = "Generated"
}

variable "vm_instance_datastore_name" {
  type = "string"
  description = "Generated"
}

variable "vm_instance_resource_pool" {
  type = "string"
  description = "Resource pool."
}

variable "network1_network_name" {
  type = "string"
  description = "Generated"
}

