# Purchase Order API Calls Reference

This document outlines the API calls made by the Vue components related to Purchase Orders in the `receiving` application.

## Main Pages

### 1. `PurchaseOrders.vue`
**Triggers:** Page Load, Searching, Segment Changes (Open/Completed), Pagination (Load More)

| API Endpoint | Method | Service Method | Vuex Action | Description |
|---|---|---|---|---|
| `/solr-query` | POST | `OrderService.fetchPurchaseOrders` | `order/findPurchaseOrders` | Fetches a list of Purchase Orders grouped by `orderId`, filtered by facility and status. |

### 2. `PurchaseOrderDetail.vue`
**Triggers:** Page Load (`ionViewWillEnter`), Receiving Operations

#### Page Load & Initialization
| API Endpoint | Method | Service Method | Vuex Action | Description |
|---|---|---|---|---|
| `/solr-query` | POST | `OrderService.fetchPODetail` | `order/getOrderDetail` | Fetches specific details and line items for the loaded Purchase Order. |
| `/searchProducts` | POST | `searchProducts` (Adapter) | `product/fetchProductInformation` | Fetches product metadata (like images) for items in the PO. |
| `/performFind` | POST | `UserService.getFacilityLocations` | `user/getFacilityLocations` | Fetches locations associated with the current facility. |
| `/performFind` | POST | `OrderService.fetchPOHistory` | `order/getPOHistory` | Fetches historical receiving logs (`ShipmentReceiptAndItem`) for the PO. |
| `/performFind` | POST | `PartyService.getReceiversDetails`| `party/getReceiversDetails` | Fetches full names of users who previously received items on this PO. |

#### Receive Items (`savePODetails` -> `createShipment`)
| API Endpoint | Method | Service Method | Vuex Action | Description |
|---|---|---|---|---|
| `/service/createIncomingShipment` | POST | `OrderService.createIncomingShipment`| `order/createAndReceiveIncomingShipment` | Creates a new `PURCHASE_SHIPMENT` record for the items being received. |
| `/performFind` | POST | `UserService.getFacilityLocations` | `user/getFacilityLocations` | Re-verifies valid facility locations for receiving. |
| `/uploadAndImportFile` | POST | `UploadService.uploadJsonFile` | `shipment/receiveShipmentJson` | Bulk uploads a JSON payload of items and quantities to receive. |
| `/performFind` | POST | `UploadService.fetchDataManagerLog`| `shipment/receiveShipmentJson` | Polls the `DataManagerLog` entity to ensure the JSON upload job finished successfully. |
| `/receiveShipment` | POST | `ShipmentService.receiveShipment` | `shipment/receiveShipmentJson` | Marks the newly created shipment status as `PURCH_SHIP_RECEIVED`. |

---

## Modals & Sub-Components

### 3. `PurchaseOrderItem.vue`
**Triggers:** Clicking on an item row in the `PurchaseOrders.vue` list

| API Endpoint | Method | Service Method | Vuex Action | Description |
|---|---|---|---|---|
| `/solr-query` | POST | `OrderService.fetchPODetail` | `order/getOrderDetail` | Pre-fetches the details of the selected PO before navigating to the detail page. |
| `/searchProducts` | POST | `searchProducts` (Adapter) | `product/fetchProductInformation` | Pre-fetches product details for the items on the selected PO. |

### 4. `ClosePurchaseOrderModal.vue`
**Triggers:** Clicking "Proceed" after selecting items to close

#### If unreceived items are accepted (Shipment Creation)
| API Endpoint | Method | Service Method | Vuex Action | Description |
|---|---|---|---|---|
| `/service/createPurchaseShipment` | POST | `OrderService.createPurchaseShipment`| `order/createPurchaseShipment` | Creates a shipment header for items being closed out that have a received quantity. |
| `/addShipmentItem` | POST | `ShipmentService.addShipmentItem` | `shipment/addShipmentItem` | Adds items to the newly created shipment. |
| `/receiveShipmentItem` | POST | `ShipmentService.receiveShipmentItem` | `shipment/receiveShipment` | Receives each line item individually into inventory. |
| `/receiveShipment` | POST | `ShipmentService.receiveShipment` | `shipment/receiveShipment` | Marks the shipment as completed. |

#### Updating PO Item Statuses (Batched by 10)
| API Endpoint | Method | Service Method | Vuex Action | Description |
|---|---|---|---|---|
| `service/changeOrderItemStatus`| POST | `OrderService.updatePOItemStatus` | N/A (Direct call) | Iterates through selected items and marks their status as `ITEM_COMPLETED`. |

### 5. `AddProductToPOModal.vue`
**Triggers:** Searching for a SKU or scrolling to load more

| API Endpoint | Method | Service Method | Vuex Action | Description |
|---|---|---|---|---|
| `/searchProducts` | POST | `searchProducts` (Adapter) | `product/findProduct` | Fetches products matching the entered SKU or product name. |

---

## Components with No Direct API Calls

The following components rely on Vuex state that is populated by their parent views and do not make independent API calls:

- **`ReceivingHistoryModal.vue`**: Reads `poHistory` from the Vuex store.
- **`LocationPopover.vue`**: Reads facility locations from the Vuex store and updates local item state.
- **`Scanner.vue`**: Uses `vue-barcode-reader` to decode camera input locally.
- **`ImageModal.vue`**: Simply renders an image from a provided URL prop.
