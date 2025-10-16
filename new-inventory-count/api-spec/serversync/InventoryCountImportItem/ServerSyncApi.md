## Sync Import Items from Indexed DB to Server Request Response
### Request
An API that can accept a list of import items json objects having ``importId*``, ``importItemSeqId``, ``productId``, ``productIdentifierId``, ``quantity*`` and ``locationSeqId``.

### API
- Parameters of service behind the API
  - importId*
  - List of import items
    - importItemSeqId
    - productId (Mandatory if no importItemSeqId provided)
    - productIdentifier (Mandatory if no importItemSeqId & productId provided)
    - quantity
- Service workflow overview
  - If ``importItemSeqId`` is present, then find ``inventoryCountImportItem`` record and update the quantity
  - If the ``importItemSeqId`` is not present, then ``createUpdate`` ``inventoryCountImportItem`` record by ``productId`` or ``productIdentifier`` in ``productIdentifierId`` 

### Response
- Parameters in response
  - After importItem sync in database a list will be returned
    - For every new ``inventoryCountImportItem`` created following will be returned in response
      - inventoryCountImportSeqId
      - productId or productIdentifier(whichever came in request)
    - If nothing created an empty list will be returned.