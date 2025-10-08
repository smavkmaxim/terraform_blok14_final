# файл для VPC
terraform {
  source = "../../modules/vpc"
}

inputs = {
    cidr_block = ["192.168.100.0/24"]
    env        = "dev"
    custom_zone       = "ru-central1-d"
}
