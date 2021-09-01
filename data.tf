data "template_file" "userdata" {
  #template = "${file("${path.module}/templates/user-data.sh.tpl")}"
template = "${format("%s%s",file("${path.module}/templates/user-data.sh.tpl"),file("${path.module}/templates/test.sh.tpl"))}"
  vars = {
    name           = var.instance-name
}
}
