locals {
  user_data_file = templatefile("cloud_init.yaml.tftpl", { public_key = var.public_key })
}

# Master Nodes
resource "contabo_instance" "master_node_00" {
  display_name  = "master-node-01"
  product_id    = var.master_product_id
  region        = var.region
  image_id      = var.image_id
  user_data     = local.user_data_file
  add_ons {
    id = 1477
  }
}

resource "contabo_instance" "master_node_01" {
  display_name  = "master-node-02"
  product_id    = var.master_product_id
  region        = var.region
  image_id      = var.image_id
  user_data     = local.user_data_file
  add_ons {
    id = 1477
  }
}

resource "contabo_instance" "master_node_02" {
  display_name  = "master-node-03"
  product_id    = var.master_product_id
  region        = var.region
  image_id      = var.image_id
  user_data     = local.user_data_file
  add_ons {
    id = 1477
  }
}

# Worker Nodes
resource "contabo_instance" "worker_node_00" {
  display_name  = "worker-node-01"
  product_id    = var.worker_product_id
  region        = var.region
  image_id      = var.image_id
  user_data     = local.user_data_file
  add_ons {
    id = 1477
  }
}

resource "contabo_instance" "worker_node_01" {
  display_name  = "worker-node-02"
  product_id    = var.worker_product_id
  region        = var.region
  image_id      = var.image_id
  user_data     = local.user_data_file
  add_ons {
    id = 1477
  }
}

resource "contabo_instance" "worker_node_02" {
  display_name  = "worker-node-03"
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
  instance_ids = [
    contabo_instance.master_node_00.id, 
    contabo_instance.master_node_01.id,
    contabo_instance.master_node_02.id,
    contabo_instance.worker_node_00.id,
    contabo_instance.worker_node_01.id,
    contabo_instance.worker_node_02.id
  ]
}