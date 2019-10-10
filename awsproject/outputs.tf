#####################################################################
##
##      Created 9/25/19 by bob. for awsproject
##
#####################################################################

output "aws_server_ip_address" {
  value =  "${aws_instance.aws_server.public_ip}"
  }
output "aws_server_login" {
  value =  "<a href=ssh://ec-user@${aws_instance.aws_server.public_dns}/c:\\Temp\\SSH_URL\\key-pair-1.ppk>Click here</a> "
  }