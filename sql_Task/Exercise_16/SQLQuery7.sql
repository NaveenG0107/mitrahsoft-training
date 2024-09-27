USE taskOne 
GO

CREATE TABLE projBackup(
ProjectID int,
ProjectName varchar(50),
StartDate date,
EndDate date,
Budget decimal(8,2),
[Status] varchar(30),
UpdateDate datetime,);
Go

CREATE  TRIGGER trg_UpdateProjectStatus
ON Project
AFTER UPDATE
AS
BEGIN

if update(EndDate)
BEGIN
INSERT INTO  projBackup(ProjectID,ProjectName,StartDate,EndDate,Budget,[status],UpdateDate)
select ProjectID,ProjectName,StartDate,EndDate,Budget,'completed',CURRENT_TIMESTAMP FROM INSERTED;
END;
End;
GO
UPDATE  Project SET EndDate='2024/08/23' WHERE ProjectId=3;
GO

SELECT * FROM projBackup;
GO

CREATE TABLE TaskAudit(
TaskID int,
TaskName varchar(50),
[Description] varchar(150) ,
StartDate date,
DueDate date,
[Priority] varchar(20),
[Status] varchar(20),
ProjectID int,
UpdateDate datetime,
[Action] varchar(20));
GO

CREATE TRIGGER trg_AuditTaskChanges
ON Task
AFTER UPDATE,INSERT,DELETE
AS
DECLARE @Action varchar(20)
BEGIN
SET @Action = (CASE WHEN EXISTS(SELECT * FROM INSERTED)
                         AND EXISTS(SELECT * FROM DELETED)
                        THEN 'U'  
                        WHEN EXISTS(SELECT * FROM INSERTED)
                        THEN 'I' 
                        WHEN EXISTS(SELECT * FROM DELETED)
                        THEN 'D' 
                    END)

IF (@Action='U')
BEGIN
INSERT INTO TaskAudit(TaskID, TaskName, [Description], StartDate, DueDate, [Priority], [Status], ProjectID, UpdateDate, [Action])
SELECT TaskID,Taskname, [Description], StartDate, DueDate, [Priority], [Status], ProjectID, CURRENT_TIMESTAMP, 'UPDATED' FROM DELETED;
END;

ELSE
	IF(@Action='I')
	BEGIN
	INSERT INTO TaskAudit(TaskID, TaskName, [Description], StartDate, DueDate, [Priority], [Status], ProjectID, UpdateDate, [Action])
	SELECT TaskID,Taskname, [Description], StartDate, DueDate, [Priority], [Status], ProjectID, CURRENT_TIMESTAMP, 'INSERTED' FROM INSERTED;
	END;
	ELSE
	BEGIN
	INSERT INTO TaskAudit(TaskID, TaskName, [Description], StartDate, DueDate, [Priority], [Status], ProjectID, UpdateDate, [Action])
	SELECT TaskID,Taskname, [Description], StartDate, DueDate, [Priority], [Status], ProjectID, CURRENT_TIMESTAMP, 'DELETED' FROM DELETED;
	END;
END;
GO

UPDATE  TASK SET PRIORITY='MEDIUM' WHERE taSKID=2
GO 

INSERT INTO Task(TaskName, Description, StartDate, DueDate, Priority, Status, ProjectID) values
    ('Initial DesignNN', 'Design phase for the new website', '2024-01-02', '2024-02-28', 'High', 'Completed', 1)
GO

DELETE FROM TASK WHERE TASKID=12;
GO

SELECT * FROM TaskAudit;

SELECT * FROM TASK