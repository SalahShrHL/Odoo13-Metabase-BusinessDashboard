===========================================
Units Produced by Product
===========================================


SELECT
  product_template.name AS product_name,
  SUM(mrp_production.product_qty) AS total_units_produced
FROM
  mrp_production
JOIN
  product_product ON product_product.id = mrp_production.product_id
JOIN
  product_template ON product_template.id = product_product.product_tmpl_id
WHERE
  mrp_production.state = 'done'
  [[AND {{date}}]]
GROUP BY
  product_template.name
ORDER BY
  total_units_produced DESC

===========================================
Notes:
===========================================


## Query Description:
This query shows total production quantities by product from completed manufacturing orders.

##Filter Usage:
{{date}} - Filter by production date range.