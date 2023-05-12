locals {
  user_data_file = templatefile("cloud_init.yaml.tftpl", { public_key = var.public_key })
}

# Master Nodes
resource "contabo_instance" "master" {
  count         = var.master_count

  display_name  = "master-node-01"
  product_id    = var.master_product_id
  region        = var.region
  image_id      = var.image_id
  user_data     = local.user_data_file
  add_ons {
    id = 1477
  }
}

# Worker Nodes
resource "contabo_instance" "worker" {
  count        = var.workers_count

  display_name  = "worker-node-01"
  product_id    = var.worker_product_id
  region        = var.region
  image_id      = var.image_id
  user_data     = local.user_data_file
  add_ons {
    id = 1477
  }
}

# Create a new private network
resource "contabo_private_network" "kube" {
  name        = "kube-private-network"
  region      = var.region
  instance_ids = flatten([
    contabo_instance.master[*].id, 
    contabo_instance.worker[*].id
  ])
}