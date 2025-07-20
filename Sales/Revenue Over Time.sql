===========================================
Revenue Over Time
===========================================

WITH filtered_orders AS (
    SELECT
        sale_order_line.price_total,
        sale_order.date_order
    FROM 
        sale_order
    JOIN 
        sale_order_line ON sale_order.id = sale_order_line.order_id
    WHERE 
        sale_order.state IN ('sale', 'done')
        [[AND {{date}}]]
)

SELECT
    DATE_TRUNC({{period}}, date_order) AS grouped_period,
    SUM(price_total) AS revenue
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
This query calculates total revenue grouped by time periods (day, week, month, etc.) from completed sales orders.

##Filter Usage:

{{date}} - Filter by order date range (e.g., date_order >= '2024-01-01' AND date_order <= '2024-12-31')
{{period}} - Group results by time period (e.g., 'day', 'week', 'month', 'quarter', 'year')