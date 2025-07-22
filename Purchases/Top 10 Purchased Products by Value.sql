===========================================
Top 10 Purchased Products by Value
===========================================


SELECT 
    product_template.name,
    SUM(purchase_order_line.price_total)
FROM 
    purchase_order
JOIN 
    purchase_order_line ON purchase_order.id = purchase_order_line.order_id
JOIN 
    product_product ON purchase_order_line.product_id = product_product.id
JOIN 
    product_template ON product_product.product_tmpl_id = product_template.id
WHERE 
     --purchase_order.state = 'purchase'  [[AND {{date}}]]
    [[ {{date}}]]  -- Metabase date filter on purchase_order.date_order
GROUP BY 
    product_template.name
ORDER BY 
    SUM(purchase_order_line.price_total) DESC
LIMIT 10;


===========================================
Notes:
===========================================


## Query Description:
This query shows the top 10 products by total purchase cost/spending from purchase orders, identifying which items require the highest procurement investment.

##Filter Usage:
{{date}} - Filter by purchase order date range 