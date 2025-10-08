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

resource "yandex_compute_instance" "vm-wordpress-mysql_kma" {
  name = "vm-wordpress-mysql_kma${var.env}"
  zone = var.custom_zone
  folder_id = var.custom_folder_id
  platform_id = "standard-v2"
  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd82sqrj4uk9j7vlki3q"
    }
  }
  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }
}
