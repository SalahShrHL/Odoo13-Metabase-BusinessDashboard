===========================================
Top 10 Customers by Revenue
===========================================

SELECT
    res_partner.name AS customer_name,
    SUM(sale_order.amount_total) AS total_revenue,
    ROUND(
        100.0 * SUM(sale_order.amount_total) / SUM(SUM(sale_order.amount_total)) OVER (),
        2
    ) AS revenue_percentage
FROM
    sale_order
JOIN
    res_partner ON sale_order.partner_id = res_partner.id
WHERE
    sale_order.state IN ('sale', 'done')
    [[AND {{date}}]]
GROUP BY
    res_partner.name
ORDER BY
    total_revenue DESC
LIMIT 10;


===========================================
Notes:
===========================================


## Query Description:
his query identifies the top 10 customers by total revenue with their percentage contribution to overall sales from confirmed and completed orders.
##Filter Usage:
{{date}} - Filter by order date range