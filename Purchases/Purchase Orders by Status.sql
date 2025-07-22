===========================================
Purchase Orders by Status
===========================================

SELECT 
    purchase_order.state,
    COUNT(*) AS order_count
FROM 
    purchase_order
WHERE 
    {{date}}  -- Metabase Field Filter for purchase_order.date_order
GROUP BY 
    purchase_order.state
ORDER BY 
    order_count DESC;

===========================================
Notes:
===========================================


## Query Description:

This query counts purchase orders by their current status/state (draft, confirmed, done, etc.) for a specified time period.

##Filter Usage:
{{date}} - Filter by purchase order date range 