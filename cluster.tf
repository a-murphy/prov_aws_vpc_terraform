# Setup the provider
provider "google" {
  project = var.gcp_project_name
  region  = var.gcp_region
  zone    = var.gcp_zone
}

# Create a cluster
resource "google_container_cluster" "my_cluster" {
  name               = var.cluster_name
  location           = var.gcp_zone
  initial_node_count = 3

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    metadata = {
      disable-legacy-endpoints = "true"
    }
  }

  timeouts {
    create = "30m"
    update = "40m"
  }
}


output "endpoint" {
  value = google_container_cluster.my_cluster.endpoint
}

output "cluster_name" {
  value = var.cluster_name
}

output "cluster_zone" {
  value = var.gcp_zone
}
