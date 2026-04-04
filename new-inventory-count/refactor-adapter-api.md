# Adapter API Refactoring Matrix 

During this refactor, we completely removed the `src/adapter` directory and migrated all API wrapper functions to their respective contexts depending on their usage. Unused endpoints were entirely pruned from the application. 

Here is the final matrix mapping the old Adapter APIs to their new homes:

| Original Adapter API | New Location | Action Taken |
| :--- | :--- | :--- |
| `getUserPreference` | `userProfileStore.ts` | Migrated as a shared store action. |
| `setUserPreference` | `userProfileStore.ts` | Migrated as a shared store action. |
| `getAvailableTimeZones` | `userProfileStore.ts` | Inlined directly into `getDxpAvailableTimeZones()`. |
| `setUserTimeZone` | `userProfileStore.ts` | Inlined directly into `setDxpUserTimeZone()`. |
| `getSecurityGroupAndPermissions` | `useSecurity.ts` | Abstracted into a new composable for `StorePermissions.vue`. |
| `createSecurityGroupPermission` | `useSecurity.ts` | Abstracted into the new `useSecurity` composable. |
| `updateSecurityGroupPermission` | `useSecurity.ts` | Abstracted into the new `useSecurity` composable. |
| `fetchGoodIdentificationTypes` | `productStore.ts` | Moved into the store's action block as a helper method. |
| `getEComStores` | `productStore.ts` | Moved into the store's action block. |
| `getEComStoresByFacility` | `productStore.ts` | Moved into the store's action block. |
| `createProductIdentificationPref`| `productStore.ts` | Moved into the store's action block. |
| `getProductIdentificationPref` | `productStore.ts` | Renamed to `fetchProductIdentificationPref` inside the action block. |
| `setProductIdentificationPref` | `productStore.ts` | Renamed to `saveProductIdentificationPref` inside the action block. |
| `fetchFacilitiesByGroup` | `productStore.ts` | Moved into the store's action block. |
| `fetchFacilitiesByParty` | `productStore.ts` | Moved into the store's action block. |
| `fetchFacilities` | `productStore.ts` | Moved into the store's action block. |
| `fetchShopifyShopLocation` | `productStore.ts` | Moved into the store's action block. |
| `setUserLocale` | **Removed** | Pruned - Unused function explicitly dropped. |
| `omsGetAvailableTimeZones` | **Removed** | Pruned - Unused function explicitly dropped. |
| `getProfile` | **Removed** | Pruned - Unused function explicitly dropped. |

### Architectural Shifts
1. **Stores for Central State:** Any API fetch resulting in central application states (configurations, timezones, facility sets, stores) was completely subsumed by `userProfileStore` or `productStore`.
2. **Composables for Transient State:** Components executing specific operational tasks without retaining global states, like checking and assigning Security Group Permissions, were extracted cleanly into composables. 
3. **No Isolated Wrappers:** We successfully eliminated the bloated adapter file by bringing the network logic as close to the target action context as possible.

The `src/adapter` directory and `src/adapter/index.ts` file have now been thoroughly unmounted and deleted.
