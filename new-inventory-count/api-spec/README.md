## Common APIs Required

- ### Common APIs for Admin View
    - Count Detail API, that gets us status, name, dates, sessions, line items in sessions
    - Fetch API to get Counts by status
    - Search API to search counts by name

- ### On Drafts Page(Admin View)
    - API for Creating a single Count
    - PUT API to update Counts, like Update Due Date, Name, Assign Facility etc
    - Fetch API to get the details of an Count like Name, CreatedDate, Due Date etc
    - Fetch Created Status Counts in Pagination
    - Fetch Imports Items(In case of Directed Count View)
    - An API to move the status from a count to PLANNED status from CREATED status

- ### On Planned Page(Admin View)
    - Common API to get counts by status

- ### In Review Page(Admin View)
    - Common API to get counts by status

- ### Closed Page
    - Common API to get counts by status