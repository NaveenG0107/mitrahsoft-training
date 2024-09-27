ALTER TABLE PROJECT ADD COLUMN  Description varchar(100) NOT NULL DEFAULT ''

ALTER TABLE Project RENAME COLUMN Description to ProjectDescription 

ALTER TABLE Project ALTER COLUMN ProjectDescription DROP NOT NULL

SELECT * FROM Project