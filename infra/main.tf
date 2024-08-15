# Resource Group
resource "azurerm_resource_group" "alt_school_capstone" {
  name     = "alt-school-capstone"
  location = "westus2"
}


# Cluster
resource "azurerm_kubernetes_cluster" "ay_capstone_cluster" {
    automatic_channel_upgrade           = "patch"
    kubernetes_version                  = "1.29.7"
    location                            = "westus2"
    name                                = "ay-capstone"
    dns_prefix                          = "ay-capstone-dns"
    resource_group_name                 = azurerm_resource_group.alt_school_capstone.name

    default_node_pool {
        enable_auto_scaling          = true
        max_count                    = 2
        max_pods                     = 110
        min_count                    = 1
        name                         = "nodepool"
        node_count                   = 2
        os_disk_size_gb              = 100
        vm_size                      = "Standard_D2s_v3"
        temporary_name_for_rotation  = "temporary"
    }

    identity {
        type         = "SystemAssigned"
    }


    oms_agent {
        msi_auth_for_monitoring_enabled = true
        log_analytics_workspace_id      = azurerm_log_analytics_workspace.log_workspace.id
    }
}



# Logging
resource "azurerm_log_analytics_workspace" "log_workspace" {
  name                = "log-workspace"
  location            = "westus2"
  resource_group_name = azurerm_resource_group.alt_school_capstone.name
  retention_in_days   = 30
}

resource "azurerm_monitor_data_collection_rule" "data_collection_rule" {
    kind                = "Linux"
    location            = "westus2"
    name                = "MSCI-westus2-ay-capstone"
    resource_group_name = azurerm_resource_group.alt_school_capstone.name

    data_flow {
        destinations = [
            "ciworkspace",
        ]
        streams      = [
            "Microsoft-ContainerInsights-Group-Default",
        ]
    }

    data_sources {
        extension {
            extension_json     = jsonencode(
                {
                    dataCollectionSettings = {
                        enableContainerLogV2   = true
                        interval               = "5m"
                        namespaceFilteringMode = "Exclude"
                        namespaces             = [
                            "kube-system",
                            "gatekeeper-system",
                            "azure-arc",
                        ]
                    }
                }
            )
            extension_name     = "ContainerInsights"
            name               = "ContainerInsightsExtension"
            streams            = [
                "Microsoft-ContainerInsights-Group-Default",
            ]
        }
    }

    destinations {
        log_analytics {
            name                  = "ciworkspace"
            workspace_resource_id = azurerm_log_analytics_workspace.log_workspace.id
        }
    }
}

resource "azurerm_monitor_data_collection_rule_association" "data_collection_rule_association" {
  name                        = "ContainerInsightsExtension"
  target_resource_id          = azurerm_kubernetes_cluster.ay_capstone_cluster.id
  data_collection_rule_id     = azurerm_monitor_data_collection_rule.data_collection_rule.id
}

