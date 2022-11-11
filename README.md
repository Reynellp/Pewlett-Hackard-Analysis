# Pewlett-Hackard-Analysis

# Project Overview
As baby boomers begin to retire at a rapid rate, Pewlett Hackard is looking toward the future in two ways. First, it's offering a retirement package for those who meet certain criteria. Second, it's starting to think about which positions will need to be filled in the near future. Determined the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program. Build an employee database with SQL by applying your data modeling, engineering, and analysis skills to help future proof Pewlett HAckard.

- Language : SQL
- Software : ERD, PgAdmin 4 

# Resources
- department.csv
- dept_emp.csv
- dept_manager.csv
- employeee.csv
- salaries.csv
- titles.csv

# Data Set Results
- Retirement_grouped.csv
- Retiring_titles.csv
- Unique_titles.csv
- Mentorship_eligibilty.csv

# Retiring Titles

Create a Retirement Titles table that holds all the titles of employees who were born between January 1, 1952 and December 31, 1955.

![](Silver_tsunami/Visuals/Retirement%20Titles%20Code.png) ![](Silver_tsunami/Visuals/Retiring%20Titles%20Count.png)  

Using the DISTINCT ON statement to create a table that contains the most recent title of each employee.

![](Silver_tsunami/Visuals/Unique%20Title%20code.png)  ![](Silver_tsunami/Visuals/Unique%20Title.png) 

Using the COUNT() function to create a table that has the number of retirement-age employees by most recent job title and exclude employee no longer with the company

![](Silver_tsunami/Visuals/Retiring%20Titles%20Count%20code.png)  ![](Silver_tsunami/Visuals/Retiring%20Titles%20Count.png)

# Mentorship Eligibility

Create a mentorship-eligibility table that holds the current employees who were born between January 1, 1965 and December 31, 1965.

![](Silver_tsunami/Visuals/Mentor%20code.png) ![](Silver_tsunami/Visuals/Mentorship%20Eligibility.png)

# Silver Tsunami Analysis Summary

## How many roles will need to be filled as the "silver tsunami" begins to make an impact?

![](Silver_tsunami/Visuals/w%20silver%20tsunami%20code.png) ![](Silver_tsunami/Visuals/With%20silver%20tsunami.png)

To give us a bigger understanding on how much of an impact the silver tsunami will have. The table above shows the current amount of employeee's per title. 

- 25,916 Senior Engineers retirement elibile. 
- 24,926 Senior Staff retirement eligible.
- 9285 Engineer's retirement eligible.
- 7636 Staff retirement eligible.
- 3603 Technique Leader retirement eligible.
- 1090 Assistant Engineer retirement elibible
- 2 Manager retirement eligible.


## Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

![](Silver_tsunami/Visuals/Mentor%20count%20code.png)  ![](Silver_tsunami/Visuals/With%20silver%20tsunami.png)

Physical Count of the eligible mentors

- Utilizing COUNT() function to visually show the gap in mentorship eligible in descending order. 
- Data set is limited and more information on individual performance may increase mentorship eligibilty

## Results

- Retirement eligible will leave a huge gap in the company workforce.
- Perfect opportunity to get fresh set of employee with fresh ideas.
- Huge gap in retire eligible employee's vs mentorship eligibilty.
- Create a work culture to mentor more employee's to avoid the next "tsunami".