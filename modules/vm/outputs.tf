output "public_ip" {
  value = yandex_compute_instance.vm_kma.network_interface[0].nat_ip_address
}    
