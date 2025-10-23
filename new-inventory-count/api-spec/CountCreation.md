### Directed Count
- Endpoint: <base Url>/counts
- Method: POST
- Type: Entity
- Entity: WorkEffort
- Operation: one
- Request:
    ```
    {
        “workEffortName”: “Hard Count Name”,
        “statusId”: “PLANNED”,
        “workEffortPurposeTypeId”: “SELECTIVE_COUNT”,
        “facilityId”: “BROOKLYN”,
        “createdDate”: 1755699540000,
        “createdByUserId”: “anthony.edward”
    }
    ```
- Response:
    ```
    {
        "workEffortId": "M10001"
    }  
    ```
-  Service Behind:
   - Entity: WorkEffort
   - verb: create
   - noun: WorkEffort
   - fullName: create#WorkEffort

### Hard Count
- Endpoint: <base Url>/counts/bulk
- Method: POST
- Type: Service
- Request:
    ```
    workEfforts: [
        {
            “workEffortName”: “Hard Count Name”,
            “statusId”: “PLANNED”,
            “workEffortPurposeTypeId”: “HARD_COUNT”,
            “facilityId”: “BROOKLYN”,
            “createdDate”: 1755699540000,
            “createdByUserId”: “anthony.edward”
        }
    ] 
    ```
- Service Behind:
  - Type: Service
  - Verb: create
  - noun: WorkEffort
  - fullName: create#WorkEfforts
  - Description: This will call ``create#WorkEffort`` entity auto service for every work effort in the list we send as request.
-  Response:
    ```
    {
        message: "Counts created Successfully"
    }
    ```