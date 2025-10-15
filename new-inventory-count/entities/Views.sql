-- Show count of each product per facility in inventory country_address_format 

select product_id, facility_id, sum(quantity) from work_effort we
join inventory_count_import ici on ici.WORK_EFFORT_ID = we.WORK_EFFORT_ID
join inventory_count_import_item icii on icii.INVENTORY_COUNT_IMPORT_ID = ici.INVENTORY_COUNT_IMPORT_ID
where ici.STATUS_ID = 'APPROVED'
group by icii.product_id, we.FACILITY_ID order by we.CREATED_DATE desc, ici.CREATED_DATE desc;

-- This query can be done by entity find and a view as well.

-- Show Import Sessions in an In Progress COUNT, Name of View: WorkEffortAndImports
select 
  we.work_effort_name, 
  we.work_effort_purpose_type_id, 
  we.facility_id, 
  ici.inventory_count_import_id,
  ici.assignedTo
from work_effort we
join inventory_count_import ici on ici.work_effort_id = we.work_effort_id;

-- This query can be done by entity find.

-- Show Import Items in each session(Import) of counts

select
    we.work_effort_id,
    icii.product_id,
    icii.product_identifier,
    icii.quantity
from 
    work_effort we
    join inventory_count_import ici on ici.work_effort_id = we.work_effort_id
    join inventory_count_import_item icii on icii.inventory_count_import_id = ici.inventory_count_import_id;   
