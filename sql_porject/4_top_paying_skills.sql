/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reaveals how different skills impact salary levels for Data Analyst and 
    helps identify the most financially rewarding skills to acquire or improve.
*/

SELECT 
skills,
ROUND(AVG(salary_year_avg), 2) AS avg_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short IN ('Data Analyst', 'Business Analyst') AND
    (
        job_location IN ('Long Beach, CA','Los Angeles, CA') OR
        job_location LIKE '%, CA'
    ) AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25

/*
     The highest-paying skills are no longer limited to traditional data analysis; the trend is shifting toward building systems with data.
    This means the top-paying roles are hybrid positions that combine aspects of data engineering, machine learning engineering, and analytics engineering.
    Companies pay a premium for analysts who can build predictive models, work with AI pipelines, and go beyond dashboards.
    Analysts who work on backend programming—querying data, processing data, and deploying solutions—are highly valued.
    Cloud computing and big data tools are increasingly lucrative for job seekers, as companies handle massive datasets.
    DevOps and automation skills are also growing in importance, as efficiently automating processes can significantly reduce costs.
*/    