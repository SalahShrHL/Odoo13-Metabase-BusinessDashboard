===========================================
Sales by City
===========================================
SELECT
    res_partner.city AS wilaya,
    SUM(sale_order.amount_total) AS total_sales
FROM
    sale_order
JOIN
    res_partner ON sale_order.partner_id = res_partner.id
WHERE
    sale_order.state IN ('sale', 'done')
    [[AND {{date}}]]
GROUP BY
    res_partner.city
ORDER BY
    total_sales DESC;


===========================================
Notes:
===========================================


## Query Description:
This query calculates total sales revenue by wilaya (city/region) from confirmed and completed orders, ranked from highest to lowest sales.

##Filter Usage:
{{date}} - Filter by order date range