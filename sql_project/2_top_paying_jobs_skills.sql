/*
Questions: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query.
- Add the specific skills required for these roles.
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries.
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
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
)

SELECT
top_paying_jobs.*,
skills_dim.skills
FROM
    top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC    

/*
Used Tableau to visually show the deamnd of skills required for data analyst in 2023.
SQL has a count 9 which takes first place.
Python with a count of 6 takes second place.
R takes third place with a count of 5.
Tableau take fourth place with a count of 4.
*/