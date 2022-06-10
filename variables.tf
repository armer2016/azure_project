variable "rg_name" {
  type        = string
  default     = ""
  description = "please provide rg_name"
}
variable "rg_location" {
  type        = string
  default     = "westus"
  description = "please provide location"
}
variable "address_space" {
  type        = list(any)
  default     = ["10.0.0.0/16"]
  description = "please provide address_space"
}
variable "address_prefix1" {
  type        = string
  description = "please provide address_prefix"
}
variable "address_prefix2" {
  type        = string
  description = "please provide address_prefix"
}
variable "address_prefix3" {
  type        = string
  description = "please provide address_prefix"
}
variable "subnet_names1" {
  type        = string
  description = "please provide subnet names"
}

variable "subnet_names2" {
  type        = string
  description = "please provide subnet names"
}

variable "subnet_names3" {
  type        = string
  description = "please provide subnet names"
}
variable "vnet_name" {
  type        = string
  description = "VNET Name"
}
