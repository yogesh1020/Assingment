-- Step B.

CREATE FUNCTION dbo.EndOfPreviousMonth (@DateToTest date)
RETURNS date
AS BEGIN
  RETURN DATEADD(day, 0 - DAY(@DateToTest), @DateToTest);
END;
GO

-- Step C.
SELECT dbo.EndOfPreviousMonth(SYSDATETIME());
SELECT dbo.EndOfPreviousMonth('2017-06-01');
GO

-- Step D. 
SELECT OBJECTPROPERTY(OBJECT_ID('dbo.EndOfPreviousMonth'),'IsDeterministic');
GO

 -- Step E. 
DROP FUNCTION dbo.EndOfPreviousMonth;
GO

-- Step F.
-- Step G. 
SELECT dbo.EndOfPreviousMonth(SYSDATETIME());
SELECT dbo.EndOfPreviousMonth('2018-03-01');
GO

-- Step H.

DROP FUNCTION dbo.EndOfPreviousMonth;
GO