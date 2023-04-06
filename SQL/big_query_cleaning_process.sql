BigQuery cleaning process 

-- Calculate the number of users and their daily average 

--1)Track physical activity

SELECT
 COUNT(DISTINCT id) AS total_users_daily_activity,
 AVG(total_steps) AS average_steps,
 AVG(total_distance) AS average_distance,
 AVG(calories) AS averga_calories
FROM
 `capstone-case-study-377115.Data_fitbit.daily_activity_merged`

--2) Track heart rate

(SELECT
 COUNT(DISTINCT id) AS total_users_hr,
 AVG(value) AS average_hr,
 MAX(value) AS max_hr,
 MIN(value) AS min_hr
FROM
 `capstone-case-study-377115.Data_fitbit.heartrate_seconds_merged` )

-- 3) Track sleep

SELECT
 COUNT(DISTINCT id) AS total_users_sleep,
 AVG(total_minutes_asleep)/60 AS average_hours_sleep,
 MIN(total_minutes_asleep)/60 AS min_hours_sleep,
 MAX(total_minutes_asleep)/60 AS max_hours_sleep,
 AVG(total_time_in_bed)/60 as average_hours_in_bed
 
FROM
 `capstone-case-study-377115.Data_fitbit.sleep_day_merged`


--4) Track weight

SELECT
 COUNT(DISTINCT id) AS total_users_wt,
 AVG(weight_pounds) AS average_weight_pounds,
 MAX(weight_pounds) AS max_weight,
 MIN(weight_pounds) AS min_weight,
 AVG(BMI) AS average_BMI,
 MAX(BMI) AS max_BMI,
 MIN(BMI) AS min_BMI

FROM
 `capstone-case-study-377115.Data_fitbit.weight_log_info_merged`

--5) Tracked days of physical activity per id BETWEEN '2016-01-01' AND '2016-08-01'

SELECT 
id,
COUNT (DISTINCT EXTRACT(DAY FROM activity_date)) AS days,
 
FROM `capstone-case-study-377115.Data_fitbit.daily_activity_merged`

WHERE
 activity_date BETWEEN '2016-01-01' AND '2016-08-01'

GROUP BY  
id
ORDER BY
days DESC

--6) Select the average of weeks and months OF ACTIVITY RECORDED. 

SELECT
AVG(days/7.00) AS weeks_activity_recorded,
avg(days/31.00) AS months_activity_recorded
FROM 
`capstone-case-study-377115.Data_fitbit.days_physical_activity_per_id_2016_2017`

--7) Calculate the average hours of each activity 

SELECT 
 AVG(very_active_minutes) AS Average_very_minutes,
 AVG(fairly_active_minutes) AS Average_fairly_active_minutes,
 AVG(lightly_active_minutes)/60 AS average_lightly_active_hours,
 AVG(sedentary_minutes)/60 AS average_sedentary_hours
FROM `capstone-case-study-377115.Data_fitbit.daily_activity_merged` 


--8) Determine at what time users are most active

SELECT
DISTINCT hour AS activity_hour,  
AVG(total_intensity) OVER (PARTITION BY hour) AS average_intensity,
AVG(METs) OVER (PARTITION BY HOUR) AS average_METs
FROM `capstone-case-study-377115.Data_fitbit.hourly_activity` AS hourly_activity
INNER JOIN`capstone-case-study-377115.Data_fitbit.minute_METs_narrow_merged` AS METs_1
ON
 hourly_activity.id = METs_1.id AND
 hourly_activity.hour = METs_1.activity_minute
ORDER BY
average_METs DESC