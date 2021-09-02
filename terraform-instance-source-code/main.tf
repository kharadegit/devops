provider "aws" {
  profile = "default"
  region = "${var.region}"
  #access_key = "
  #secret_key  = "cQX75dIUXxzM0S2vdQ4LPmJ6qxXc1q6I62JrE2FZ"
}


resource "aws_instance" "web" {
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"

  tags = {
    Name = "${var.tag}"
  }
}
