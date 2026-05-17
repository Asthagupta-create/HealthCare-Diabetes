CREATE DATABASE diabetes_project;

USE diabetes_project;

Select * from diabetes_analysis;
describe diabetes_analysis;

Select COUNT(*) as Total_Records
from diabetes_analysis;

-- Total number of patients

Select COUNT(*) as Total_Patients
from diabetes_analysis;

--  Total diabetic patients

Select COUNT(*) as Diabetic_Patient
from diabetes_analysis
where outcome= 1;

-- Patient Distribution by Age Group

Select
    case
        when Age < 30 then 'Young'
        when Age between 30 and 50 then 'Middle Age'
        else 'Senior'
    end as Age_Group,
    COUNT(*) as Total_Patients
from diabetes_analysis
group by Age_Group
order by Total_Patients DESC;


-- Diabetic Patients by Age Group

Select
    case
        when Age < 30 then 'Young'
        when Age between 30 and 50 then 'Middle Age'
        else 'Senior'
   end as Age_Group,

    COUNT(*) as Diabetic_Count

from diabetes_analysis
where Outcome = 1
group by Age_Group
order by Diabetic_Count DESC;

-- High-Risk Patient Analysis

Select Pregnancies, Glucose, BMI, Age,Outcome
from diabetes_analysis
where Glucose > 140
and BMI > 30
order by Glucose DESC;

--  Classification of patients based on BMI levels
Select
    case
        when BMI < 18.5 then 'Underweight'
        when BMI between 18.5 and 24.9 then 'Normal Weight'
        when BMI between 25 and 29.9 then 'Overweight'
        else 'Obese'
   end as BMI_Category,

    COUNT(*) as Total_Patients
from diabetes_analysis
group by BMI_Category
order by Total_Patients DESC;

-- Average glucose by diabetes outcome
Select
    Outcome,
    AVG(Glucose) as Average_Glucose
from diabetes_analysis
group by Outcome;

--  Diabetes Percentage Analysis

Select
(
    SUM(case when Outcome = 1 then 1 else 0 end)
    * 100.0
    / COUNT(*)
) as Diabetes_Percentage

from diabetes_analysis;



