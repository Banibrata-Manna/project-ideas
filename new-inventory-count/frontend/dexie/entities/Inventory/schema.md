```
const db = new Dexie("InventoryDB");

db.version(1).stores({
    scanEvent: "++scanId, scannedValue, quantity, createdAt, statusId, productId",
    inventoryCountImport: "++importId, createdBy, assignedTo, facilityId, facilityAreaId, deviceId, workEffortId, statusId",
    inventoryCountImportItem: "++sequenceId, importId, importItemSeqId, locationSeqId, productId, productIdentifierId, quantity, lastUpdatedAt"
});
```