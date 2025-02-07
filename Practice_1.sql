SELECT * FROM campasx.insurance_data;

-- Show records of 'male' patient from 'southwest' region.
select * from campasx.insurance_data where region='southwest' and gender ='male';

-- Show all records having bmi in range 30 to 45 both inclusive.
select * from campasx.insurance_data where bmi between 30 and 45;

select * from campasx.insurance_data;
-- Show minimum and maximum bloodpressure of diabetic patient who smokes. Make column names as MinBP and MaxBP respectively.
select min(bloodpressure) as MinBP,max(bloodpressure) as MaxBP, smoker from campasx.insurance_data where smoker='Yes';


-- Find no of unique patients who are not from southwest region.

select count(distinct(PatientID)) from campasx.insurance_data where region not in ('southwest');


-- Total claim amount from male smoker.

-- select * from campasx.insurance_data;

select sum(claim) as tolal_claim from campasx.insurance_data where gender = 'male' and smoker='Yes';

-- Select all records of south region.alter


select distinct(region) from campasx.insurance_data;
select * from campasx.insurance_data where region in ('southeast','southwest');



-- No of patient having normal blood pressure. Normal range[90-120]


select * from campasx.insurance_data where bloodpressure between 90 and 120;


-- No of pateint belo 17 years of age having normal blood pressure as per below formula -

-- BP normal range = 80+(age in years × 2) to 100 + (age in years × 2)

-- Note: Formula taken just for practice, don't take in real sense.

select bloodpressure+(age*2) as noramal_bp  from campasx.insurance_data where bloodpressure between 90 and 120;


-- What is the average claim amount for non-smoking female patients who are diabetic?



select avg(claim) from campasx.insurance_data where diabetic = 'Yes' and smoker='no' and gender='female';


-- Write a SQL query to update the claim amount for the patient with PatientID = 1234 to 5000.

update  campasx.insurance_data set claim = 10*claim where PatientID between 1234 and 5000 ;


-- Write a SQL query to delete all records for patients who are smokers and have no children.
select * from campasx.insurance_data;

delete from campasx.insurance_data where smoker='Yes' and children=0;