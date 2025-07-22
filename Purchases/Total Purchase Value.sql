===========================================
Total Purchase Value
===========================================

SELECT 
    COALESCE(SUM(amount_total), 0) AS total_purchases_this_month
FROM 
    purchase_order
WHERE 
    {{date}}  -- Metabase Field Filter linked to purchase_order.date_order
    -- AND state = 'purchase'  -- Uncomment to filter by specific state
;


===========================================
Notes:
===========================================


## Query Description:
This query calculates the total purchase amount for a specified time period, returning 0 if no purchases exist, regardless of order status.

##Filter Usage:
{{date}} - Filter by purchase order date range 