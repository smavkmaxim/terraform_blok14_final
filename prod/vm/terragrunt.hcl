# файл для VM
terraform {
  source = "../../modules/vm"
}
# указание зависимости, так как наша виртуальная машина требует подсети
# идентификатор подсети мы получаем из модуля VPC
dependency "vpc" { 
  config_path = "../vpc"
    mock_outputs = {
    subnet-1-kma = "temporary-dummy-id" # требуется для нормальной работы зависимостей
  }
}

inputs = {
    env        = "prod"
    custom_zone       = "ru-central1-d"
    subnet_id  = dependency.vpc.outputs.subnet-1-kma
}

