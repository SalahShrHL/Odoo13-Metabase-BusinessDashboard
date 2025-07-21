
===========================================
Revenue Trend Over Time
===========================================

SELECT
    DATE_TRUNC({{time_granularity}}, sale_order.date_order) AS period,
    SUM(sale_order_line.price_total) AS revenue
FROM sale_order
JOIN sale_order_line ON sale_order.id = sale_order_line.order_id
WHERE sale_order.state IN ('sale', 'done')
  [[AND {{date}}]]
GROUP BY period
ORDER BY period;



===========================================
Notes:
===========================================


## Query Description:
This query shows revenue trends over time by grouping sales data into customizable time periods from confirmed and completed orders.

##Filter Usage:
{{time_granularity}} - Set time grouping interval
{{date}} - Filter by order date range
