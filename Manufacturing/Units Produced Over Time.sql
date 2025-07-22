===========================================
Units Produced Over Time
===========================================

WITH filtered_production AS (
    SELECT
        mrp_production.product_qty,
        mrp_production.date_finished
    FROM 
        mrp_production
    WHERE 
        mrp_production.state = 'done'
        AND DATE_TRUNC('year', mrp_production.date_finished) = DATE_TRUNC('year', CURRENT_DATE)
        [[AND {{date}}]]
)
SELECT
    DATE_TRUNC({{grouping}}, date_finished)::date AS production_period,
    SUM(product_qty) AS total_units_produced
FROM 
    filtered_production
GROUP BY 
    production_period
ORDER BY 
    production_period


===========================================
Notes:
===========================================


## Query Description:
This query shows production output trends over time by grouping completed production quantities into customizable time periods for the current year.

##Filter Usage:
{{date}} - Additional date filter on production finish date 
{{grouping}} - Set time grouping interval