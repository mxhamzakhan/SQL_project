/*
Question: What are the top paying skills for Data Analyst jobs in India based on salary?
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg),2) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id=job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id=skills_job_dim.skill_id
WHERE 
    job_title_short='Data Analyst' AND
    job_location='India' AND
    salary_year_avg IS NOT NULL
GROUP BY 
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;

/*

Here is a breakdown of the results for the top paying skills for remote Data Analyst roles:

-Many skills like Excel, SQL, etc. which are foundational for data analysis are mentioned.
-Project Management & Communication: Skills like Visio, Jira, and Confluence suggest a focus on collaboration, communication, and task management.
-Business Intelligence & Cloud: Power BI and Azure expertise highlight the growing demand for data analysts comfortable with cloud platforms and business intelligence tools.

[
  {
    "skills": "visio",
    "avg_salary": "119250.00"
  },
  {
    "skills": "jira",
    "avg_salary": "119250.00"
  },
  {
    "skills": "confluence",
    "avg_salary": "119250.00"
  },
  {
    "skills": "power bi",
    "avg_salary": "118140.00"
  },
  {
    "skills": "azure",
    "avg_salary": "118140.00"
  },
  {
    "skills": "powerpoint",
    "avg_salary": "104550.00"
  },
  {
    "skills": "flow",
    "avg_salary": "96603.75"
  },
  {
    "skills": "sheets",
    "avg_salary": "93600.00"
  },
  {
    "skills": "word",
    "avg_salary": "89578.50"
  },
  {
    "skills": "sql",
    "avg_salary": "85397.28"
  },
  {
    "skills": "excel",
    "avg_salary": "84365.69"
  },
  {
    "skills": "pytorch",
    "avg_salary": "79200.00"
  },
  {
    "skills": "unix",
    "avg_salary": "79200.00"
  },
  {
    "skills": "tensorflow",
    "avg_salary": "79200.00"
  },
  {
    "skills": "windows",
    "avg_salary": "79200.00"
  },
  {
    "skills": "python",
    "avg_salary": "77186.33"
  },
  {
    "skills": "r",
    "avg_salary": "76666.67"
  },
  {
    "skills": "outlook",
    "avg_salary": "75067.50"
  },
  {
    "skills": "oracle",
    "avg_salary": "75067.50"
  },
  {
    "skills": "tableau",
    "avg_salary": "74435.33"
  },
  {
    "skills": "t-sql",
    "avg_salary": "64600.00"
  },
  {
    "skills": "vba",
    "avg_salary": "64600.00"
  },
  {
    "skills": "ms access",
    "avg_salary": "64600.00"
  },
  {
    "skills": "looker",
    "avg_salary": "64600.00"
  },
  {
    "skills": "sql server",
    "avg_salary": "64600.00"
  }
]

*/