===========================================
Total Number of Purchase Orders
===========================================

SELECT 
    COUNT(*) AS purchase_orders
FROM 
    purchase_order
WHERE 
    -- state IN ('purchase', 'done') -- optional
    [[ {{date}}]]  -- Metabase date filter on purchase_order.date_order
;

===========================================
Notes:
===========================================


## Query Description:
This query counts the total number of purchase orders for a specified time period, regardless of order status.

##Filter Usage:
{{date}} - Filter by purchase order date range 