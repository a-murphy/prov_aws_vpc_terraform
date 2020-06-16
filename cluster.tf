# Setup the provider
provider "google" {
  project = "${var.gcp_project_name}"
  region  = "${var.gcp_region}"
  zone    = "${var.gcp_zone}"
}

# Create a cluster
resource "google_container_cluster" "my_cluster" {
  name               = "my-vpc-native-cluster"
  location           = "${var.gcp_region}"
  initial_node_count = 1

  network    = "default"
  subnetwork = "default"

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "/16"
    services_ipv4_cidr_block = "/22"
  }
}

output "cluster_username" {
  value = data.google_container_cluster.my_cluster.master_auth[0].username
}

output "cluster_password" {
  value = data.google_container_cluster.my_cluster.master_auth[0].password
}

output "endpoint" {
  value = data.google_container_cluster.my_cluster.endpoint
}

output "instance_group_urls" {
  value = data.google_container_cluster.my_cluster.instance_group_urls
}

output "node_config" {
  value = data.google_container_cluster.my_cluster.node_config
}

output "node_pools" {
  value = data.google_container_cluster.my_cluster.node_pool
}
