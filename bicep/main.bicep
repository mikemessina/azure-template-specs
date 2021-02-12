param location string = 'centralus'
param name string = 'mmessinaisstorage020421'

var storageSku = 'Standard_LRS'

resource stg 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: name
  location: location
  kind: 'StorageV2'
  sku: {
    name: storageSku
  }
}

output storageId string = stg.id