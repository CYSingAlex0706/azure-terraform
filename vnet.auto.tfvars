vnet_config = {
  "vpc-01" = {
    name          = "testing-vnet"
    address_space = ["10.0.0.0/16"]
  }
}

subnet_config = {
    "subnet-01" = {
      vnet_key       = "vpc-01"
      name = "ssubnet-01"
      cidr = ["10.0.1.0/24"]
    }
    "subnet-01" = {
      vnet_key       = "vpc-01"
      name = "subnet-02"
      cidr = ["10.0.2.0/24"]
    }
  }