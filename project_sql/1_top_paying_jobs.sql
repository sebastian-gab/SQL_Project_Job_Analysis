/*
    Qustion: What are the top 10 paying Cloud Engineer jobs?
*/

SELECT
    job_postings_fact.job_title_short,
    job_postings_fact.salary_year_avg,
    job_postings_fact.salary_hour_avg,
    job_postings_fact.job_location
FROM job_postings_fact
WHERE
    job_postings_fact.job_title_short = 'Cloud Engineer'
ORDER BY
    job_postings_fact.salary_year_avg DESC
LIMIT 10;