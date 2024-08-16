/*
    Query 1: Discover the top 10 highest-paying remote jobs for Cloud Engineers. 
*/

SELECT
    job_postings.job_id,
    job_postings.job_title_short,
    job_postings.salary_year_avg,
    companies.name AS company_name,
    job_postings.job_location,
    job_postings.job_schedule_type,
    job_postings.job_posted_date::DATE
    
FROM 
    job_postings_fact AS job_postings
LEFT JOIN company_dim AS companies ON job_postings.company_id = companies.company_id
WHERE
    job_postings.job_title_short = 'Cloud Engineer' AND
    job_postings.salary_year_avg IS NOT NULL AND
    job_postings.job_location = 'Anywhere'
ORDER BY
    job_postings.salary_year_avg DESC
LIMIT 10;