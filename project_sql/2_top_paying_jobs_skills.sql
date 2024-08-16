/*
    Query 2: What skills are required for the top-paying Cloud Engineer jobs?
*/

WITH top_paying_jobs AS 
(
SELECT
    job_postings.job_id,
    job_postings.job_title_short,
    job_postings.salary_year_avg,
    companies.name AS company_name,
    job_postings.job_schedule_type
FROM 
    job_postings_fact AS job_postings
LEFT JOIN company_dim AS companies ON job_postings.company_id = companies.company_id
WHERE
    job_postings.job_title_short = 'Cloud Engineer' AND
    job_postings.salary_year_avg IS NOT NULL AND
    job_postings.job_location = 'Anywhere'
ORDER BY
    job_postings.salary_year_avg DESC
LIMIT 10
)

SELECT
    top_paying_jobs.*,
    skills_dim.skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC