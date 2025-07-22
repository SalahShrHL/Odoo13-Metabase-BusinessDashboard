===========================================
stock level changes
===========================================
WITH filtered_stock_moves AS (
    SELECT
        stock_move.date,
        stock_move.product_id,
        stock_move.product_uom_qty,
        stock_move.location_id,
        stock_move.location_dest_id
    FROM 
        stock_move
    WHERE 
        stock_move.state = 'done'
        [[AND {{date}}]]
        --AND product_template.categ_id = [YOUR_INGREDIENT_CATEGORY_ID]
)
SELECT
    DATE_TRUNC({{grouping}}, filtered_stock_moves.date)::date AS period,
    product_template.name AS product_name,
    SUM(
        CASE 
            WHEN dest_location.usage = 'internal' AND src_location.usage != 'internal' THEN filtered_stock_moves.product_uom_qty
            WHEN src_location.usage = 'internal' AND dest_location.usage != 'internal' THEN -filtered_stock_moves.product_uom_qty
            ELSE 0
        END
    ) AS stock_change
FROM filtered_stock_moves
JOIN product_product ON filtered_stock_moves.product_id = product_product.id
JOIN product_template ON product_product.product_tmpl_id = product_template.id
JOIN stock_location AS src_location ON filtered_stock_moves.location_id = src_location.id
JOIN stock_location AS dest_location ON filtered_stock_moves.location_dest_id = dest_location.id
GROUP BY period, product_template.name
ORDER BY product_template.name, period;


## Query Description:
This query tracks stock level changes (in/out movements) by product over customizable time periods, showing net inventory flow from completed stock moves.

##Filter Usage:
{{date}} - Filter by stock move date range 
{{grouping}} - Set time grouping interval (e.g., 'day', 'week', 'month', 'quarter')