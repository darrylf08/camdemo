#####################################################################
##
##      Created 11/6/19 by bob. for GoogleTest
##
#####################################################################

terraform {
  required_version = "> 0.8.0"
}

// Google Cloud provider
provider "google" {
  version = "~> 1.5"
}

// Create a new compute engine resource
resource "google_compute_instance" "default" {
  name         = "${var.unique_resource_name}"
  machine_type = "${var.machine_type}"
  zone         = "${var.zone}"
  boot_disk {
    initialize_params {
      image = "${var.boot_disk}"
    }
  }
  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}