locals {
  clusters = {
    foo-1 = {
      region                  = "us-west1"
      nodes                   = 16
      awesome_feature_enabled = true
    }
    bar-1 = {
      region                  = "us-west2"
      nodes                   = 12
      awesome_feature_enabled = false
    }
    bar-2 = {
      region = "us-west2"
      nodes  = 12
      # oops this cluster does not have the feature flag set???
    }
  }

  zones = ["zone-1", "zone-2", "zone-3"]
  instances = ["app-1", "app-2", "app-3", "app-4", "app-5"]
}

module "hello" {
  for_each  = toset([for k, v in local.clusters : k if try(v.awesome_feature_enabled == true, false)])
  source    = "git::https://github.com/CuddlyDemos/terraform-sandbox.git//modules/hello_world?ref=hello_world/v1.0.0"
  file_name = each.key
}

resource "local_file" "instances" {
  for_each = toset(local.instances)
  content  = element(local.zones, index(local.instances, each.key))
  filename = each.key
}

output "clusters_with_awesome_feature" {
  value = [for k, v in local.clusters : k if try(v.awesome_feature_enabled == true, false)]
}

output "clusters_without_awesome_feature" {
  value = [for k, v in local.clusters : k if try(v.awesome_feature_enabled != true, false)]
}
