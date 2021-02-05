terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.5.1"
    }
  }
}

resource "digitalocean_kubernetes_cluster" "doks_cluster" {
  name    = "doks-cluster"
  region  = "nyc1"
  version = "1.20.2-do.0"
  node_pool {
    name       = "default-pool"
    size       = "s-1vcpu-2gb"
    auto_scale = false
    node_count = 2
    tags       = ["node-pool-tag"]
  }
}
