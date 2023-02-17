
variable "rg_name" {
  type        = string
  default     = "TEST-RG"
}
variable "prefix" {
#  default = "TEST"
}
variable "az_region" {
  type        = string
  default     = "westeurope"
}
variable "admin_username" {
  description = "Name of administrator account of the virtual machine."
  type        = string
  default     = "azureadmin"
}
variable "admin_password" {
  description = "Password for the administrator account of the virtual machine."
  type        = string
}
variable "vm_size" {
  description = "VM Size with Accelerated Network support only"
  type        = string
  default     = "Standard_DC2ds_v3"
}
variable "ppg_id" {
  description = "Proximity Placement Group name"
  type        = string
}
variable "nic_enable_accelerated_networking" {
  description = "Should Accelerated Networking be enabled? Defaults to `false`."
  type        = bool
  default     = true
}
variable "zone_id" {
  description = "Index of the Availability Zone which the Virtual Machine should be allocated in."
  type        = number
  default     = 1
}
