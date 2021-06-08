remote_state {
  backend = "gcs"
  config = {
    bucket = "terraform-sandbox-1234"
    prefix = "${path_relative_to_include()}"
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "google" {
  project = "home-lab-224920"
}
EOF
}
