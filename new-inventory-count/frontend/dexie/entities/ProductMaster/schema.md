# Product Master Indexed DB Schema
We will store Product details like productId, productName, parentProductName, internalName, mainImageUrl, active goodIdentifications in indexed db.

```
const productMasterDb = new Dexie("productMasterDb");

productMasterDb.version(1).stores({
    product: "&productId, productName, parentProductName, internalName, mainImageUrl",
    goodIdentification: "[productId+goodIdentificationTypeId], productId, goodIdentification, idValue"
});
```