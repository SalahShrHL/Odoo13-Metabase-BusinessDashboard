===========================================
Delays in All Completed Production Orders
===========================================


SELECT
  mrp_production.name AS production_order,
  product_template.name AS product_name,
  ROUND(
    (EXTRACT(EPOCH FROM (mrp_production.date_finished - mrp_production.date_planned_finished)) / 3600)::numeric,
    2
  ) AS delay_hours,
  mrp_production.date_planned_finished,
  mrp_production.date_finished
FROM
  mrp_production
JOIN
  product_product ON product_product.id = mrp_production.product_id
JOIN
  product_template ON product_template.id = product_product.product_tmpl_id
WHERE
  mrp_production.state = 'done'
  [[AND {{date}}]]
ORDER BY
  delay_hours DESC

## Query Description:
This query shows individual production orders with their delay details, including product name, planned vs actual finish dates, and delay in hours, ranked by highest delays first.

##Filter Usage:
{{date}} - Filter by production date range 
