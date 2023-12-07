#Providers.tf

terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}
# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}

#main.tf

resource "digitalocean_kubernetes_cluster" "doks" {
  name   = "pumej-cluster"
  region = "nyc1"
  # Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.28.2-do.0"
  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-4gb"
    node_count = 3
  }
}

#variables.tf

variable "do_token" {
  type        = string
  description = "Your Digital Ocean Api Token"
  default     = "dop_v1_cce38f613e4b6f4853c0c5c941e965174caad44d4a993cf48967521271a4430d"
}