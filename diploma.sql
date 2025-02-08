create database town
use town
-- create table 

create table product01(p_name VARCHAR(100),
  p_color VARCHAR(100),
  p_size VARCHAR(100),
  p_price INT,
  p_id int NOT NULL UNIQUE,
  PRIMARY KEY(p_id))
 -- inssrt values
 insert into product01 values ('t-shirt', 'red', 'm', 500, 3000),
  ('shirt', 'red', 'L', 250, 3200),
  ('t-shirt', 'yellow', 'xl', 200, 3250),
  ('dress', 'green', 's', 850, 2394),
  ('hoodie', 'black', 'm', 360, 2150),
  ('jeans', 'grey', 'L', 350, 2400),
  ('shorts', 'white', 's', 400, 2800)
  select * from product01

  create table customerr1 (c_name VARCHAR(100),
  c_age INT,
  c_id INT NOT NULL UNIQUE,
  p_id INT NOT NULL UNIQUE,
  c_address VARCHAR(100),
  gender VARCHAR(100),
  PRIMARY KEY (c_id),
  FOREIGN KEY(p_id) REFERENCES product01(p_id))
  
  insert into customerr1 values('ahmed', 20, 100,3000, 'cairo', 'male'),
  ('kareem', 25, 101,3200, 'ain shams', 'male'),
  ('sobhi', 22, 102,3250, 'mansoura', 'male'),
  ('fatma', 21, 103,2394, 'banha', 'female'),
  ('noor', 27, 104,2150, 'aswan', 'female'),
  ('khaled', 29, 105,2400, 'cairo', 'male'),
  ('menna', 17, 106,2800, 'alex', 'male')

  select * from customerr1

  create table branch1 ( b_name VARCHAR(100),
  b_num INT,
  b_id INT NOT NULL UNIQUE,
  p_id INT NOT NULL UNIQUE,
  c_id INT NOT NULL UNIQUE,
  b_address VARCHAR(100),
  b_staff_num VARCHAR(100),
  PRIMARY KEY(b_id),
  FOREIGN KEY(p_id) REFERENCES product01(p_id),
  FOREIGN KEY(c_id) REFERENCES customerr1(c_id))
  
  insert into branch1 values('town team', 1, 1, 3000,100,'cairo', '10'),
  ('town team', 2, 2, 3250,102, 'tanta', '7'),
  ('town team', 3, 3, 3200,103, 'alex', '11'),
  ('town team', 4, 4, 2394,104, 'banha', '6'),
  ('town team', 5, 5, 2150,105, 'sohag', '5'),
  ('town team', 6, 6, 2400,106, 'mansoura', '8')

select * from product01
select * from customerr1
select * from branch1


--join = merge
--union = append

--joins( inner join , left join , right join , full outer )

select p_name , p_size from product01 inner join customerr1 
on product01.p_id = customerr1.p_id

select * from product01  left join  customerr1 
on product01.p_id = customerr1.p_id


select * from product01  right join  customerr1 
on product01.p_id = customerr1.p_id

select * from product01  full outer join  customerr1 
on product01.p_id = customerr1.p_id
full outer join branch1 on product01.p_id = branch1.p_id


-- union 
select*from product01com union all select*from product01com

select top 5 p_price from product01
-- agg functions
select SUM(p_price) as 'total_price' from product01
select count(p_name) as 'name count' from product01
select count(distinct gender) as 'gender count' from customerr1
select avg(p_price) as 'avg_price' from product01
select max(p_price) as 'max_price' from product01
select min(p_price) as 'min_price' from product01
select p_price*p_id as 'total_profit' from product01
--text functions 
select concat(p_name,' ' ,p_price) as 'full_name' from product01
select right(p_name,3) from product01
select lower(p_name) as 'lower' from product01
select upper(left(p_name,3)) as 'upper' from product01




--alter table to add column 
alter table product01 add margin int
--alter table to droup column
alter table product01 drop column margin
--alter table to convert data type
alter table product01
alter column p_price int


-- add new rows 
update product01
set margin = 5000
where p_id =1

update product01
set margin = p_price *0.50

--remove rows 
delete 
from product01
where p_id= 30334

--remove null values
delete
from product01
where p_id='NA' or p_size ='Na',.......)
      concat(p_id , p_size .....)is null

--  add case statment to table

update product01
set total22 =
case
   when p_price < 500 then 'good'
   else 'exp'
end

-- show case statment in table
select *,
case
   when p_price > 500 then 'good'
   else 'exp'
end as statue
from product01

 --clause select ترتيب العمليات 
 select * from product01
 select p_name ,p_size , p_price, sum(p_price) as total_price from product01
 where p_size='m' or p_size ='L'
 group by p_name,p_size,p_price
 having sum(p_price)>400
 order by sum(p_price)desc




 -- delete duplication
 --1
  select*from product01com union  select*from product01com

 --2
  with duplicates
   as(select p_name, p_color,p_size,p_price,p_id,rownumber=ROW_NUMBER()over(partition by p_id order by p_id)
   from product01com)
   delete from duplicates
   where rownumber >1




--Change data type

select Invoice_Date,   year(Invoice_Date)as yearr  from [adidas sales]

 
select Invoice_Date,month(Invoice_Date)as monthh from [adidas sales]


select Invoice_Date,datepart(D,Invoice_Date)as dayy from [adidas sales]




select Invoice_Date,datename(mm,Invoice_Date)as monthnamee from [adidas sales]



select Invoice_Date,datename(DW,Invoice_Date)as daynamee  from [adidas sales]