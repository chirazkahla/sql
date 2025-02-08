--right join
select * from products right join customer
on products.order_id = customer.order_id

--left join 
select * from products left join customer
on products.order_id = customer.order_id


-- inner join
select * from products inner join customer
on products.order_id = customer.order_id

-- full outer join
select * from products full outer join customer
on products.order_id = customer.order_id



-- full outer join with statments
select p_name,p_size,count(p_name)as 'P_Q',sum(p_cost) as 'total_sales' from products full outer join customer
on products.order_id = customer.order_id
group by p_name , p_size
having sum(p_cost)<20
order by sum(p_cost) desc
