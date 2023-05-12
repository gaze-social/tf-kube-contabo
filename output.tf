output "private_ips_instances" {
  description = "Private IP for Instances"
  value = contabo_private_network.kube.instances[*].private_ip_config[*].v4[*].ip
}
