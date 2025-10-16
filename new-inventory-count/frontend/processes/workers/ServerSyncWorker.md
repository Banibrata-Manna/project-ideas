# Server Sync Worker
This **Service Worker** will be responsible for syncing the import line items from the indexed db to the server' database.

- Get all the Import line Items from dexie which are updated after the last server sync, i.e., the ones with the ``lastUpdatedAt`` greater than the last server sync time.
- Call an Upsert API