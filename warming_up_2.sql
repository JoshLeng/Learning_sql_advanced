-- I made this querie firts, it works, but it was not the best way. It was ambiguous and redundant. So, i tried again with feedback.
-- not optimized:
with significant_customers as (
select c.customer_id, sum(p.amount) as historical_payment
from customer c 
join payment p on (c.customer_id=p.customer_id)
group by p.customer_id
having sum(p.amount) > 120
-- -----------------------------
), unreturned_rental as (
select sc.customer_id, sc.historical_payment
from significant_customers sc where
exists(select 1 from rental r where
r.customer_id=sc.customer_id and
r.return_date is null)
-- --------------------------
), not_horror_rental as (
select ur.customer_id, ur.historical_payment 
from unreturned_rental ur 
where not exists(select 1 from rental r 
join inventory i
on (r.inventory_id = i.inventory_id) 
join film_category fc 
on fc.film_id=i.film_id 
join category c 
on fc.category_id=c.category_id
where r.customer_id=ur.customer_id
and c.name='Horror'
-- -------------------------
), n_unreturned_rentals as(
select c.customer_id, count(*) as no_unreturned
from customer c join rental r
on c.customer_id=r.customer_id 
where r.return_date is null
group by c.customer_id 
)
select nh.customer_id,concat(c.first_name,' ',c.last_name),
c.email, round(nh.historical_payment,2), nur.no_unreturned
from not_horror_rental nh
join customer c on nh.customer_id=c.customer_id
join n_unreturned_rentals nur on (c.customer_id=nur.customer_id);
-- --------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------
-- Better:
with significant_customers as (
-- customers with >120 of historical payment
select 
	p.customer_id, 
	sum(p.amount) as historical_payment 
from payment p
group by p.customer_id
having sum(p.amount) > 120
-- -----------------------------
),
-- ----none horror rental
not_horror_rental as (
select 
	sc.customer_id,
	sc.historical_payment 
from significant_customers sc
where 
not exists(select 1 from rental r 
	join inventory i
	on (r.inventory_id = i.inventory_id) 
	join film_category fc 
	on fc.film_id=i.film_id 
	join category c 
	on fc.category_id=c.category_id
	where r.customer_id=sc.customer_id
	and c.name='Horror')
-- -------------------------
), n_unreturned_rentals as(
select 
	r.customer_id, 
	count(*) as no_unreturned
from rental r 
where r.return_date is null
group by r.customer_id 
)
-- ------------------------------
select 
	nhr.customer_id,
	concat(c.first_name,' ',c.last_name) as full_name,
	c.email, 
	round(nhr.historical_payment,2) as historical_payment ,
	nur.no_unreturned 
from not_horror_rental nhr
join customer c on nhr.customer_id=c.customer_id
join n_unreturned_rentals nur on (c.customer_id=nur.customer_id)
order by historical_payment desc;
