variable "do_token" {
  description = "đây là do_token"         // giữ nguyên cái này, nó được lấy từ tfvars
}

variable "ssh_key" {
  description = "đây là ssh-key"          // giữ nguyên cái này, nó được lấy từ tfvars
}

terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.67.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "setup" {
  name   = "terraform-vps"
  region = "syd1"              # Sydney 1
  size = "s-2vcpu-4gb"
  image  = "ubuntu-24-04-x64"
  ssh_keys = [var.ssh_key]
}

output "droplet_ip" {
  value = digitalocean_droplet.setup.ipv4_address //lấy địa chỉ IP của droplet từ tài nguyên digitalocean_droplet.setup 
}