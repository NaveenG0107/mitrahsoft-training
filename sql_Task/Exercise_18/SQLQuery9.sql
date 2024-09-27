USE taskOne
GO

BEGIN TRY
	BEGIN TRANSACTION tr_insertTran
	INSERT INTO Project (ProjectName, StartDate, EndDate, Budget, Status)VALUES 
    ('AI Research', '2024-02-01', '2024-09-12', 18000.00, 'In Progress');
	INSERT INTO Task(TaskName, Description, StartDate, DueDate, Priority, Status, ProjectID) VALUES
    ('Design', 'Design phase for the website', '2024-02-02', '2024-03-29', 'High', 'Completed', 5),
    ('Review', 'Review and submission of the annual report', '2024-05-05', '2024-06-16', 'Medium', 'In Progress', 5)
	COMMIT TRANSACTION tr_insertTran
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	SELECT ERROR_LINE() AS Line, ERROR_MESSAGE() AS ERRORMESSAGE
END CATCH
GO

SELECT * FROM Project
GO
SELECT * FROM Task

BEGIN TRY
	BEGIN TRANSACTION tr_UpdateTran
	UPDATE Project SET Budget =10000 WHERE ProjectID=4
	update Task SET Priority='Medium' WHERE ProjectID=4
	COMMIT TRANSACTION
END TRY 
BEGIN CATCH
	ROLLBACK TRANSACTION 
	SELECT ERROR_LINE() AS Line,  ERROR_MESSAGE() AS ErrorMessage
END CATCH
GO


CREATE PROCEDURE tr_procInsert  @tName varchar(50), @Description varchar(150), @SDate date, @DDate date, @Priority varchar(20), @Status varchar(20), @PID int
AS
BEGIN
INSERT INTO Task(TaskName, [Description], StartDate, DueDate, [Priority], [Status], ProjectID) values
(@tName, @Description, @SDate, @DDate, @priority, @Status, @PID);
END
GO

BEGIN TRY
	BEGIN TRANSACTION tr_ProcIns
	EXEC tr_procInsert 
	@tName = 'Analysis', 
	@Description ='Analysis phase for the new website', 
	@SDate = '2024-01-02', 
	@DDate = '2024-04-01', 
	@priority = 'High', 
	@Status = 'In Progress',
	@PID = 4;
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	SELECT ERROR_LINE() AS LINE, ERROR_PROCEDURE() AS ERR_PROCEDURE, ERROR_MESSAGE() AS ERR_MESSAGE
END CATCH
GO

SELECT * FROM Project
GO
SELECT * FROM Task

CREATE PROCEDURE tr_procUpdate @tID int
AS
BEGIN
UPDATE Task SET [Priority]='Low' WHERE TaskID= @tID;
END;
GO

BEGIN TRY
	BEGIN TRANSACTION tr_procUpd
	EXEC tr_procUpdate @tID=11
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	SELECT ERROR_LINE() AS LINE, ERROR_PROCEDURE() AS ERR_PROCEDURE, ERROR_MESSAGE() AS ERR_MESSAGE
	ROLLBACK TRANSACTION	
END CATCH
GO


CREATE PROCEDURE tr_procSelect @TaskID int
AS
select * from task where TaskID= @TaskID
GO

BEGIN TRY
	BEGIN TRANSACTION tr_ProcSel
	EXEC tr_procSelect @taskID=11
	COMMIT TRANSACTION 
END TRY
BEGIN CATCH
	SELECT ERROR_LINE() AS LINE, ERROR_PROCEDURE() AS ERR_PROCEDURE, ERROR_MESSAGE() AS ERR_MESSAGE
	ROLLBACK TRANSACTION 
END CATCH
GO


CREATE PROCEDURE tr_procDelete 
AS 
DELETE FROM Task WHERE Taskid=11;
GO

BEGIN TRY
	BEGIN TRANSACTION tr_ProcDel
	EXEC tr_procDelete 
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	SELECT ERROR_LINE() AS LINE, ERROR_PROCEDURE() AS ERR_PROCEDURE, ERROR_MESSAGE() AS ERR_MESSAGE
	ROLLBACK TRANSACTION
END CATCH
GO	

SELECT * FROM TASK
GO
SELECT * FROM PROJECT