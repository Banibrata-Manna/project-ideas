# Inventory Count API Spec

TOC

Entity CRUD
1. Create
    - WorkEffort
    - InventoryCountImport
    - InventoryCountImportItem
2. Update
   - WorkEffort
   - InventoryCountImport
   - InventoryCountImportItem

Application
1. Create
    1. CycleCount
        - List of facility
        - List of products
    2. CycleCountSession
        - Clone session Id
2. Update
    1. CycleCount
    2. CycleCountSession
        - Merge cycle count items
            - Items
            - Host item
    3. FacilityProdInvDcsnRsn
      - Accept
      - Reject
3. Find
   - 

## 1. Create

### 1. Cycle Count

- Endpoint: <base Url>/counts
- Method: POST
- Type: Service

- Request:
    ```
    {
        "countName": "Test Count"
        "countType": "DIRECTED_COUNT",
        "productIds": [
            "M10001", "M10002", "M10003", "M10004"  
        ],
        "facilityIds": [
            "BROOKLYN", "MALIBU", "STATEN_ISLAND"
        ],
        "duaDate": 1761297180000,
        "status": "CREATED",
    }

    {
        "countName": "Test Count"
        "countType": "DIRECTED_COUNT",
        "productIds": [
            "M10001", "M10002", "M10003", "M10004"  
        ],
        "facilityGroupId": "ONLINE_FAC_GRP",
        "duaDate": 1761297180000,
        "status": "CREATED",
    }
    ```

- Response:
This will run async so will return acknowledgement but not status.
Maybe return job id?
    ```
    {
        "message": "<Success or error message>"
    }  
    ```

### 2. Cycle Count Session

- Endpoint: <Base Url>/counts/M10001/sessions
- Method: POST
- Request

   ```
        "sessionToCloneId": "M10001",
        "productIds": [
            "M10001", "M10002", "M10003", "M10004"  
        ],
        "assignedTo": "stephen.moz"
   ```

  ```
  {
    "importId": "M10002",
    "importName": "Test Session",
    "statusId": "CREATED",
    "createdDate": 1755699540000,
    "assignedTo": "stephen.moz"
    "createdBy": "anthony.edwards"
  }
  ```

## 2. Update

### 1. CycleCount

### 2. CycleCountSession

**Merge cycle count items**
- Endpoint: <base Url>/counts/M10001/sessions/M10001
- Request
  ```
    {
        "toImportItemSeqId": "M100012",
        "fromItemSeqIds": [
            "M10004", "M10005", "M10005", "M10007"
        ]
    }
  ```
- Response
  ```
    {
        "importItemSeqId": "M100012",
        "quantity": "50"
    }
  ```

### Session

- Status
- Name
- Area
- Request
  - Endpoint: <base url>/counts/M10001/sessions/M10001
  - Method: PUT
  - Type: Entity
  - Entity: InventoryCountImport
- Operation: update
    ```
    {
        "<parameterNameInDb>": "<value>"
    }
    ```
