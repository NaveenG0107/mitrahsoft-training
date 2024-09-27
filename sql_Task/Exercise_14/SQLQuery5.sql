CREATE DATABASE temporaryDb;
GO
USE temporaryDb;
GO
DROP TABLE IF EXISTS  #LocalTempTable
GO
CREATE TABLE  #LocalTempTable(
ID int IDENTITY(1,1),
[Name] nvarchar(100),
StartDate date,
[Priority] nvarchar(20)
);
GO
INSERT INTO  #LocalTempTable([Name],StartDate,[Priority]) values
('Arun','2024-08-15','Low'),
('vinoth','2024-05-05','Low'),
('rajesh','2024-03-02','Low'),
('Kiran','2024-07-23','Low');
GO
SELECT * FROM  #LocalTempTable;
GO


DROP TABLE IF EXISTS ##GlobalTempTable
GO
CREATE TABLE ##GlobalTempTable(
ID int IDENTITY(1,1),
ProjectName varchar(100),
Budget decimal(18,2),
[Priority] nvarchar(20) 
);
GO
INSERT INTO ##GlobalTempTable(ProjectName,Budget,[Priority]) values
('Health Care',250000.00,'Medium'),
('Music community',220000.00,'Medium'),
('Advance AI',180000.00,'Medium'),
('Animaion',320000.00,'Medium')
GO
SELECT * FROM ##GlobalTempTable
GO


DECLARE @TableVariable TABLE (
iD int IDENTITY(1,1),
TaskName nvarchar(100),
DueDate date,
[Priority] nvarchar(20)
);

INSERT INTO  @TableVariable(TaskName,DueDate,[Priority]) values
('Temptable','2024-03-14','High'),
('Global temptable','2024-11-23','High'),
('Table variable','2024-07-03','High'),+-
('Stored Proc','2024-12-12','High');

SELECT * FROM @TableVariable

