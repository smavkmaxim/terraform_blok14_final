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


resource "yandex_vpc_security_group" "sg-1" {
  name        = "sg-worldpress-kma-${var.env}"
  description = "description for my security group"
  network_id  = var.network_id
  folder_id = var.custom_folder_id

  ingress {
    protocol       = "TCP"
    description    = "ext-http"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 80
  }

  ingress {
    protocol       = "TCP"
    description    = "ext-ssh"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 22
  }

  ingress {
    protocol       = "TCP"
    description    = "ext-msql"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 3306
  }

  ingress {
    protocol       = "TCP"
    description    = "ext-https"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 443
  }

  egress {
    protocol       = "ANY"
    description    = "any"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}
