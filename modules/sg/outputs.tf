output "allowed_ports" {
  value = yandex_vpc_security_group.sg-1.ingress[*].port
}

output "security_group_name" {
  value = yandex_vpc_security_group.sg-1.name
}

output "security_group_id" {
  value = yandex_vpc_security_group.sg-1.id
}
