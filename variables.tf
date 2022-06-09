variable rg_name  {
  type        = string
  default     = ""
  description = "please provide rg_name"
}
variable rg_location {
    type = string
    default = "westus"
    description = "please provide location"
}
variable address_space {
    type = string
    default = "10.0.0.0/16"
    description = "please provide address_space"
}
variable address_prefix {
    type = list
    description = "please provide address_prefix"
}
variable subnet_names {
    type = list
    description = "please provide subnet names"
}
