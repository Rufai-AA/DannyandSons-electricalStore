create database DannyandSons;
-- import your datasets
use DannyandSons;

-- the columns need to be renamed appropriately for easier typing

alter table `electronics_store - tv_final` rename electronics_store;
alter table electronics_store rename column `original price`to originalPrice;
alter table electronics_store rename column `selling price`to sellingPrice;
alter table electronics_store rename column `operating system`to operatingSystem;

select * from electronics_store;

-- task 1 
select brand 'TV Brands' from electronics_store;

-- task 2
 select brand,
count(sellingPrice) as 'No of sale',
concat('$', format(sum(sellingPrice), 2)) as 'total price',
concat('$', format(avg(sellingPrice), 2)) as 'average price'
from electronics_store
group by brand order by brand;

-- task 2a
select brand, count(*) as 'No of sale'
from electronics_store group by brand
order by count(*) desc limit 1;

-- task 2b
select brand, count(sellingPrice) as 'No of sale',
concat('$', format(sum(sellingPrice), 2)) as 'Total Price'
from electronics_store
group by brand order by sum(sellingPrice) desc limit 1;

-- task 3
select round(sum(originalPrice),2) originalPrice,
round(sum(sellingPrice),2) sellingPrice,
concat('$',round(sum(originalPrice) - sum(sellingPrice),2)) as 'price difference'
from electronics_store ;

-- task 4 
select concat(round((sum(originalPrice) - sum(sellingPrice)) / sum(originalPrice) * 100,2),'%') as percentage_difference
from electronics_store;

-- task 5
select distinct resolution from electronics_store;

-- task 6 
select brand, count(*) as 'TV count' from electronics_store 
where operatingSystem = 'android' and size <= 40 group by brand;

-- task 7
select brand from electronics_store where size > 50 and resolution = 'QLED Ultra HD';

-- task 8
select brand from electronics_store where rating >= 4;

-- task 9
select brand, count(*) as '50 inches'from electronics_store where size = '50'
group by brand order by count(*) desc limit 1;

-- task 10
select brand, round(avg(rating), 1) as 'Average Rating'
from electronics_store group by brand order by brand;

-- task 11
select brand, round(avg(rating), 1) as 'Average Rating'
from electronics_store where size between 40 and 50 group by brand order by brand;

-- task 12 
select brand, max(sellingPrice), min(sellingPrice),
concat('$',format((max(sellingPrice) - min(sellingPrice)),2)) as 'priceDifference'
from electronics_store group by brand;

-- task 13
select brand, count(*) as 'Tv count' from electronics_store
where resolution = 'OLED' and size >= 55 and operatingSystem = 'smart tv'
group by Brand;

-- task 14
select distinct brand from electronics_store where resolution = 'Full HD LED' and rating >= 4;

-- task 15
select distinct(brand), count(*) as '50 inches'from electronics_store
where size = '50' group by brand order by count(*) desc limit 1;

-- task 16
select distinct brand from electronics_store where resolution like ('%plasma%');

-- task 17
select brand, count(brand) from electronics_store where resolution = '4k'
group by brand having count(brand) <= 3 order by count(brand);

-- task 18
select brand, round(avg(sellingPrice), 2) as average_price
from electronics_store having avg(sellingPrice) > 1000
order by brand;

/*				THE
												END
																				*/