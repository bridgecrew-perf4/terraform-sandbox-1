locals {
  create_world = false
}

module "hello" {
  source    = "git::https://github.com/CuddlyDemos/terraform-sandbox.git//modules/hello_world?ref=hello_world/v1.0.0"
  file_name = "hello.txt"
}

module "world" {
  source    = "git::https://github.com/CuddlyDemos/terraform-sandbox.git//modules/hello_world?ref=hello_world/v1.0.0"
  file_name = "world.txt"
  count     = local.create_world == true ? 1 : 0
}
