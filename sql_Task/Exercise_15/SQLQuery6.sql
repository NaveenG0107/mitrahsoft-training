USE taskOne
GO

CREATE PROCEDURE insertProc  @tName varchar(50), @Description varchar(150), @SDate date, @DDate date, @Priority varchar(20), @Status varchar(20), @PID int
AS
BEGIN
INSERT INTO Task(TaskName, [Description], StartDate, DueDate, [Priority], [Status], ProjectID) values
(@tName, @Description, @SDate, @DDate, @priority, @Status, @PID);
END
GO
EXEC insertProc @tName = 'Health care', @Description = 'Analyze the body helath', @SDate = '2024/03/20', @DDate = '2024/10/22', @priority = 'High', @Status = 'pending', @PID = 3;
GO


CREATE PROCEDURE updateProc @tID int
AS
BEGIN
UPDATE Task SET [Priority]='Low' WHERE TaskID= @tID;
END;
GO
EXEC updateProc @tID=12
GO


CREATE PROCEDURE selectproc @TaskID int
AS
select * from task where TaskID= @TaskID
GO
EXEC selectProc @TaskID=12
GO


CREATE PROCEDURE deleteProc @tID int
AS
BEGIN
DELETE FROM Task WHERE TaskID= @tID
END;
GO
EXEC deleteProc @tID=12
GO
SELECT * FROM Task;
GO


CREATE FUNCTION selectFunc(@TaskID int)
RETURNS TABLE
AS 
RETURN(SELECT * FROM Task WHERE TaskID = @TaskID);
GO
SELECT * FROM selectFunc(10)





