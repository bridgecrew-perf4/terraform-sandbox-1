locals {
  create_world = false
}

module "hello" {
  source = "../modules/hello_world"
  file_name = "hello.txt"
}

module "world" {
  source = "../modules/hello_world"
  file_name = "world.txt"
  count = local.create_world == true ? 1 : 0
}
