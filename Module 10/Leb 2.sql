alter FUNCTION dbo.IntegerListToTable
( @InputList nvarchar(MAX),@Delimiter nchar(1) = ',')
RETURNS @OutputTable TABLE (PositionInList int IDENTITY(1, 1) NOT NULL,IntegerValue int)
AS BEGIN
		INSERT INTO @OutputTable (IntegerValue)
		SELECT Value FROM STRING_SPLIT ( @InputList , @Delimiter );
	RETURN;
END;


SELECT * FROM 
dbo.IntegerListToTable('234|354253|3242|2','|');