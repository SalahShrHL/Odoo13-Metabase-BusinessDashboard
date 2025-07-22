===========================================
Planned vs Completed Production Orders
===========================================


WITH filtered_planned AS (
    SELECT
        mrp_production.date_planned_finished
    FROM 
        mrp_production
    WHERE 
        DATE_TRUNC('year', mrp_production.date_planned_finished) = DATE_TRUNC('year', CURRENT_DATE)
        [[AND {{date}}]]
),
filtered_completed AS (
    SELECT
        mrp_production.date_finished
    FROM 
        mrp_production
    WHERE 
        mrp_production.state = 'done'
        AND DATE_TRUNC('year', mrp_production.date_finished) = DATE_TRUNC('year', CURRENT_DATE)
        [[AND {{date}}]]
)
-- Planned Orders
SELECT
    DATE_TRUNC({{grouping}}, date_planned_finished)::date AS period,
    COUNT(*) AS planned_orders,
    0 AS completed_orders
FROM
    filtered_planned
GROUP BY
    period
UNION
-- Completed Orders
SELECT
    DATE_TRUNC({{grouping}}, date_finished)::date AS period,
    0 AS planned_orders,
    COUNT(*) AS completed_orders
FROM
    filtered_completed
GROUP BY
    period
ORDER BY
    period



## Query Description:
This query compares planned vs completed production orders over time by grouping both metrics into customizable time periods for the current year.


##Filter Usage:
{{date}} - Additional date filter for both planned and completion dates 
{{grouping}} - Set time grouping interval (e.g., 'day', 'week', 'month', 'quarter')
