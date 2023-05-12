variable "image_id" {
  description = "Image Id (Default: Ubuntu 22.04 LTS)"
  default = "afecbb85-e2fc-46f0-9684-b46b1faf00bb"
}

variable "master_product_id" {
  description = "Product Id Contabo for Master Node"
  default = "V2"
}

variable "worker_product_id" {
  description = "Product Id Contabo for Worker Node"
  default = "V3"
}

variable "region" {
  description = "Contabo Region EU, US"
  default = "US-central"
}

variable "client_id" {
  description = "Contabo API OAuth Client ID"
}

variable "client_secret" {
  description = "Contabo API OAuth Client Secret"
}

variable "username" {
  description = "Contabo API OAuth Username"
}

variable "password" {
  description = "Contabo API OAuth Password"
}

variable "public_key" {
  description = "SSH Public Key for VPS"
}

variable "master_count" {
  description = "Count of VPS for Master Nodes"
  default = 3
}

variable "workers_count" {
  description = "Count of VPS for Worker Nodes"
  default = 3
}