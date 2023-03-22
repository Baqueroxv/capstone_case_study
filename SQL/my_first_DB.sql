*First we create our DataBase 
CREATE DATABASE [myDB]
*Then we indicate that we are going to use the recently created database 
USE [myDB]
*Now, is the time to create our tables

CREATE TABLE [artists] (
 	[id] int PRIMARY KEY,
 [name] nvarchar (max),
 [date_of_birth] date,
 	[title] nchar (10)
)

CREATE TABLE [work] (
[id] int PRIMARY KEY,
[name] nvarchar (max),
[description] nvarchar (max),
[link] nvarchar (max),
[artist_id] int FOREIGN KEY REFERENCES artists(id)
)

CREATE TABLE [reviewer](
[id] int PRIMARY KEY,
[name] nvarchar (max),
[date_of_birth] date,
[title] nchar (10)
)

CREATE TABLE [Reviews] (
[id] int PRIMARY KEY,
[comments] nvarchar (max),
[rating] int,
[review_id] int FOREIGN KEY REFERENCES reviewer(id)
[work_id] int FOREIGN KEY REFERENCES work(id)
)


*Now, we can populate our database. 
/* Inserting Artists*/
INSERT INTO [artists] VALUES (1,'John Jameson','1998-02-02','Guitarist ')
INSERT INTO [artists] VALUES (2,'Elton Green','1990-03-03','Pianist')
INSERT INTO [artists] VALUES (3,'Leonardo Richardson','1975-04-09','Painter')

/* Inserting Reviewers*/
INSERT INTO [reviewer] VALUES (1,'Marcus Delfoe','1996-03-07','Critic')
INSERT INTO [reviewer] VALUES (2,'Henry Almanc','1989-06-09','Critic')
INSERT INTO [reviewer] VALUES (3,'Frank Wenshov','1974-01-10','Editor')

/* Inserting Artist's Works*/
INSERT INTO [work] VALUES (1,'Guitar Solo','A guitar solo in D minor scale','https://theLink.com',1) /* The last attribute is the id of the artist in this case James Jameson */
INSERT INTO [work] VALUES (2,'Fur Elise','Cover of Fur Elise by Beethoven','https://theLink.com',2)
INSERT INTO [work] VALUES (3,'My Life','A painting that depicts my life','https://theLink.com',3)
INSERT INTO [work] VALUES (4,'Guitar Solo 2','A guitar solo in C major scale','https://theLink.com',1)

/* Inserting Reviews*/
INSERT INTO [Review] VALUES (1,'Very Good',9,1,1)
INSERT INTO [Review] VALUES (2,'Good',7,2,2)
INSERT INTO [Review] VALUES (3,'Good',7,3,2)
INSERT INTO [Review] VALUES (4,'Terrible',1,3,4)
