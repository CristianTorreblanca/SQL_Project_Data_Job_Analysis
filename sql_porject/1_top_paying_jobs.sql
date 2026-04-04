/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotley or in California. 
- Focuses on job posting with specified salaries (remove nulls).
- Why? Highlight the top-paying opportunities for Data Analyst, offering insights into emplpoyment. 
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    company_dim.name AS company_name
FROM
     job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id     
WHERE
 job_title_short IN ('Data Analyst', 'Business Analyst') AND
    (
        job_location IN ('Long Beach, CA','Los Angeles, CA') OR
        job_location LIKE '%, CA'
    )AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10        
