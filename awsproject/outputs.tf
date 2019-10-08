#####################################################################
##
##      Created 9/25/19 by bob. for awsproject
##
#####################################################################

output "aws_server_ip_address" {
  value =  "$(aws_instance.aws_server.public_ip)"
  }
output "aws_server_public_dns" {
  value =  "$(aws_instance.aws_server.public_dns)"
  }