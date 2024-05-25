resource "azurerm_resource_group" "rg" {
  name     = var.rgname
  location = var.location

}

resource "azurerm_storage_account" "sa" {
  name                     = var.saname
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = var.accounttier
  account_replication_type = var.repltype

}

resource "azurerm_service_plan" "asp" {
  name                = var.spname
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku_name            = var.skuname
  os_type             = var.ostype
}

resource "azurerm_linux_function_app" "fa" {
  name                       = var.funcname
  resource_group_name        = azurerm_resource_group.rg.name
  location                   = azurerm_resource_group.rg.location
  service_plan_id            = azurerm_service_plan.asp.id
  storage_account_name       = azurerm_storage_account.sa.name
  storage_account_access_key = azurerm_storage_account.sa.primary_access_key

  identity {
    type = "SystemAssigned"
  }

  site_config {
    always_on = true
    application_stack {
      python_version = var.python_version
    }
  }

  zip_deploy_file = var.zipfilepath

  auth_settings_v2 {
    auth_enabled           = true
    unauthenticated_action = "Return401"
    default_provider       = "azureactivedirectory"
    active_directory_v2 {
      client_id            = var.clientid
      tenant_auth_endpoint = var.tenantauth
      allowed_audiences    = [var.allowedaudiences]
    }
    login {

    }

  }
}