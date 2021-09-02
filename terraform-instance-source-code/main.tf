provider "aws" {
  region = "${var.region}"
  access_key = "AKIAWESF7XJLJEWU6XUT"
  secret_key  = "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"
}


resource "aws_instance" "web" {
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"

  tags = {
    Name = "${var.tag}"
  }
}
