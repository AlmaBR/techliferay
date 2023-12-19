provider "google" {
  credentials = file("<path-to-your-service-account-key>")
  project     = "<your-gcp-project>"
  region      = "us-central1"
}

resource "google_container_cluster" "my_cluster" {
  name     = "my-gke-cluster"
  location = "us-central1"

  # Specify the node pool configurations
  node_pool {
    name       = "default-pool"
    machine_type = "e2-standard-2"
    disk_size_gb = 10
    min_count    = 1
    max_count    = 3
  }

  # Enable multi-zonal cluster
  remove_default_node_pool = true
  enable_tpu               = false

  # Enable multi-zonal cluster
  regional = true

  # Specify the zones within the region
  locations = ["us-central1-a", "us-central1-b", "us-central1-c"]
}

output "cluster_name" {
  value = google_container_cluster.my_cluster.name
}

output "kubeconfig" {
  value = google_container_cluster.my_cluster.kube_config[0].raw_config
}
