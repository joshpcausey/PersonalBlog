USE PersonalBlog
GO

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.Routines
	WHERE ROUTINE_NAME = 'TableSetup')
		DROP PROCEDURE TableSetup
GO

CREATE PROCEDURE TableSetup
AS
BEGIN

IF EXISTS(SELECT * FROM sys.tables WHERE Name='PostTags')
DROP TABLE PostTags

IF EXISTS(SELECT * FROM sys.tables WHERE Name='Tags')
DROP TABLE Tags

IF EXISTS(SELECT * FROM sys.tables WHERE Name='Posts')
DROP TABLE Posts

IF EXISTS(SELECT * FROM sys.tables WHERE Name='Categories')
DROP TABLE Categories

CREATE TABLE Categories(
CategoryId INT PRIMARY KEY IDENTITY,
CategoryName NVARCHAR(50) NOT NULL
)

CREATE TABLE Posts(
PostId INT PRIMARY KEY IDENTITY,
PostTitle NVARCHAR(100) NOT NULL,
PostBody NVARCHAR(MAX),
IsApproved BIT NOT NULL,
CreatedDate DATETIME2 DEFAULT (GETDATE()),
CategoryId INT FOREIGN KEY REFERENCES Categories(CategoryId),
ImageFileName NVARCHAR(100)
)

CREATE TABLE Tags(
TagId INT PRIMARY KEY IDENTITY,
TagName NVARCHAR(50) NOT NULL
)

CREATE TABLE PostTags(
PostId INT NOT NULL FOREIGN KEY REFERENCES Posts(PostId),
TagId INT FOREIGN KEY REFERENCES Tags(TagId),
PRIMARY KEY (PostId,TagId)
)
END
GO

EXEC dbo.TableSetup
GO