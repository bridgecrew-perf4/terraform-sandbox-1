locals {
  filename = "${path.root}/tmp/${var.file_name}"
  content  = "${var.content}\n"
}

resource "local_file" "foo" {
  content  = local.content
  filename = local.filename
  file_permission = var.file_permission
}
