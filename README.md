# Introduction
This project focuses on the data job market with a focus on data analyst and business analyst roles. Exploring top-paying jobs, in-demand skills, and finding the best combination of skills to learn or improve.

SQL queries? Check them out here: [sql_project](/sql_project/)
# Background
In my quest to show experince and drive I followed a [SQL Course](http://lukebarousse.com/sql) by Luke Barousse. In this course I used job market data from 2023 that he accquired and ran many queries to showcase top-paid and in-demand skills for the roles of data analyst or business analyst.

The data used in the sql course contains many different insights on job titles, salaries, locations, and core skills.

### The questions that were investigated through SQL queries were:
1. What are the top-paying data analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?
# Tools I Used
For this project I used serveral key tools such as:
- **SQL:** The main driver of my analysis, allowing me to run many quieres in search of the questions mentioned above. 
- **PostgreSQL:** The chosen database management system and my very first time learning and using it to complete a project. 
- **Visual Studio Code:** My prefered database management and executing SQL queries or running any C# or C++ and in the near future python code. 
- **Git & GitHub:** First time learing and using git/github as this is an esstienal tool for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking. 
# The Analysis
The queries in this project were developed to investigate key aspects of the data anayst job market. Here's an overview of my approach to each one. 
### 1. Top Paying Data Analyst Jobs/Business Analyst. 
The goal of this query is to identify the highest-paying roles, I filtered data analyst and business analyst positions by average yearly salary and location, focusing on jobs located in the area of Long Beach and Los Angeles. This query highlights the high paying opportunities in their respected fields. 

```sql
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
```        

# What I learned 
# Conclusion
