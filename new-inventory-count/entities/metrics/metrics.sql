-- Maximum number of products to be counted in directd count.
SELECT ici.inventory_count_import_id,
       COUNT(DISTINCT icii.product_id) AS distinct_product_count
FROM inventory_count_import ici
         JOIN inventory_count_import_item icii
              ON icii.inventory_count_import_id = ici.inventory_count_import_id
WHERE ici.count_type_enum_id != 'HARD_COUNT' OR ici.count_type_enum_id is NULL
GROUP BY ici.inventory_count_import_id
ORDER BY distinct_product_count DESC LIMIT 1;

-- Maximum number of products to be counted in Hard count.

SELECT ici.inventory_count_import_id,
       COUNT(DISTINCT icii.product_id) AS distinct_product_count
FROM inventory_count_import ici
         JOIN inventory_count_import_item icii
              ON icii.inventory_count_import_id = ici.inventory_count_import_id
WHERE ici.count_type_enum_id = 'HARD_COUNT'
GROUP BY ici.inventory_count_import_id
ORDER BY distinct_product_count DESC LIMIT 1;

-- It has been observed on one of our client which uses inventory count creates hard count with average 1000 of products.