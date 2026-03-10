vm_config = {
  # Web服务器
  "web-vm" = {
    name = "web-server-01"
    size = "Standard_B1ms"

    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
      disk_size_gb         = 30
    }

    image = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-focal"
      sku       = "20_04-lts"
      version   = "latest"
    }

    user_data = <<-EOF
    #!/bin/bash
    set -e

    # Update system
    apt-get update
    apt-get install -y openjdk-21-jdk wget

    # Install Jenkins
    mkdir -p /etc/apt/keyrings
    wget -O /etc/apt/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key
    echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | tee /etc/apt/sources.list.d/jenkins.list
    apt-get update
    apt-get install -y jenkins

    # Start Jenkins
    systemctl enable jenkins
    systemctl start jenkins

    # Wait and save initial password
    sleep 30
    echo "=== Jenkins Initial Admin Password ===" > /home/ubuntu/jenkins-info.txt
    cat /var/lib/jenkins/secrets/initialAdminPassword >> /home/ubuntu/jenkins-info.txt
    echo "=====================================" >> /home/ubuntu/jenkins-info.txt
    echo "Jenkins URL: http://$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4):8080" >> /home/ubuntu/jenkins-info.txt
    EOF

    disable_password_authentication = false
  }
}

ip_configs = {
  "web-vm-pip" = {
    name              = "web-vm-public-ip"
    allocation_method = "Static"
    sku               = "Standard"
  }
  # 可以为每个 VM 定义不同的公共 IP 配置
}