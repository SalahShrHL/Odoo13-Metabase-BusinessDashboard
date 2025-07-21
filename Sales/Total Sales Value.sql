===========================================
Total Sales Value
===========================================

SELECT
  SUM(sale_order.amount_total) AS total_sales
FROM
  sale_order
WHERE
  sale_order.state IN ('sale', 'done')
  [[AND {{date}}]]



===========================================
Notes:
===========================================

## Query Description:
This query calculates the total sales amount from all confirmed and completed sales orders.

##Filter Usage:
{{date}} - Filter by order date range
