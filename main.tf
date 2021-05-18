terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "1.16.0"
    }
  }
}

provider "linode" {
    token = var.token
}


resource "linode_instance" "net_scanner" {
    label = "network-scanner"
    image = "linode/debian10"
    region = var.region
    type = "g6-nanode-1"
    authorized_keys = [var.ssh_key]
    root_pass = var.root_pass
}


output "instance_ip" {
  value = linode_instance.net_scanner.ip_address
}
