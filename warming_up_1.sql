-- This is my first querie after several weeks, just warming up.
-- Using CTE's to create a short pipeline, it's pretty basic, but is the first step.



with global_avg as(
select avg(p.amount) as avg_global from payment p 
), -- ------------------
category_avg as (
select 
fc.category_id, 
c.name,
count(p.payment_id) as no_transactions
,sum(p.amount) as total_transactions, 
avg(p.amount) as avg_category 
from payment p join rental r
on r.rental_id=p.rental_id join inventory i
on r.inventory_id=i.inventory_id join film_category fc 
on i.film_id=fc.film_id join category c on fc.category_id=c.category_id 
group by fc.category_id, c.name
having sum(p.amount)>4000
)-- ---------------------------
select 
ca.name as categoria, 
ca.no_transactions as total_transacciones, 
ca.total_transactions as ingresos_totales,
round(ca.avg_category,2) as ticket_promedio,
case when ca.total_transactions>5000 then 'Alta'
else 'media-alta' end as nivel_rentabilidad
from category_avg ca cross join global_avg ga
where ca.avg_category>ga.avg_global
order by ingresos_totales desc
; 
