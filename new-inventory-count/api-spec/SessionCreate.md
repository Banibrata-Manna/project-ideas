## Session Creation (InventoryCountImport)

In a count(WorkEffort) user create a session (InventoryCountImport), with name, status

### API
- Endpoint: <Base Url>/counts/M10001/sessions
- Method: POST
- Type: Entity
- Entity: InventoryCountImport
- Operation: one
- Request
  ```
  {
    "importName": "Test Session",
    "statusId": "CREATED",
    "createdDate": 1755699540000,
    "assignedTo": "stephen.moz"
    "createdBy": "anthony.edwards"
  }
  ```