drop view if exists purchases_info;

CREATE VIEW purchases_info as
SELECT
purchase_id,
student_id,
purchase_type,
date_purchased as date_start,
case
 when purchase_type = 'Monthly'
 then date_add(makedate(year(date_purchased), day(date_purchased)), interval month(date_purchased) month)
 when purchase_type = 'Quarterly'
 then date_add(makedate(year(date_purchased),day(date_purchased)), interval month(date_purchased) +3 month)
 when purchase_type = 'Annual'
 then date_add(makedate(year(date_purchased),day(date_purchased)), interval month(date_purchased) + 11 month)
end as date_end
from
365_student_purchases;







