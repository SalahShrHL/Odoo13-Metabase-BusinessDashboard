===========================================
Revenue by Product Category
===========================================
SELECT 
    product_category.name,
    SUM(sale_order_line.price_total)
FROM sale_order
JOIN sale_order_line ON sale_order.id = sale_order_line.order_id
JOIN product_product ON sale_order_line.product_id = product_product.id
JOIN product_template ON product_product.product_tmpl_id = product_template.id
JOIN product_category ON product_template.categ_id = product_category.id
WHERE sale_order.state IN ('sale', 'done')
  [[AND {{date}}]]
  [[AND {{category}}]]
GROUP BY product_category.name
ORDER BY SUM(sale_order_line.price_total) DESC;


===========================================
Notes:
===========================================


## Query Description:
{{date}} - Filter by order date range

##Filter Usage:
{{category}} - Filter by specific product category