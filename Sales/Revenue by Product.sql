===========================================
Revenue by Product
===========================================
SELECT 
    product_template.name AS product_name,
    SUM(sale_order_line.price_total) AS revenue
FROM sale_order
JOIN sale_order_line ON sale_order.id = sale_order_line.order_id
JOIN product_product ON sale_order_line.product_id = product_product.id
JOIN product_template ON product_product.product_tmpl_id = product_template.id
WHERE sale_order.state IN ('sale', 'done')
  [[AND {{date}}]]
  [[AND {{product}}]]
GROUP BY product_template.name
ORDER BY revenue DESC;


===========================================
Notes:
===========================================


## Query Description:

##Filter Usage:
{{date}} - Filter by order date range
{{product}} - Filter by specific product