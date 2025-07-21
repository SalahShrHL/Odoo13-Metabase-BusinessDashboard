===========================================
Average Order Value
===========================================
SELECT
    ROUND(AVG(sale_order.amount_total), 2) AS average_order_value
FROM
    sale_order
WHERE
    sale_order.state IN ('sale', 'done')
    [[AND {{date}}]]



===========================================
Notes:
===========================================


## Query Description:
This query calculates the average order value from confirmed and completed sales orders.

## Filter Usage:
{{date}} - Filter by order date range.