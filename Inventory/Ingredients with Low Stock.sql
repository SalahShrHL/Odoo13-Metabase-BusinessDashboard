===========================================
Ingredients with Low Stock
===========================================

SELECT
    product_template.name AS ingredient_name,
    SUM(stock_quant.quantity) AS quantity_on_hand
FROM stock_quant
JOIN product_product ON stock_quant.product_id = product_product.id
JOIN product_template ON product_product.product_tmpl_id = product_template.id
WHERE product_template.type = 'product'
 -- AND product_template.categ_id = [YOUR_INGREDIENT_CATEGORY_ID]
GROUP BY product_template.name
HAVING SUM(stock_quant.quantity) < 20
ORDER BY quantity_on_hand ASC;


## Query Description:
This query identifies low-stock ingredients/products with quantities below 20 units, showing current on-hand quantities sorted from lowest to highest.