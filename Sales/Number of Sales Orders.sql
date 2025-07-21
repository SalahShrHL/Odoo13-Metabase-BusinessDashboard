===========================================
Number of Sales Orders
===========================================


SELECT
  COUNT(*) AS number_of_orders
FROM
  sale_order
WHERE
  sale_order.state IN ('sale', 'done')
  [[AND {{date}}]]


===========================================
Notes:
===========================================


## Query Description:
This query counts the total number of confirmed and completed sales orders.

##Filter Usage:
{{date}} - Filter by order date range