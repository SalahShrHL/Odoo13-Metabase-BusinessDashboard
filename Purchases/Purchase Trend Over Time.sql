===========================================
Purchase Trend Over Time
===========================================

WITH filtered_orders AS (
    SELECT
        purchase_order.amount_total,
        purchase_order.date_order
    FROM 
        purchase_order
    WHERE 
        1=1
        [[AND {{date}}]]
)

SELECT
    DATE_TRUNC({{grouping}}, date_order) AS grouped_period,
    SUM(amount_total) AS total_purchase
FROM 
    filtered_orders
GROUP BY 
    grouped_period
ORDER BY 
    grouped_period;

===========================================
Notes:
===========================================


## Query Description:
This query shows purchase spending trends over time by grouping purchase order amounts into customizable time periods.

##Filter Usage:
{{date}} - Filter by purchase order date range
{{grouping}} - Set time grouping interval