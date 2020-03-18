/* ================================================
 Template generated from Template Explorer using:
 Create Procedure (New Menu).SQL

 Use the Specify Values for Template Parameters 
 command (Ctrl-Shift-M) to fill in the parameter 
 values below.

 This block of comments will not be included in
 the definition of the procedure.
 ================================================*/
SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
/* =============================================
 Author:		  Harsh Patel
 Create date: 04-03-2020
 Description:	Text template parser sample.
 =============================================*/
CREATE PROCEDURE usp_GetParsedTemplate
(
								 @textCode   NVARCHAR(10)
							 , @countryId  INT
							 , @activityId INT
)
/* EXEC usp_GetParsedTemplate 
		 @textCode = 'TEST'
	 , @countryId = 1
	 , @activityId = 2; */
AS
BEGIN
	/* SET NOCOUNT ON added to prevent extra result sets from
	 interfering with SELECT statements.*/
	SET NOCOUNT ON;
	DECLARE @textTemplate NVARCHAR(4000) = '';

	/* Select Text Template Starts */
	SELECT 
				 @textTemplate = tt.Text
	FROM   dbo.TextTemplate AS tt
	WHERE  tt.Code = @textCode;
	PRINT @textTemplate;
	/* Select Text Template Ends */

	/* Select data to parse in Template Starts */
	DECLARE @tmpDataTable TABLE
	(
															ActivityName NVARCHAR(50)
														, CountryName  NVARCHAR(50)
														, CountryCode  NVARCHAR(10)
	);

	INSERT INTO @tmpDataTable
	(
				 ActivityName
	)
				 SELECT 
								act.Name AS ActivityName
				 FROM   dbo.ActivityTypes AS act
				 WHERE  act.Id = @activityId;

	UPDATE @tmpDataTable
	SET    
			CountryName = cn.Name
		, CountryCode = cn.CountryCode
	FROM   dbo.Countries AS cn
	WHERE  
				cn.Id = @countryId;
	/* Select data to parse in Template Ends */

	/* Parsing data into text template using JSON */
	DECLARE @json NVARCHAR(MAX) =
	(
		SELECT 
					 ActivityName
				 , CountryName
				 , CountryCode
		FROM   @tmpDataTable FOR JSON AUTO, INCLUDE_NULL_VALUES
	);
	PRINT @json;

	SELECT 
				 @json = JSON_QUERY(@json, '$[0]');
	PRINT @json;

	DECLARE @tmpJsonValues TABLE
	(
															 columnkey   NVARCHAR(400)
														 , columnvalue NVARCHAR(400)
														 , columnType  INT
	);

	INSERT INTO @tmpJsonValues
	(
				 columnKey
			 , columnValue
	/*, columnType*/
	)
				 SELECT 
								jsonData.[key]
							, jsonData.[value]
				 /*, jsonData.type*/
				 FROM   OPENJSON(@json) AS jsonData;

	SELECT 
				 @textTemplate = REPLACE(@textTemplate, '#{' + columnkey + '}#', ISNULL(columnvalue, ''))
	FROM   @tmpJsonValues
	ORDER BY 
					 columnkey;

	SELECT 
				 @textTemplate AS ParsedText;
END;
GO