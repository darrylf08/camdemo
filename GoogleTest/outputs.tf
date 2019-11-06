#####################################################################
##
##      Created 11/6/19 by bob. for GoogleTest
##
#####################################################################

output "Name" {
  value = "${google_compute_instance.default.name}"
}

output "External_IP" {
  value = "${google_compute_instance.default.network_interface.0.access_config.0.assigned_nat_ip}"
}

output "Internal_IP" {
  value = "${google_compute_instance.default.network_interface.0.address}"
}