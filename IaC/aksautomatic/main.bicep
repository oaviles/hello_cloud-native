@description('The name of the managed cluster resource.')
param clusterName string = 'AKSCluster-Demo'

@description('The location of the managed cluster resource.')
param location string = resourceGroup().location

resource aks 'Microsoft.ContainerService/managedClusters@2024-03-02-preview' = {
  name: clusterName
  location: location  
  sku: {
	name: 'Automatic'
  }
  properties: {
    agentPoolProfiles: [
      {
        name: 'systempool'
        mode: 'System'
	count: 3
      }
    ]
  }
  identity: {
    type: 'SystemAssigned'
  }
}
