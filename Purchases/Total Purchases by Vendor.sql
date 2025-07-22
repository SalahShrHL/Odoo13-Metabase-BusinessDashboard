===========================================
Total Purchases by Vendor
===========================================

SELECT 
    rp.name AS vendor_name,
    SUM(purchase_order.amount_total) AS total_purchase
FROM 
    purchase_order 
JOIN 
    res_partner rp ON purchase_order.partner_id = rp.id
WHERE 
    {{date}}  -- Metabase Field Filter for po.date_order
    -- AND purchase_order.state = 'purchase'  -- Uncomment to filter by order state
GROUP BY 
    rp.name;


===========================================
Notes:
===========================================


## Query Description:
This query calculates total purchase amounts by vendor/supplier from purchase orders for a specified time period, regardless of order status.

##Filter Usage:
{{date}} - Filter by purchase order date range.