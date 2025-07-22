===========================================
current stock levels
===========================================

SELECT
    product_template.name AS product_name,
    SUM(stock_quant.quantity) AS quantity_on_hand
FROM
    stock_quant
JOIN product_product ON stock_quant.product_id = product_product.id
JOIN product_template ON product_product.product_tmpl_id = product_template.id
WHERE
    product_template.type = 'product'
GROUP BY
    product_template.name
ORDER BY
    product_template.name;

## Query Description:
This query shows current stock levels (quantity on hand) for all products.

##Purpose:
 Real-time inventory management to check current stock availability, identify stockouts, and monitor overall inventory levels across all products.