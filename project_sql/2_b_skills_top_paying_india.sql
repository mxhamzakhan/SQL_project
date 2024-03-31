/*
Question: What skills are required for the top paying Data Analyst jobs in India?
*/

WITH top_jobs AS(
    SELECT 
        job_id,
        job_title,
        name AS company_name,
        salary_year_avg
    FROM 
        job_postings_fact
    LEFT JOIN company_dim ON company_dim.company_id=job_postings_fact.company_id
    WHERE
        job_title_short ='Data Analyst' AND
        job_location='India' AND
        salary_year_avg IS NOT NULL

    ORDER BY salary_year_avg DESC

    LIMIT 10
    )

SELECT 
    top_jobs.*,
    skills
FROM top_jobs
INNER JOIN skills_job_dim ON skills_job_dim.job_id=top_jobs.job_id
INNER JOIN skills_dim ON skills_dim.skill_id=skills_job_dim.skill_id
ORDER BY salary_year_avg DESC;

/*
Based on job postings, here is the breakdown of the most demanded skills for data analysts in 2023:
- SQL is the leading skill required 7 out of 10 times.
` Excel follows closely, being required 6 out of 10 times.
- Python is also sought after 6 out of 10 times.
- Other skills like R, Tableau and Word show varying degrees of demand.
[
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "company_name": "Deutsche Bank",
    "salary_year_avg": "119250.0",
    "skills": "sql"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "company_name": "Deutsche Bank",
    "salary_year_avg": "119250.0",
    "skills": "excel"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "company_name": "Deutsche Bank",
    "salary_year_avg": "119250.0",
    "skills": "visio"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "company_name": "Deutsche Bank",
    "salary_year_avg": "119250.0",
    "skills": "jira"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "company_name": "Deutsche Bank",
    "salary_year_avg": "119250.0",
    "skills": "confluence"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "company_name": "ACA Group",
    "salary_year_avg": "118140.0",
    "skills": "sql"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "company_name": "ACA Group",
    "salary_year_avg": "118140.0",
    "skills": "azure"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "company_name": "ACA Group",
    "salary_year_avg": "118140.0",
    "skills": "excel"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "company_name": "ACA Group",
    "salary_year_avg": "118140.0",
    "skills": "power bi"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "company_name": "ACA Group",
    "salary_year_avg": "118140.0",
    "skills": "flow"
  },
  {
    "job_id": 591307,
    "job_title": "HR Data Operations Analyst",
    "company_name": "Clarivate",
    "salary_year_avg": "104550.0",
    "skills": "excel"
  },
  {
    "job_id": 591307,
    "job_title": "HR Data Operations Analyst",
    "company_name": "Clarivate",
    "salary_year_avg": "104550.0",
    "skills": "word"
  },
  {
    "job_id": 591307,
    "job_title": "HR Data Operations Analyst",
    "company_name": "Clarivate",
    "salary_year_avg": "104550.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 1218280,
    "job_title": "Financial Data Analyst",
    "company_name": "Loop Health",
    "salary_year_avg": "93600.0",
    "skills": "sql"
  },
  {
    "job_id": 1218280,
    "job_title": "Financial Data Analyst",
    "company_name": "Loop Health",
    "salary_year_avg": "93600.0",
    "skills": "python"
  },
  {
    "job_id": 1218280,
    "job_title": "Financial Data Analyst",
    "company_name": "Loop Health",
    "salary_year_avg": "93600.0",
    "skills": "r"
  },
  {
    "job_id": 1218280,
    "job_title": "Financial Data Analyst",
    "company_name": "Loop Health",
    "salary_year_avg": "93600.0",
    "skills": "sheets"
  },
  {
    "job_id": 544240,
    "job_title": "Healthcare Research & Data Analyst",
    "company_name": "Clarivate",
    "salary_year_avg": "89118.0",
    "skills": "sql"
  },
  {
    "job_id": 544240,
    "job_title": "Healthcare Research & Data Analyst",
    "company_name": "Clarivate",
    "salary_year_avg": "89118.0",
    "skills": "python"
  },
  {
    "job_id": 544240,
    "job_title": "Healthcare Research & Data Analyst",
    "company_name": "Clarivate",
    "salary_year_avg": "89118.0",
    "skills": "excel"
  },
  {
    "job_id": 544240,
    "job_title": "Healthcare Research & Data Analyst",
    "company_name": "Clarivate",
    "salary_year_avg": "89118.0",
    "skills": "tableau"
  },
  {
    "job_id": 544240,
    "job_title": "Healthcare Research & Data Analyst",
    "company_name": "Clarivate",
    "salary_year_avg": "89118.0",
    "skills": "word"
  },
  {
    "job_id": 152699,
    "job_title": "Ai Research Engineer",
    "company_name": "AlphaSense",
    "salary_year_avg": "79200.0",
    "skills": "python"
  },
  {
    "job_id": 152699,
    "job_title": "Ai Research Engineer",
    "company_name": "AlphaSense",
    "salary_year_avg": "79200.0",
    "skills": "tensorflow"
  },
  {
    "job_id": 152699,
    "job_title": "Ai Research Engineer",
    "company_name": "AlphaSense",
    "salary_year_avg": "79200.0",
    "skills": "pytorch"
  },
  {
    "job_id": 733296,
    "job_title": "Data Integration and Business Intelligence Analyst",
    "company_name": "Miratech",
    "salary_year_avg": "79200.0",
    "skills": "sql"
  },
  {
    "job_id": 733296,
    "job_title": "Data Integration and Business Intelligence Analyst",
    "company_name": "Miratech",
    "salary_year_avg": "79200.0",
    "skills": "unix"
  },
  {
    "job_id": 733296,
    "job_title": "Data Integration and Business Intelligence Analyst",
    "company_name": "Miratech",
    "salary_year_avg": "79200.0",
    "skills": "windows"
  },
  {
    "job_id": 733296,
    "job_title": "Data Integration and Business Intelligence Analyst",
    "company_name": "Miratech",
    "salary_year_avg": "79200.0",
    "skills": "tableau"
  },
  {
    "job_id": 989706,
    "job_title": "Data Analyst - Price hub",
    "company_name": "Cargill",
    "salary_year_avg": "75067.5",
    "skills": "sql"
  },
  {
    "job_id": 989706,
    "job_title": "Data Analyst - Price hub",
    "company_name": "Cargill",
    "salary_year_avg": "75067.5",
    "skills": "oracle"
  },
  {
    "job_id": 989706,
    "job_title": "Data Analyst - Price hub",
    "company_name": "Cargill",
    "salary_year_avg": "75067.5",
    "skills": "excel"
  },
  {
    "job_id": 989706,
    "job_title": "Data Analyst - Price hub",
    "company_name": "Cargill",
    "salary_year_avg": "75067.5",
    "skills": "word"
  },
  {
    "job_id": 989706,
    "job_title": "Data Analyst - Price hub",
    "company_name": "Cargill",
    "salary_year_avg": "75067.5",
    "skills": "outlook"
  },
  {
    "job_id": 989706,
    "job_title": "Data Analyst - Price hub",
    "company_name": "Cargill",
    "salary_year_avg": "75067.5",
    "skills": "flow"
  },
  {
    "job_id": 1018519,
    "job_title": "Data Analyst I",
    "company_name": "Bristol Myers Squibb",
    "salary_year_avg": "71600.0",
    "skills": "python"
  },
  {
    "job_id": 1018519,
    "job_title": "Data Analyst I",
    "company_name": "Bristol Myers Squibb",
    "salary_year_avg": "71600.0",
    "skills": "r"
  },
  {
    "job_id": 1018519,
    "job_title": "Data Analyst I",
    "company_name": "Bristol Myers Squibb",
    "salary_year_avg": "71600.0",
    "skills": "excel"
  },
  {
    "job_id": 1797441,
    "job_title": "IT Data Analytic Architect - Biopharma Commercial",
    "company_name": "Merck Group",
    "salary_year_avg": "64800.0",
    "skills": "sql"
  },
  {
    "job_id": 1797441,
    "job_title": "IT Data Analytic Architect - Biopharma Commercial",
    "company_name": "Merck Group",
    "salary_year_avg": "64800.0",
    "skills": "python"
  }
]*/

