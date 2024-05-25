variable "rgname" {
  type        = string
  description = "Name of the resource group to be created for the function"
  default     = "function-rg"

}

variable "location" {
  type        = string
  description = "Location for the resource group"
  default     = "eastus"

}

variable "saname" {
  type        = string
  description = "Name of the storage account name"
  default     = "functionsa170296"

}

variable "accounttier" {
  type        = string
  description = "Storage account tier"
  default     = "Standard"

}

variable "repltype" {
  type        = string
  description = "Replication type for the Storage account"
  default     = "LRS"

}

variable "spname" {
  type        = string
  description = "Name of the service plan for the function"
  
}

variable "skuname" {
  type        = string
  description = "SKU for the Service plan"
  default     = "B1"

}

variable "ostype" {
  type        = string
  default     = "Linux"
  description = "Operating system"

}

variable "funcname" {
  type        = string
  description = "Name of the function app"

}

variable "zipfilepath" {
  type        = string
  description = "Path to zip file where the py files are stored"

}

variable "clientid" {
  type        = string
  description = "client id of the app registraion for the active directory authentication"

}

variable "tenantauth" {
  type        = string
  description = "tenant endpoint auth url for token generation"

}

variable "allowedaudiences" {
  type        = string
  description = "Allowed audiences"

}

variable "python_version" {
  type        = string
  description = "Version of python"
  default     = "3.11"

}