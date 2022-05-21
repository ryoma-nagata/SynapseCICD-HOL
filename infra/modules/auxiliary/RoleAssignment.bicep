// Copyright (c) Microsoft Corporation.
// Licensed under the MIT license.

// The module contains a template to create a role assignment to a storage account file system.
targetScope = 'resourceGroup'

// Parameters
param storageAccountId string
param synapseId string
param groupObjectId string 
param keyvaultId string

// Variables
var storageAccountName = last(split(storageAccountId,'/'))
var synapseName = last(split(synapseId,'/'))
var keyVaultame = last(split(keyvaultId,'/'))

var blobOwner = 'b7e6dc6d-f1e8-4753-8033-0f276bb0955b'
var blobcontributor = 'ba92f5b4-2d11-453d-a403-e96b0029c9fe'
var keyvaultadmin = '00482a5a-887f-4fb3-b363-3b7fe8e74483'
var secretuser ='4633458b-17de-408a-b874-0445c86b69e6'

// Resources
// 新規作成物
resource storageAccount 'Microsoft.Storage/storageAccounts@2021-02-01' existing = {
  name: '${storageAccountName}'
}

resource synapse 'Microsoft.Synapse/workspaces@2021-06-01' existing = {
  name: synapseName
}


resource keyvault 'Microsoft.KeyVault/vaults@2021-06-01-preview' existing = {
  name: keyVaultame
}



// 以下、RBAC設定
// サービス間認証

// 新規内
// Synapse->Data Lake Storage *ストレージ Blobデータ共同作成者*
resource SynapseStorageRoleAssignment 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' = {
  name: guid(storageAccount.id, synapse.id,blobcontributor)
  scope: storageAccount
  properties: {
    roleDefinitionId: resourceId('Microsoft.Authorization/roleDefinitions', blobcontributor)//blobcontributor
    principalId: synapse.identity.principalId
    principalType: 'ServicePrincipal'
  }
}

resource SynapseKeyVaultRoleAssignment 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' = {
  name: guid(keyvault.id, synapse.id,secretuser)
  scope: keyvault
  properties: {
    roleDefinitionId: resourceId('Microsoft.Authorization/roleDefinitions', secretuser)//secretuser
    principalId: synapse.identity.principalId
    principalType: 'ServicePrincipal'
  }
}


// 開発ユーザー->リソースグループ 
resource groupKeyvaultRoleAssignment 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' =if (!empty(groupObjectId)){
  name: guid(resourceGroup().id, groupObjectId,keyvaultadmin)
  scope: resourceGroup()
  properties: {
    roleDefinitionId: resourceId('Microsoft.Authorization/roleDefinitions', keyvaultadmin)//keyvaultadmin
    principalId: groupObjectId
    principalType: 'Group'
  }
}

resource groupBlobOwnerRoleAssignment 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' =if (!empty(groupObjectId)){
  name: guid(resourceGroup().id, groupObjectId,blobOwner)
  scope: resourceGroup()
  properties: {
    roleDefinitionId: resourceId('Microsoft.Authorization/roleDefinitions', blobOwner)//keyvaultadmin
    principalId: groupObjectId
    principalType: 'Group'
  }
}

// Outputs
