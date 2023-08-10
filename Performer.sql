--演出人員
CREATE TABLE [dbo].[Performer](
	[PerformerID] [int] Primary Key)

--會員演奏者
CREATE TABLE [dbo].[MPerformer](
	[PerformerID] [int] Primary Key,
	[MemberID] [int],
CONSTRAINT MPerformer_PerformerID_FK
	FOREIGN KEY ([PerformerID]) REFERENCES [Performer],
CONSTRAINT MPerformer_MemberID_FK
	FOREIGN KEY ([MemberID]) REFERENCES [Member],
CONSTRAINT MPerformer_MemberID_Unique UNIQUE (MemberID))

--非會員演奏者
CREATE TABLE [dbo].[NPerformer](
	[PerformerID] [int] Primary Key,
	[LName] [nvarchar] (50) NOT NULL,
	[FName] [nvarchar] (50) NOT NULL,
	[Instrument] [nvarchar] (10) NOT NULL,
	[Phone] [nvarchar] (30),
	[Email] [nvarchar] (50),
	[Zip] [nvarchar] (6),
	[City] [nvarchar] (3),
	[Dist] [nvarchar] (5),
	[Street] [nvarchar] (50),
CONSTRAINT NPerformer_PerformerID_FK
	FOREIGN KEY ([PerformerID]) REFERENCES [Performer])

--Performer_List
CREATE TABLE [dbo].[Performer_List](
	[PerListID] [int] IDENTITY Primary Key,
	[ConcertID] [int],
	[CompID] [int],
	[PerformerID] [int],
CONSTRAINT Performer_List_CompID_FK
	FOREIGN KEY ([CompID]) REFERENCES [Composition],
CONSTRAINT Performer_List_ConcertID_FK
	FOREIGN KEY ([ConcertID]) REFERENCES [Concert],
CONSTRAINT Performer_List_PerformerID_FK
	FOREIGN KEY ([PerformerID]) REFERENCES [Performer])

--2019年TINMF 單簧篇演出者
INSERT INTO [Performer] ([PerformerID])	
	VALUES(1) --顧鈞豪
INSERT INTO [MPerformer] ([PerformerID], [MemberID])
	VALUES (1, 31)
INSERT INTO [Performer] ([PerformerID])	
	VALUES(2)
INSERT INTO [NPerformer] ([PerformerID], [LName], [FName], [Instrument])
	VALUES (2, '陳', '怡安', '鋼琴')
INSERT INTO [Performer] ([PerformerID])	
	VALUES(3) --高承胤
INSERT INTO [MPerformer] ([PerformerID], [MemberID])
	VALUES (3, 66)
INSERT INTO [Performer] ([PerformerID])	
	VALUES(4)
INSERT INTO [NPerformer] ([PerformerID], [LName], [FName], [Instrument])
	VALUES (4, '翁', '重華', '鋼琴')

--Bruno Mantovani (1974): L’incandescence de la bruine pour saxophone soprano et piano (1997)
INSERT INTO [Performer_List] ([ConcertID], [CompID], [PerformerID])
	VALUES (1, 1, 1), (1, 1, 2)
--Alban Berg (1885-1935): 4 Stücke for clarinet and piano, Op. 5 (1913)
INSERT INTO [Performer_List] ([ConcertID], [CompID], [PerformerID])
	VALUES (1, 2, 3), (1, 2, 4)
--許德彰：《暗夜裡的52枝火柴》為中音薩克管 （2012，臺灣首演）
INSERT INTO [Performer_List] ([ConcertID], [CompID], [PerformerID])
	VALUES (1, 3, 1)
--邱妍甯：《萬花競放》為中音薩克管獨奏（2019，世界首演）
INSERT INTO [Performer_List] ([ConcertID], [CompID], [PerformerID])
	VALUES (1, 4, 1)
--劉韋志：《紋I：星芒的剪影》為單簧管與鋼琴 (2011)
INSERT INTO [Performer_List] ([ConcertID], [CompID], [PerformerID])
	VALUES (1, 5, 3), (1, 5, 4)
--Isang Yun (1917-1995): Monolog for bass clarinet (1983)
INSERT INTO [Performer_List] ([ConcertID], [CompID], [PerformerID])
	VALUES (1, 6, 3)
--董昭民：《于喁》為豎笛和即時電聲 (2001)
INSERT INTO [Performer_List] ([ConcertID], [CompID], [PerformerID])
	VALUES (1, 7, 3)
--李元貞：《告》為中音薩克管獨奏 （2018，臺灣首演）
INSERT INTO [Performer_List] ([ConcertID], [CompID], [PerformerID])
	VALUES (1, 8, 1)
--陳立立：Be Flower, Be Water，為低音單簧管獨奏（2019，世界首演）
INSERT INTO [Performer_List] ([ConcertID], [CompID], [PerformerID])
	VALUES (1, 9, 3)
--Roshanne Etezady (1973): Glint for clarinet and alto saxophone (2006)
INSERT INTO [Performer_List] ([ConcertID], [CompID], [PerformerID])
	VALUES (1, 10, 1), (1, 10, 3)

-------------------------------------------------

--2019年TINMF 鋼琴篇演出者
INSERT INTO [Performer] ([PerformerID])	
	VALUES(5) --林桂如
INSERT INTO [MPerformer] ([PerformerID], [MemberID])
	VALUES (5, 20)
INSERT INTO [Performer] ([PerformerID])	
	VALUES(6) --陳宜貞
INSERT INTO [MPerformer] ([PerformerID], [MemberID])
	VALUES (6, 57)
INSERT INTO [Performer] ([PerformerID])	
	VALUES(7) --周久渝
INSERT INTO [MPerformer] ([PerformerID], [MemberID])
	VALUES (7, 58)
INSERT INTO [Performer] ([PerformerID])	
	VALUES(8) --邱浩源
INSERT INTO [MPerformer] ([PerformerID], [MemberID])
	VALUES (8, 61)

--Helmut Lachenmann (1935): Ein Kinderspiel / Child’s Play (1981)
INSERT INTO [Performer_List] ([ConcertID], [CompID], [PerformerID])
	VALUES (2, 11, 5)
--林桂如：《小星星幻想曲》 （2019，世界首演）
INSERT INTO [Performer_List] ([ConcertID], [CompID], [PerformerID])
	VALUES (2, 12, 5)
--周久渝：《流漾》 (2012)
INSERT INTO [Performer_List] ([ConcertID], [CompID], [PerformerID])
	VALUES (2, 13, 7)
--Alfred Schnittke (1934-1998): 5 Aphorisms for Piano, No. 1 Moderato Assai 
INSERT INTO [Performer_List] ([ConcertID], [CompID], [PerformerID])
	VALUES (2, 14, 6)
--Laurent Durupt (1978) : Interdite au mineur (2017)
INSERT INTO [Performer_List] ([ConcertID], [CompID], [PerformerID])
	VALUES (2, 15, 8)
--Richard Whalley (1974): Butterflies for solo piano (2012)
INSERT INTO [Performer_List] ([ConcertID], [CompID], [PerformerID])
	VALUES (2, 16, 7)
--陳宜貞：《迷離之鏡》 (2016)
INSERT INTO [Performer_List] ([ConcertID], [CompID], [PerformerID])
	VALUES (2, 17, 6)
--邱浩源：《說吧，海》 （2019，世界首演）
INSERT INTO [Performer_List] ([ConcertID], [CompID], [PerformerID])
	VALUES (2, 18, 8)