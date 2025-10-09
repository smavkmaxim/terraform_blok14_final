terraform {
  source = "../../modules/sg"
}

# указание зависимости, так как наша виртуальная машина требует подсети
# идентификатор подсети мы получаем из модуля VPC
dependency "vpc" {
  config_path = "../vpc"
    mock_outputs = {
    network-1-kma = "temporary-dummy-id" # требуется для нормальной работы зависимостей
  }
}

inputs = {
    cidr_block = ["192.168.100.0/24"]
    env        = "dev"
    custom_zone       = "ru-central1-d"
    network_id = dependency.vpc.outputs.network-1-kma
}

