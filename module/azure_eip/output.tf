output "public_ip_address_id" {
  description = "Public IP address of the VM"
  value       = azurerm_public_ip.pip.id
}