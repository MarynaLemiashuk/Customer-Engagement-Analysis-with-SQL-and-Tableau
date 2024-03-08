drop view if exists purchases_info;

CREATE VIEW purchases_info as
SELECT
purchase_id,
student_id,
purchase_type,
date_purchased as date_start,
case
 when purchase_type = 'Monthly'
 then date_add(date_purchased, interval 1 month)
 when purchase_type = 'Quarterly'
 then date_add(date_purchased, interval 3 month)
 when purchase_type = 'Annual'
 then date_add(date_purchased, interval 1 year)
end as date_end
from
365_student_purchases;
select
count(*) as row_count from purchases_info






