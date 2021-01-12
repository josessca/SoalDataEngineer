/** QUERY BY JOSEPHINE 
 * JAWABAN SOAL D
 * TARGERTED_TABLE
 */

use `kulinatest`;

############### TEMPORARY TABLE #######################
CREATE TABLE temp_sub as -- subtotal cashback
select  o3.user_id , ifnull( sum(c.cashback),0) sub_tot_cashback 
from  deliveries d3 left outer join cashbacks c on d3.delivery_id = c.delivery_id
join orders o3 on o3.order_id = d3.order_id  
group by d3.delivery_id ;
-- drop table temp_sub ;

CREATE TABLE temp_cashback as -- temporary cashback
select  user_id , sum(sub_tot_cashback) total_cashback from temp_sub
group by user_id;
-- drop table temp_cashback ;

CREATE TABLE lunch_name as -- jumlah masing-masing lunch type
select  o.user_id , ifnull(bas.total_basic_boxes,0) as total_basic_boxes,
		ifnull(del.total_deluxe_boxes,0) as total_deluxe_boxes,
		sum(o.box * o.days_of_subscription) as total_healthy_boxes
from orders o 
	left join (  select o2.user_id, sum(o2.box * o2.days_of_subscription) as total_deluxe_boxes  
			from orders o2 
			where o2.lunch_type ='Deluxe Lunch'
			 ) as del on del.user_id = o.user_id 
	left join (  select o2.user_id, sum(o2.box * o2.days_of_subscription) as total_basic_boxes  
			from orders o2 
			where o2.lunch_type ='Basic Lunch'
			 ) as bas on bas.user_id = o.user_id
where o.lunch_type ='Healthy Lunch'
group by o.user_id ;
-- drop table lunch_name ;


################## TARGETED_TABLE #########################
CREATE TABLE targeted_table AS
select 	o.user_id,
		count(o.order_id) total_orders,
		sum(o.box * o.days_of_subscription) total_boxes_ordered,
		l.total_deluxe_boxes,
		l.total_basic_boxes, 
		l.total_healthy_boxes,
	 	x.total_boxes_delivered,
	 	(sum(o.box * o.days_of_subscription) - x.total_boxes_delivered) boxes_remaining,
	  	t.total_cashback
from orders o
	join ( 
	 	select  d2.delivery_id, d2.box, o2.user_id, sum(d2.box) total_boxes_delivered 
		from deliveries d2 join orders o2 on o2.order_id = d2.order_id 
		group by o2.user_id ) as x on x.user_id = o.user_id 
	join temp_cashback t on t.user_id = o.user_id 
	join lunch_name l on l.user_id = o.user_id 
group by o.user_id ;

############# FINAL OUTPUT ###################
select * from targeted_table ;