# Server Sync Worker
This **Service Worker** will be responsible for syncing the import line items from the indexed db to the server' database.

- Get all the Import line Items from dexie which are updated after the last server sync, i.e., the ones with the ``lastUpdatedAt`` greater than the last server sync time.
- Call an [Upsert API](../../../api-spec/serversync/InventoryCountImportItem/ServerSyncApi.md)
- We will pass import line items to be synced in formats [V1](../../../api-spec/serversync/InventoryCountImportItem/request.json) or [V2](../../../api-spec/serversync/InventoryCountImportItem/requestV2.json)
- And in [response](../../../api-spec/serversync/InventoryCountImportItem/response.json)
  - If List is not empty
    - We'll update the ``importItemSeqId`` in import line item objects in the indexed db by the ``productId`` or the ``productIdentifierId``

## TODO
- Have to learn Service Workers and [Workbox](https://www.npmjs.com/package/workbox-background-sync)