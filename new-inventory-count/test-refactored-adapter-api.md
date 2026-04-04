# Test Plan: Refactored Adapter APIs

Use this checklist to manually verify that the refactored API calls are functioning correctly without any network errors.

### 1. Initial Login & Facility Context
- [ ] **Action:** Log out and log back in, or completely refresh the application.
  - [ ] **Verify:** The application successfully fetches the facilities associated with your user group.
  - [ ] **Verify:** Your previously selected working facility loads correctly on startup.
  - [ ] **Verify:** Switching your current facility successfully updates and remembers your new choice on a refresh.

### 2. Timezone Settings
- [ ] **Action:** Navigate to your User Profile / Settings page.
  - [ ] **Verify:** The timezone dropdown/switcher securely fetches and populates the list of available time zones.
  - [ ] **Verify:** Selecting a different timezone safely registers and updates your profile successfully.

### 3. Store (Brand) Preferences
- [ ] **Action:** Navigate to any configuration area tied to an E-Commerce Store or Brand.
  - [ ] **Verify:** The list of stores maps correctly to your current facility.
  - [ ] **Verify:** Your default or preferred Store/Brand successfully loads automatically.
  - [ ] **Verify:** Changing your E-Commerce Store preference properly persists and correctly reloads after a refresh.

### 4. Product Identifier Configurations
- [ ] **Action:** Navigate to the Product Store Settings or the area for Barcode / Product Identification preferences.
  - [ ] **Verify:** The identifier dropdown correctly populates with options like SKU, Internal Name, Product ID, etc.
  - [ ] **Verify:** Your current store's existing identification preferences successfully load and display.
  - [ ] **Verify:** Modify the primary or secondary identifier and save. Ensure the operation completes without errors.

### 5. Advanced Permissions Management
- [ ] **Action:** Navigate to the `StorePermissions.vue` route/page.
  - [ ] **Verify:** Ensure the active Security Group's permissions render accurately in the list view.
  - [ ] **Verify:** Try adding a completely new permission rule. Verify it appears.
  - [ ] **Verify:** Try editing or toggling an existing permission's active state or date boundaries to verify the update functionality.
