SELECT * FROM campasx.sleep_efficiency;

-- Find out the average sleep duration of top 15 male candidates who's sleep duration are equal to 7.5 or greater than 7.5.
select  ID,avg(`Sleep duration`) as avg_dur
from campasx.sleep_efficiency
where `Sleep duration`>=7.5 
group by  Gender,ID having Gender = 'Male'
order by avg_dur DESC limit 15;

-- Problem 2: Show avg deep sleep time for both gender. Round result at 2 decimal places.
-- Note: sleep time and deep sleep percentage will give you, deep sleep time.


select Gender, round(avg(`Deep sleep percentage`) ,2) as avg_sleep
from campasx.sleep_efficiency
group by Gender;
-- Problem 3:
-- The question is:

-- Find out the lowest 10th to 30th light sleep percentage records where deep sleep percentage values are between 25 to 45. Display age, light sleep percentage and deep sleep percentage columns only.

select Age, `Light sleep percentage`,`Deep sleep percentage`
from campasx.sleep_efficiency
where `Deep sleep percentage` between 25 and 45
order by `Light sleep percentage` ASC limit 11,30;

-- Problem 4: 
-- Group by on exercise frequency and smoking status and show average deep sleep time, average light sleep time and avg rem sleep time.

select AVG(`Sleep duration`*(`Deep sleep percentage`/100)),
AVG(`Sleep duration`*(`REM sleep percentage`/100)),
AVG(`Sleep duration`*(`Light sleep percentage`/100))

from campasx.sleep_efficiency
group by `Smoking status`,`Exercise frequency`;


-- Problem 5: Group By on Awekning and show AVG Caffeine consumption, 
-- AVG Deep sleep time and AVG Alcohol consumption only for people who do exercise atleast 3 days a week. 
-- Show result in descending order awekenings


select avg(`Caffeine consumption`) as avg_caff, avg(`Deep sleep percentage`) as avg_deep , avg(`Alcohol consumption`) as avg_alch
from campasx.sleep_efficiency
where `Exercise frequency` >=3
group by Awakenings
order by Awakenings DESC;



-- Problem 6:
-- The question is:
-- Display those power stations which have average 'Monitored Cap.(MW)' (display the values) between 1000 and 2000 and the number of 
-- occurance of the power stations (also display these values) are greater than 200. Also sort the result in ascending order.


select `Power Station`, avg(`Monitored Cap.(MW)`) as avg_mon_cap,count(*) as no_of_occ
from campasx.powergeneration
group by `Power Station`
having (avg_mon_cap between 1000 and 2000) and no_of_occ>200
order by no_of_occ ASC;

-- Problem 7:
-- The question is:

-- Display top 10 lowest "value" State names of which the Year either belong to 2013 or 2017 or 2021 and type is 'Public In-State'. 
-- Also the number of occurance should be between 6 to 10. Display the average value upto 2 decimal places, 
-- state names and the occurance of the states.

select round(avg(`Value`),2) as avg_value,State,count(*) as occurance
from campasx.nces330_20
where `Year` =2013 or  `Year` =2017 or `Year` =2021 and `Type` = 'Public In-State'
group by `State`
having  occurance between 6 and 10;

-- Problem -8: Best state in terms of low education cost (Tution Fees) in 'Public' type university.

select sum(`Value`) as sum_val
from campasx.nces330_20
where Expense = 'Fees/Tuition' and `Type` like 'Public%'
group by State
order by sum_val ASC limit 1;

-- Problem 9: 2nd Costliest state for Private education in year 2013. Consider, Tution and Room fee both.
select * from campasx.nces330_20;
select `Year`, State,sum(`Value`) as sum_val
from campasx.nces330_20
where  `Year` =2013 AND Type LIKE '%Private%'
group by State
order by sum_val DESC limit 1;

-- The question is:

-- Display total and average values of Discount_offered for all the combinations of 'Mode_of_Shipment' 
-- (display this feature) and 'Warehouse_block' (display this feature also) for all male ('M') and 'High' Product_importance. 
-- Also sort the values in descending order of Mode_of_Shipment and ascending order of Warehouse_block.
select * from campasx.shipping_ecommerce;

select Mode_of_Shipment,sum(Discount_offered) as sum_offered, avg(Discount_offered) as avg_offered, Warehouse_block
from campasx.shipping_ecommerce
where Gender = 'M' and Product_importance='high'
group by Mode_of_Shipment,Warehouse_block
order by Mode_of_Shipment DESC,Warehouse_block ASC;