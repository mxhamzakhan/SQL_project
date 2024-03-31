# Introduction

This project started with a mission: crack the code on the most lucrative data analyst skills. Inspired by Luke Barousse's insightful [SQL Course](https://lukebarousse.com/sql). I embarked on a data exploration to identify the top-paying skills for Data Analysts (both remote and in India)

Check out the SQL queries here: [project_sql folder](/project_sql/)

### Curious About:
What are the top-paying data analyst remote jobs?
*/
1. Top-paying data analyst jobs:
    * Remote
    * India
2. Top paying data analyst skills:
    * Remote
    * India
3. In-demand skills for data analysts:
    * Remote
    * India
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?

# Tools Used ⛏️🧑🏽‍💻

To navigate the data analyst job market, I enlisted a powerful toolkit:

- **SQL:** It served as the foundation, enabling me to interrogate the database and extract valuable insights.
- **PostgreSQL:** My database management system of choice, offered a robust platform for managing the job posting data.
- **Visual Studio Code:** Provided a familiar environment for database interaction and executing SQL queries.
- **Git and GitHub:** ensured seamless version control and collaboration by allowing me to track changes and share my SQL scripts and analysis.


# Analysis
### 1. Top Paying Data Analyst Jobs:
I filtered top 10 paying data analyst jobs based on their average yearly salary while focusing on remote jobs and then I ran the same query again focusing on data analyst jobs in India.
#### a. Remote:
```sql
SELECT
    job_title,
    name AS company_name,
    salary_year_avg,
    job_schedule_type,
    job_posted_date:: DATE
FROM 
    job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id=job_postings_fact.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location='Anywhere' AND
    salary_year_avg IS NOT NULL

ORDER BY salary_year_avg DESC

LIMIT 10;
```

![Remote Jobs](images\1a.png)
*This image was created using Pivot Table in Excel after exporting the results of the above query*

#### b. India:
```sql
SELECT 
    job_title,
    name AS company_name,
    salary_year_avg,
    job_schedule_type,
    job_posted_date:: DATE
FROM 
    job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id=job_postings_fact.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location='India' AND
    salary_year_avg IS NOT NULL

ORDER BY salary_year_avg DESC

LIMIT 10;
```
![Remote Jobs](images\1b.png)
*This image was created using Pivot Table in Excel after exporting the results of the above query*

### 2. Skills For Top Paying Jobs:
I ran the following queries to find out what are the leading skills required for top data analyst jobs, both remote and in India.

#### a. Remote:
```sql
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
        job_location='Anywhere' AND
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
```

![skills_required](images\2a.png)
*This image was created using Pivot Table in Excel after exporting the results of the above query*

#### b. India:
```sql
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
```
![skills_required_india](images\2b.png)
*This image was created using Pivot Table in Excel after exporting the results of the above query*
### 3. Most Demanded Skills:
These were the top skills that were frequently demanded for the data analyst jobs, both remote and in India.
#### a. Remote:
```sql
SELECT 
    skills,
    count(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id=job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id=skills_job_dim.skill_id
WHERE 
    job_title_short='Data Analyst' AND
    job_work_from_home=true
GROUP BY 
    skills
ORDER BY
    demand_count DESC
LIMIT 5;
```

![top_demanded_skills_remote](images\3a.png)
*This image was created using Pivot Table in Excel after exporting the results of the above query*

#### b. India:
```sql
SELECT 
    skills,
    count(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id=job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id=skills_job_dim.skill_id
WHERE 
    job_title_short='Data Analyst' AND
    job_location='India'
GROUP BY 
    skills
ORDER BY
    demand_count DESC
LIMIT 5;
```
![skills_required_india](images\3b.png)

*This image was created using Pivot Table in Excel after exporting the results of the above query*

### 4. Skills for Top-Paying Jobs:
These are the skills that were associated with highest paying jobs, both remote and in India.

#### a. Remote:
```sql
SELECT 
    skills,
    ROUND(AVG(salary_year_avg),2) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id=job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id=skills_job_dim.skill_id
WHERE 
    job_title_short='Data Analyst' AND
    job_work_from_home=true AND
    salary_year_avg IS NOT NULL
GROUP BY 
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;
```
| Skills        | Average Salary ($) | Skills        | Average Salary ($) |
|---------------|----------------|---------------|----------------|
| pyspark       | 208172.25      | datarobot     | 155485.50      |
| bitbucket     | 189154.50      | gitlab        | 154500.00      |
| couchbase     | 160515.00      | swift         | 153750.00      |
| watson        | 160515.00      | jupyter       | 152776.50      |
| elasticsearch| 145000.00      | golang        | 145000.00      |
| numpy         | 143512.50      | databricks    | 141906.60      |
| linux         | 136507.50      | kubernetes    | 132500.00      |
| atlassian     | 131161.80      | twilio        | 127000.00      |
| airflow       | 126103.00      | scikit-learn  | 125781.25      |
| jenkins       | 125436.33      | notion        | 125000.00      |
| scala         | 124903.00      | postgresql    | 123878.75      |
| gcp           | 122500.00      | microstrategy | 121619.25      |

Here is a breakdown of the results for the top paying skills for remote Data Analyst roles:
- **Big Data & Cloud:** PySpark, Databricks, GCP - high demand for handling large datasets in the cloud.
- **Machine Learning & AI:** scikit-learn, Watson - skills crucial for extracting insights using these tools.
- **Collaboration & Version Control:** Gitlab, Bitbucket, Atlassian - data teams working more closely, managing data versions effectively.
- **Communication & Project Management:** Notion, Twilio - well-rounded analysts needed, with strong communication and project management skills.


#### b. India:
```sql
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
```

| Skills       | Average Salary ($) | Skills       | Average Salary ($) |
|--------------|----------------|--------------|----------------|
| visio        | 119250.00      | power bi     | 118140.00      |
| jira         | 119250.00      | azure        | 118140.00      |
| confluence   | 119250.00      | powerpoint   | 104550.00      |
| flow         | 96603.75       | sheets       | 93600.00       |
| word         | 89578.50       | sql          | 85397.28       |
| excel        | 84365.69       | pytorch      | 79200.00       |
| unix         | 79200.00       | tensorflow   | 79200.00       |
| windows      | 79200.00       | python       | 77186.33       |
| r            | 76666.67       | outlook      | 75067.50       |
| oracle       | 75067.50       | tableau      | 74435.33       |
| t-sql        | 64600.00       | vba          | 64600.00       |
| ms access    | 64600.00       | looker       | 64600.00       |
| sql server   | 64600.00       |              |                |

Here is a breakdown of the results for the top paying skills for remote Data Analyst roles:

- Many skills like Excel, SQL, etc. which are foundational for data analysis are mentioned.
- **Project Management & Communication:** Skills like Visio, Jira, and Confluence suggest a focus on collaboration, communication, and task management.
- **Business Intelligence & Cloud:** Power BI and Azure expertise highlight the growing demand for data analysts comfortable with cloud platforms and business intelligence tools.

### 5. Optimal Skills:
The are the optimal skills that a data analyst must know while doing remote jobs.

```sql
SELECT
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg),2) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id=job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id=skills_job_dim.skill_id
WHERE 
    job_title_short='Data Analyst' AND
    job_work_from_home=true AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 20
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 10;
```
| Skills     | Demand Count | Average Salary ($) |
|------------|--------------|----------------|
| go         | 27           | 115319.89      |
| hadoop     | 22           | 113192.57      |
| snowflake  | 37           | 112947.97      |
| azure      | 34           | 111225.10      |
| aws        | 32           | 108317.30      |
| oracle     | 37           | 104533.70      |
| looker     | 49           | 103795.30      |
| python     | 236          | 101397.22      |
| r          | 148          | 100498.77      |
| tableau    | 230          | 99287.65       |

*These are the optimal skills along with their demand count and average salaries*

# Conclusions:
These are the insights that I drew from this analysis:
1. **Top-Paying Data Analyst Jobs:** The top paying remote Data Analyst job offers the highest average yearly salary of $650,000 while the top paying Data Analyst job in India offers the highest average yearly salary of $119,250

2. **Skill For Top Paying Jobs:** Skills required for the top paying jobs for remote work and in India follow a pretty similar trend with SQL being the most sought after skill.

3. **Most Demanded Skill:** SQL is the most demanded skill for data analyst jobs, making it an essential skill.

4. **Skill with High Salaries:** Skills like PySpark, Databricks, GCP are in high demand for handling large datasets in the cloud.

5. **Optimal Skills:** SQL is the most sought after skill in the whole market so it becomes the optimal skill for data analysts to maximise their worth when applying for jobs.
