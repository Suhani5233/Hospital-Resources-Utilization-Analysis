create database hospitalopsdb;
show databases;
use hospitalopsdb;
show tables;
-- Question 1: Average Patient Wait time by Ward Type.
-- Insight: Which wards have the highest delays in patient admission?

select * from admissions;
select * from beds;
-- Main Query

select round(avg(a.wait_time_mins),2) as average_waiting_time, b.ward from 
admissions a right  join beds b on a.bed_id= b.bed_id
group by b.ward
order by average_waiting_time desc ;

-- Question 2: Bed Occupancy Rate by Ward Type
-- Insight : Which wards have the highest bed  occupancy rate ?

select * from beds;
-- Main Query

select ward, round(sum(case when occupied_status="Yes" then 1 else 0 end )*100.0 / count(*),2) as occupancy_rate_percentage
from beds group by ward
order by occupancy_rate_percentage asc;

-- Question 3: Top 5 Doctors handling most patients
-- Insight: Which doctors are managing the most caseloads?

select * from doctors;
select * from admissions;
-- Main Query

select d.doctor_id, d.name, count(a.admission_id) as total_cases from doctors d 
join admissions a on d.doctor_id=a.doctor_id
group by d.doctor_id,d.name
order by total_cases asc
limit 5;

-- Question 4 : Patients by severity of conditions.
-- Insight: Number of  patients often visiting to be treated for a specific condition.

select * from patients;
-- Main Query

select count(patient_id) as total_patients, condition_severity from patients
group by condition_severity
order by total_patients asc;

-- Question 5: Average Length of Stay
-- Insight: How long on an average does the patient stay?

select * from admissions;
-- Main Query
select p.patient_id,  round(avg(datediff(a.discharge_date,a.admission_date)),2) as average_stay
from admissions a join patients p on a.patient_id=p.patient_id
group by p.patient_id
order by average_stay desc
limit 15;

-- Question 6 : Wait time trend over time 
-- Insight : Helpful to analyze if delays are improving.
select * from admissions;
-- Main Query

select round(avg(wait_time_mins),2) as avg_time,date(admission_date) as admission_day from admissions
group by admission_day
order by admission_day;

-- Question 7 : Doctor Availability Summary
-- Insight: Staff Availability for managing patient flow

select * from doctors;
-- Main Query

select availability,count(*) as doctor_count from doctors group by availability;

-- Question 8: Running total of admissions per day
-- Insight: To track how admissions accumulate over timebeing useful to track spotting trends.
select * from admissions;
-- Main Query

select admission_date, count(*) as daily_admissions, sum(count(*)) over(order by admission_date)
as cumulative_admissions from admissions group by admission_date order by admission_date;

-- Question 9 : Patient's Rank by Length of stay within each ward
-- Insight : Rank Patients by how long they stayed, separately for each ward type.
select * from admissions;
select * from beds;
-- Main Query

select a.patient_id, b.ward, a.admission_date,a.discharge_date,datediff(a.discharge_date,a.admission_date) as lenght_of_stay,
rank() over(partition by b.ward order by datediff(a.discharge_date,a.admission_date) desc ) as stay_in_rank_ward
from admissions a join beds b on a.bed_id=b.bed_id
where a.discharge_date is not null
order by b.ward,stay_in_rank_ward;
