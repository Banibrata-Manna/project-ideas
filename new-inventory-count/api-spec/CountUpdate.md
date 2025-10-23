# Update Counts
- Update the status of a count from ``WORK_EFF_CREATED`` to ``WORK_EFF_PLANNED`` or ``WORK_EFF_ASSIGNED``
- Update the due date, name of a count.
- Update Facility
  - ### API
    - Endpoint: <base url>/counts/M10001
    - Method: PUT
    - Type: Entity
    - Entity: WorkEffort
    - Operation: update
    - Request:
    ```
    {
        "<parameterNameInDb>": "<value>"
    }
    ```
  - Add Products
    - 
- ### Update a Session in a Count
- Update session's status
- Update session's name
    - API
      - Endpoint: <base url>/counts/M10001/sessions/M10001
      - Method: PUT
      - Type: Entity
      - Entity: InventoryCountImport
      - Operation: update
      - Request:
      ```
      {
          "<parameterNameInDb>": "<value>"
      }
      ```