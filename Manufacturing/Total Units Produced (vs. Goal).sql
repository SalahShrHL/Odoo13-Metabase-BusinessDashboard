===========================================
Total Units Produced (vs. Goal)
===========================================

SELECT
  COALESCE(SUM(mrp_production.product_qty), 0) AS total_production
FROM
  mrp_production
WHERE
  mrp_production.state = 'done'
  [[AND {{date}}]]


===========================================
Notes:
===========================================


## Query Description:
This query calculates the total quantity of units produced from all completed manufacturing orders, returning 0 if no production exists.

##Filter Usage:
{{date}} - Filter by production date range