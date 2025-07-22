===========================================
Average Production Delay (in Hours)
===========================================


SELECT
  ROUND(
    AVG(
      EXTRACT(EPOCH FROM (mrp_production.date_finished - mrp_production.date_planned_finished)) / 3600
    )::numeric,
    2
  ) AS average_delay_hours
FROM
  mrp_production
WHERE
  mrp_production.state = 'done'
  [[AND {{date}}]]

===========================================
Notes:
===========================================


## Query Description:
This query calculates the average delay in hours between planned and actual production completion times for finished manufacturing orders.

##Filter Usage:
{{date}} - Filter by production date range