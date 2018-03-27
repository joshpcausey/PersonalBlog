USE PersonalBlog
GO

IF EXISTS(SELECT * FROM sys.tables WHERE Name='Categories')
DROP TABLE Categories
GO

IF EXISTS(SELECT * FROM sys.tables WHERE Name='Posts')
DROP TABLE Posts
GO

IF EXISTS(SELECT * FROM sys.tables WHERE Name='Tags')
DROP TABLE Tags
GO

IF EXISTS(SELECT * FROM sys.tables WHERE Name='PostTags')
DROP TABLE PostTags
GO

IF EXISTS(SELECT * FROM sys.tables WHERE Name='Images')
DROP TABLE Images
GO

IF EXISTS(SELECT * FROM sys.tables WHERE Name='PostImages')
DROP TABLE PostImages
GO

CREATE TABLE Categories(
CategoryId INT PRIMARY KEY IDENTITY,
CategoryName NVARCHAR(50) NOT NULL
)
GO

CREATE TABLE Posts(
PostId INT PRIMARY KEY IDENTITY,
PostTitle NVARCHAR(100) NOT NULL,
PostBody NVARCHAR,
IsApproved BIT NOT NULL,
CreatedDate DATETIME2 DEFAULT (GETDATE()),
CategoryId INT FOREIGN KEY REFERENCES Categories(CategoryId)
)
GO

CREATE TABLE Tags(
TagId INT PRIMARY KEY IDENTITY,
TagName NVARCHAR(50) NOT NULL
)
GO

CREATE TABLE PostTags(
PostId INT NOT NULL FOREIGN KEY REFERENCES Posts(PostId),
TagId INT FOREIGN KEY REFERENCES Tags(TagId),
PRIMARY KEY (PostId,TagId)
)
GO

CREATE TABLE Images(
ImageId INT PRIMARY KEY IDENTITY,
PostId INT FOREIGN KEY REFERENCES Posts(PostId),
ImagePath NVARCHAR(300) NOT NULL
)
GO