terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

resource "random_string" "vm-name" {
  length  = 12
  upper   = false
  number  = false
  lower   = true
  special = false
}

# Machine Name
locals {
  vm-name = "${random_string.vm-name.result}-vm"
}

resource "digitalocean_ssh_key" "default" {
  name       = "digitalocean"
  public_key = file(var.public_key_path)
}

# Droplet
resource "digitalocean_droplet" "dev" {
  image      = var.droplet_image
  name       = local.vm-name
  region     = var.droplet_region
  size       = var.droplet_size
  backups    = false
  monitoring = true
  ssh_keys   = [digitalocean_ssh_key.default.fingerprint]
}

resource "digitalocean_floating_ip" "dev" {
  droplet_id = digitalocean_droplet.dev.id
  region     = digitalocean_droplet.dev.region
}