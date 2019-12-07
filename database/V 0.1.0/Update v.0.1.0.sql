CREATE TABLE [dbo].[tbl_Version](
	[versionMayor] [int] NOT NULL,
	[versionMenor] [int] NOT NULL,
	[patch] [int] NOT NULL
) ON [PRIMARY]

GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_VERSION_GetVersion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_VERSION_GetVersion]
GO


-- =============================================
-- Author:		Flavia Veizaga 
-- Create date: 2019-12-04
-- Description:	Obtiene informacion de la version de la base de datos
-- =============================================
CREATE PROCEDURE [dbo].[usp_VERSION_GetVersion]
	@intVersionMayor	INT OUTPUT,
	@intVersionMenor	INT OUTPUT,
	@intPatch			INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

    SELECT TOP 1
		@intVersionMayor = [versionMayor],
		@intVersionMenor = [versionMenor],
		@intPatch = [patch]
    FROM [dbo].[tbl_Version]
    
    
END

GO

DELETE FROM [dbo].[tbl_Version]
GO

INSERT INTO [dbo].[tbl_Version]
           ([versionMayor]
           ,[versionMenor]
           ,[patch])
     VALUES
           (0
           ,1
           ,0)
GO