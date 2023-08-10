--音樂會曲目
CREATE TABLE [dbo].[Program_List](
	[ProgListID] [int] IDENTITY Primary Key,
	[ConcertID] [int],
	[CompID] [int],
CONSTRAINT Program_List_ComcertID_FK
	FOREIGN KEY ([ConcertID]) REFERENCES [Concert],
CONSTRAINT Program_List_CompID_FK
	FOREIGN KEY ([CompID]) REFERENCES [Composition])

--2019年TINMF 單簧篇作品
INSERT INTO [Program_List] ([ConcertID], [CompID])
	VALUES (1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7), (1, 8), (1, 9), (1, 10)

--2019年TINMF 鋼琴篇作品
INSERT INTO [Program_List] ([ConcertID], [CompID])
	VALUES (2, 11), (2, 12), (2, 13), (2, 14), (2, 15), (2, 16), (2, 17), (2, 18)

--2020年TINMF 擊樂場演出作品
INSERT INTO [Program_List] ([ConcertID], [CompID])
	VALUES (4, 19), (4, 20), (4, 21), (4, 22), (4, 23), (4, 24)

--2020年TINMF 室內樂場演出作品
INSERT INTO [Program_List] ([ConcertID], [CompID])
	VALUES (5, 25), (5, 26), (5, 27), (5, 28), (5, 29), (5, 30)