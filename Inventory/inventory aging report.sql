===========================================
inventory aging report
===========================================

SELECT
    product_template.name AS ingredient_name,
    MIN(stock_move.date)::date AS first_entry_date,
    DATE_PART('day', NOW() - MIN(stock_move.date)) AS days_in_stock,
    SUM(stock_quant.quantity) AS current_quantity
FROM stock_move
JOIN product_product ON stock_move.product_id = product_product.id
JOIN product_template ON product_product.product_tmpl_id = product_template.id
JOIN stock_location ON stock_move.location_dest_id = stock_location.id
JOIN stock_quant ON stock_quant.product_id = product_product.id
WHERE stock_move.state = 'done'
  AND stock_location.usage = 'internal'
  AND product_template.type = 'product'
 -- AND product_template.categ_id = [YOUR_INGREDIENT_CATEGORY_ID]
GROUP BY product_template.name
ORDER BY days_in_stock DESC;


## Query Description:
This query shows inventory aging by calculating how long each ingredient/product has been in stock, displaying first entry date, days in stock, and current quantity.

