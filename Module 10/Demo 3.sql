
-- Step A.

USE master;
GO

-- Step B. 

CREATE LOGIN TestContext 
  WITH PASSWORD = 'P@ssw0rd',
       CHECK_POLICY = OFF;
GO

-- Step C.
USE AdventureWorks;
GO

CREATE USER TestContext FOR LOGIN TestContext;
GO

-- Step D.
CREATE FUNCTION dbo.CheckContext()
RETURNS TABLE
AS
RETURN ( SELECT * FROM sys.user_token
       );
GO

SELECT * FROM dbo.CheckContext();
GO

-- Step E.
ALTER FUNCTION dbo.CheckContext()
RETURNS TABLE
WITH EXECUTE AS 'TestContext'
AS
RETURN ( SELECT * FROM sys.user_token
       );
GO

-- Step F
DROP FUNCTION dbo.CheckContext;
GO

CREATE FUNCTION dbo.CheckContext()
RETURNS @UserTokenList TABLE (principal_id int, 
                              sid varbinary(85), 
                              type nvarchar(128), 
                              usage nvarchar(128),
                              name nvarchar(128))
WITH EXECUTE AS 'TestContext'
AS BEGIN
  INSERT @UserTokenList 
    SELECT principal_id,
           sid,
           type,
           usage,
           name 
    FROM sys.user_token;
  RETURN 
END;
GO

-- Step G.
SELECT * FROM dbo.CheckContext();
GO

-- Step H.
DROP FUNCTION dbo.CheckContext;
GO
DROP USER TestContext;
GO
DROP LOGIN TestContext;
GO
