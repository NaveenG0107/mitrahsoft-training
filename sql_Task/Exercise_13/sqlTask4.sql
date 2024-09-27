SELECT T.TasKID,TaskName,P.* FROM Task T JOIN Project P ON T.ProjectID=P.ProjectID;

SELECT P.*, T.TaskID, T.TaskName FROM Project P LEFT JOIN Task T ON P.ProjectID=T.ProjectID;

SELECT T.*, P.ProjectID, P.ProjectName FROM Project P RIGHT JOIN Task T ON T.ProjectID=P.ProjectID ORDER  BY TaskID;

ALTER TABLE Project ADD COLUMN ParentProjectId int ;
UPDATE Project SET ParentProjectId=3 WHERE ProjectID=2;
UPDATE Project SET  ParentProjectId=1 WHERE ProjectID=3 ;
UPDATE Project SET  ParentProjectId=2 WHERE ProjectID=4;
SELECT C.ProjectID,C.ProjectName,P.ParentProjectId CHILDID FROM Project C INNER JOIN Project P ON C.ParentProjectID=P.ParentProjectID;

SELECT NOW();
SELECT CURRENT_TIMESTAMP;

SELECT EXTRACT(MONTH FROM EndDate) - EXTRACT(MONTH FROM StartDate) mmnthgap FROM project WHERE ProjectID=2;

SELECT EXTRACT(MONTH FROM StartDate), EXTRACT(MONTH FROM EndDate) FROM Project WHERE ProjectID=2;

SELECT PROJECTID, TO_CHAR(STARTDATE,'yyyy/MM/dd') FROM PROJECT;

SELECT P.ProjectID, P.ProjectName, T.* FROM Project P CROSS JOIN Task T;
