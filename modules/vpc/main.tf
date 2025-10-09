terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  zone = var.custom_zone
  service_account_key_file = "/opt/authorized_key.json"
}

resource "yandex_vpc_network" "network-1-kma" {
  name = "network-kma-${var.env}"
  folder_id = var.custom_folder_id
}

resource "yandex_vpc_subnet" "subnet-1-kma" {
  name           = "network-kma-${var.env}"
  description = "for SQL without Internet"
  network_id     = yandex_vpc_network.network-1-kma.id
  v4_cidr_blocks = ["192.168.19.0/24"]
  folder_id = var.custom_folder_id
  zone = var.custom_zone 
}

#resource "yandex_vpc_subnet" "subnet-2" {
#  name           = "network-${var.env}"
#  description = "for WorldPress with Internet"
#  network_id     = yandex_vpc_network.network-1.id
#  v4_cidr_blocks = ["192.168.90.0/24"]
#  folder_id = var.custom_folder_id
#  zone = var.custom_zone
#}
