# Aggregator Worker

- Get the list of ``unAppliedEvents`` logs from ``ScanEvent`` entity in Dexie.

Now we have a ``unAppliedEvents`` list.

- Loop into ``unAppliedEvents``
  - For each event, check if a valid productId exists from the productMaster
    - Query the scanned value against primary product barcode identifier or product's internal name and get the HC Product ID.
    - If the productId was found then ``Update`` the scan event with the product ID record in ``ScanEvent``
    - Update the record in unAppliedEvent with the matched product id
  - After productMaster check is complete, commit scan event to InventoryCountImportItem
    - If a productId exists in the unAppliedEvents master, then run createUpdate InventoryCountImportItem by productId
    - If no productId is found then run createUpdate using the ``scannedValue`` as the ``productIdentifier``.
  - After a scan event is successfully commited to ``InventoryCountImportItem``
    - Update the scan event ``isAggregated`` as 1
