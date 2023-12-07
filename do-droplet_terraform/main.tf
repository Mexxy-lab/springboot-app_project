# Data source for our SSH key
data "digitalocean_ssh_key" "pumej-dokey" {
  name = "pumej"
}

# Creating a Digital Ocean Droplet
# ssh_keys would be your key name which was added to your security account
resource "digitalocean_droplet" "pumej-droplet" {
  image    = var.image
  name     = var.droplet_name
  region   = var.droplet_region
  size     = var.image_size
  ssh_keys = [data.digitalocean_ssh_key.pumej-dokey.id]
}