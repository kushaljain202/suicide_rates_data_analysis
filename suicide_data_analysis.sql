--- Data Overview
Select * 
from suicide_data
Where Total > 1;

-- Viewing the different States
Select distinct(State) 
from suicide_data
Where State Not in ('TOTAL (ALL INDIA)' , 'TOTAL (STATES)' ,'TOTAL (UTs)');

--Vieweing different age_groups
Select distinct(Age_group) 
from suicide_data
group by Age_group
order by Age_group desc;


-- Max death by age (removing 0-100 as it is a vague number)
Select Age_group , MAX(Total) as Total_deaths
from suicide_data
where Age_group <> '0-100+' and State Not in ('TOTAL (ALL INDIA)' , 'TOTAL (STATES)' ,'TOTAL (UTs)')
group by Age_group
Order by MAX(Total) desc;

--  Highest death by means adopted
Select Type ,Type_code, Gender , Age_group , State , Year , MAX(Total) as max_total
from suicide_data
where Total > 1 and Type_code IN ( 'Means_adopted')
group by Year,Type,Type_code,Gender , Age_group , State
order by max_total desc;

-- Total suicides by year
Select Year , Sum(Total) as Total_deaths
from suicide_data
Where State Not in ('TOTAL (ALL INDIA)' , 'TOTAL (STATES)' ,'TOTAL (UTs)')
Group by Year
order by Total_deaths desc;

-- Total suicides by Social Status and Gender
Select Type ,Type_code, Gender , Age_group , State , Year , sum(Total) as Totalsum
from suicide_data
where Total>1 and State Not in ('TOTAL (ALL INDIA)' , 'TOTAL (STATES)' ,'TOTAL (UTs)')
group by State,Type ,Type_code, Gender , Age_group , Year
order by sum(Total) desc;


-- Looking at different type code 
Select distinct(Type_code) 
from suicide_data
Where Total <> 0
group by Type_code;

-- Looking at the different type
Select distinct(Type) 
from suicide_data
Where Total <> 0
group by Type;



-- Which social_status had the highest number of suicides
Select Type ,Type_code, Gender , Age_group , State , Year , Total 
from suicide_data
where Total>1 and State <> 'TOTAL (ALL INDIA)' and State <> 'TOTAL (STATES)' 
order by Total desc;


-- Analysis based on Marriage type 
Select Type , Gender , Age_group , State , Year , Total 
from suicide_data
where Total > 1 and Type_code = 'Social_Status' and State NOT IN ('TOTAL (ALL INDIA)' , 'TOTAL (STATES)' ,'TOTAL (UTs)') --and Year = 2012
order by Total desc ,Type , Gender , State , Year;



-- Analysis based on Professional Profile
Select Type , Gender , Age_group , State , Year , Total
from suicide_data
where Total > 1 and Type_code = 'Professional_Profile' and State NOT IN ('TOTAL (ALL INDIA)' , 'TOTAL (STATES)' ,'TOTAL (UTs)')
order by Total desc ,Type , Gender , State , Year;



-- Total Deaths from 2001-2012
Select sum(Total) as Total_deaths
from suicide_data
Where State Not in ('TOTAL (ALL INDIA)' , 'TOTAL (STATES)' ,'TOTAL (UTs)');


-- Looking at different years
Select distinct(Year) 
from suicide_data
group by Year 
order by Year asc;


-- Looking at Suicide by state from 2001-2012
Select distinct(state) , Sum(Total) as Total_death
from suicide_data
Where State Not in ('TOTAL (ALL INDIA)' , 'TOTAL (STATES)' ,'TOTAL (UTs)')
group by State
order by Total_death desc;


-- Percentage of death each year by different means adopted
Select distinct(Type) , cast(((Sum(Total)/7248010.00) * 100.00) as decimal(10,2)) as Total_death_Percentage
from  suicide_data
where Type_code = 'Means_adopted' and State NOT IN ('TOTAL (ALL INDIA)' , 'TOTAL (STATES)' ,'TOTAL (UTs)')
group by Type 
order by Total_death_Percentage desc;


--Percentage of deaths by Professional Profile
Select distinct(Type) , cast(((Sum(Total)/7248010.00) * 100.00) as decimal(10,2)) as Total_death_Percentage
from suicide_data
Where Type_code = 'Professional_Profile' and Type<> 'Others (Please Specify)'  and State NOT IN ('TOTAL (ALL INDIA)' , 'TOTAL (STATES)' ,'TOTAL (UTs)')
group by Type
order by Total_death_Percentage desc;

-- Percentage of deaths by State
Select distinct(state) , cast(((Sum(Total)/7248010.00) * 100.00) as decimal(10,2)) as Total_death_Percentage
from suicide_data
Where State Not in ('TOTAL (ALL INDIA)' , 'TOTAL (STATES)' ,'TOTAL (UTs)')
group by State
order by Total_death_Percentage desc;



-- Percentage of death by gender from 2001-2012
Select distinct(Gender) , cast(((Sum(Total)/7248010.00) * 100.00) as decimal(10,2)) as Total_death_Percentage
from suicide_data
Where State NOT IN ('TOTAL (ALL INDIA)' , 'TOTAL (STATES)' ,'TOTAL (UTs)')
group by Gender
order by Total_death_Percentage desc;

-- Percentage of deaths each year by different social status 
Select distinct(Type) , cast(((Sum(Total)/7248010.00) * 100.00) as decimal(10,2)) as Total_death_Percentage
from suicide_data
Where Type_code = 'Social_Status' and State NOT IN ('TOTAL (ALL INDIA)' , 'TOTAL (STATES)' ,'TOTAL (UTs)')
group by Type
order by Total_death_Percentage desc;


-- Percentage of deaths by each cause from 2001-2012
Select distinct(Type) , cast(((Sum(Total)/7248010.00) * 100.00) as decimal(10,2)) as Total_death_Percentage
from suicide_data
Where Type_code = 'Causes' and Type NOT in ('Causes Not known' , 'Other Causes (Please Specity)') and State NOT IN ('TOTAL (ALL INDIA)' , 'TOTAL (STATES)' ,'TOTAL (UTs)')
group by Type
order by Total_death_Percentage desc;



-- Total deaths from 2001-2012 V/S Percentage of deaths each year from that total
Select Year , cast(((Sum(Total)/7248010.00) * 100.00) as decimal(10,2)) as Total_death_Percentage
from suicide_data
Where State NOT IN ('TOTAL (ALL INDIA)' , 'TOTAL (STATES)' ,'TOTAL (UTs)')
Group by Year
order by Total_death_Percentage asc;


-- Total deaths by Education_Status
Select distinct(Type) ,cast(((Sum(Total)/7248010.00) * 100.00) as decimal(10,2)) as Total_death_Percentage 
from suicide_data
Where Type_code = 'Education_Status' and State NOT IN ('TOTAL (ALL INDIA)' , 'TOTAL (STATES)' ,'TOTAL (UTs)')
group by Type
order by Total_death_Percentage desc;



-- Viewing different Education_status
Select distinct(Type) 
from suicide_data
Where Type_code = 'Education_Status';
