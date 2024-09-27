SELECT * FROM Task 
ORDER BY StartDate;

SELECT P.ProjectID, count(T.ProjectID) 
FROM Project P 
JOIN Task T ON P.ProjectID = T.ProjectID 
GROUP BY  P.ProjectId 
ORDER BY COUNT(T.PROJECTID) DESC;

SELECT P.ProjectID,COUNT(T.ProjectID),P.Budget 
FROM Project P 
JOIN Task T ON P.ProjectID = T.ProjectID 
GROUP BY P.ProjectID 
ORDER BY P.Budget;

SELECT * FROM Project 
WHERE Status='In Progress' AND Budget 
BETWEEN 10000 AND 50000;

SELECT * FROM Task 
WHERE StartDate 
BETWEEN '2024-01-01'AND '2024-12-31' AND Status='Completed';

SELECT * FROM Task 
WHERE DueDate>= DATE_TRUNC('month',CURRENT_DATE)+INTERVAL '1MONTH'
AND DueDate<=DATE_TRUNC('month',CURRENT_DATE) + INTERVAL '2MONTH' 
AND Status = 'Pending';

SELECT T.* FROM Task T 
JOIN Project P ON P.ProjectID = T.ProjectID 
WHERE P.ProjectName = 'Website Redesign' AND Priority = 'High';

SELECT ProjectID, ProjectName FROM Project P 
WHERE EXISTS(SELECT DueDate,Status FROM TASK T WHERE P.ProjectID = T.ProjectID AND Status !='Completed'AND DueDate<DATE_TRUNC('MONTH',CURRENT_DATE));

SELECT TaskID ,TaskName FROM Task 
WHERE ProjectID IN (SELECT ProjectID FROM Project WHERE StartDate IN(SELECT MAX(StartDate)FROM Project));

SELECT * FROM Project 
WHERE ProjectID IN(SELECT ProjectID FROM Task WHERE Priority='High'AND ProjectID IN (SELECT ProjectID FROM Task WHERE Priority='Low'));

SELECT * FROM Task
WHERE TaskName ILIKE 'Design%';

SELECT * FROM Task 
WHERE TaskName NOT ILIKE 'Pre%' AND TaskName ILIKE '%Review%';

SELECT * FROM Task 
WHERE TaskName similar to '%[a-mA-M]___';




