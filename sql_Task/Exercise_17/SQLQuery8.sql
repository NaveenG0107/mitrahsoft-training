USE taskOne
GO

CREATE VIEW vw_ActiveProjects
AS
SELECT ProjectId,ProjectName 
FROM Project WHERE EndDate IS NULL;
GO
SELECT * FROM vw_ActiveProjects;
GO

CREATE VIEW vw_HighPriorityTasks
AS
SELECT TaskID, TaskName, [Priority] 
FROM Task WHERE Priority = 'HIGH';
GO
SELECT * FROM vw_HighPriorityTasks
GO

UPDATE PROJECT SET EndDate = null WHERE ProjectID=3
GO

DECLARE @pid int, @pname varchar(50), @edate date

DECLARE cr_activeTask CURSOR FOR
SELECT ProjectID, ProjectName, EndDate FROM Project 

OPEN cr_activeTask

FETCH NEXT FROM cr_activeTask
INTO @pid, @pname, @edate

WHILE @@FETCH_STATUS = 0
BEGIN
IF(@edate is null)
BEGIN
PRINT ' '+ CAST(@Pid as varchar(5))+ ' '+ CAST(@Pname as varchar(50)) 
END

FETCH NEXT FROM cr_activeTask
INTO @pid, @pname, @edate
END

CLOSE cr_activeTask

DEALLOCATE cr_activeTask
GO


DECLARE @tid int, @tname varchar(50), @des varchar(150), @sDate date, @eDate date, @priority varchar(20), @status varchar(20), @pid int

DECLARE cr_OverDUeTask cursor FOR
SELECT * from Task

OPEN cr_OverDUeTask

FETCH NEXT FROM cr_OverDUeTask
INTO @tid, @tname, @des, @sDate, @eDate, @priority, @status, @pid

WHILE @@FETCH_STATUS = 0
BEGIN 
IF(GETDATE()>@eDate)
BEGIN
SET @STATUS='OverDue';
END

PRINT ' '+CAST(@tid as varchar(5)) + ' '+CAST(@tname as varchar(20)) + ' '+CAST(@des as varchar(50)) + ' '+CAST(@sDate as varchar(20)) + ' '+CAST(@eDate as varchar(20)) + ' '+CAST(@priority as varchar(20)) + ' '+CAST(@Status as varchar(20)) + ' '+CAST(@pid as varchar(5))

FETCH NEXT FROM cr_OverDUeTask
INTO  @tid, @tname, @des, @sDate, @eDate, @priority, @status, @pid

END

CLOSE cr_OverDUeTask

DEALLOCATE cr_OverDUeTask
GO
