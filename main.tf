provider "aws" {
  profile = "default"
  region  = "ap-south-1"
}

resource "aws_launch_configuration" "app_server" {
  ami           = var.ami
  instance_type = var.instance-type
  key_name = var.key-name
  user_data = data.template_file.userdata.rendered
  #user = data.template_file.testdata.rendered
  #tags = {
   # Name = var.instance-name
  #}
}
#resource "aws_security_group" "sg" {
#  tags = {
#    type = "launch-wizard-2"
#  }
#}


