--榮譽會員相關表格
CREATE TABLE [dbo].[Honor](
	[MemberID] [int] Primary Key,
CONSTRAINT Honor_MemberID_FK
	FOREIGN KEY ([MemberID]) REFERENCES [Member],
CONSTRAINT Honor_MemberID_Unique UNIQUE (MemberID))

CREATE TABLE [dbo].[HComp](
	[MemberID] [int] Primary Key,
CONSTRAINT HComp_MemberID_FK
	FOREIGN KEY ([MemberID]) References [Member])

CREATE TABLE [dbo].[HInst](
	[MemberID] [int] Primary Key,
	[Instrument] [nvarchar] (20)
CONSTRAINT HInst_MemberID_FK
	FOREIGN KEY ([MemberID]) References [Member],
CONSTRAINT HInst_MemberID_Unique UNIQUE (MemberID))

--榮譽會員
INSERT INTO [HONOR]([MemberID])
	VALUES ('6')
INSERT INTO [HComp]([MemberID])
	VALUES ('6')

-------------------------------------------------
--長青會員相關表格
CREATE TABLE [dbo].[Elder](
	[MemberID] [int] Primary Key,
CONSTRAINT Elder_MemberID_FK
	FOREIGN KEY ([MemberID]) REFERENCES [Member],
CONSTRAINT Elder_MemberID_Unique UNIQUE (MemberID))

CREATE TABLE [dbo].[EComp](
	[MemberID] [int] Primary Key,
CONSTRAINT EComp_MemberID_FK
	FOREIGN KEY ([MemberID]) References [Member],
CONSTRAINT EComp_MemberID_Unique UNIQUE (MemberID))

CREATE TABLE [dbo].[EInst](
	[MemberID] [int] Primary Key,
	[Instrument] [nvarchar] (20)
CONSTRAINT EInst_MemberID_FK
	FOREIGN KEY ([MemberID]) References [Member],
CONSTRAINT EInst_MemberID_Unique UNIQUE (MemberID))

--長青會員
INSERT INTO [Elder]([MemberID])
	VALUES ('30')
INSERT INTO [EComp]([MemberID])
	VALUES ('30')

-------------------------------------------------
--正式會員相關表格
--1到83，除了 6、30、73
CREATE TABLE [dbo].[FullM](
	[MemberID] [int] Primary Key,
CONSTRAINT Full_MemberID_FK
	FOREIGN KEY ([MemberID]) REFERENCES [Member],
CONSTRAINT Full_MemberID_Unique UNIQUE (MemberID))

CREATE TABLE [dbo].[FComp](
	[MemberID] [int] Primary Key,
CONSTRAINT FComp_MemberID_FK
	FOREIGN KEY ([MemberID]) References [Member],
CONSTRAINT FComp_MemberID_Unique UNIQUE (MemberID))

CREATE TABLE [dbo].[FInst](
	[MemberID] [int] Primary Key,
	[Instrument] [nvarchar] (20)
CONSTRAINT FInst_MemberID_FK
	FOREIGN KEY ([MemberID]) References [Member],
CONSTRAINT FInst_MemberID_Unique UNIQUE (MemberID))

--正式會員
INSERT INTO [FullM]([MemberID])
	VALUES ('1'), ('2'), ('3'), ('4'), ('5'), ('7'), ('8'), ('9'),
		   ('10'), ('11'), ('12'), ('13'), ('14'), ('15'), ('16'), ('17'), ('18'), ('19'),
		   ('20'), ('21'), ('22'), ('23'), ('24'), ('25'), ('26'), ('27'), ('28'), ('29'),
		   ('31'), ('32'), ('33'), ('34'), ('35'), ('36'), ('37'), ('38'), ('39'),
		   ('40'), ('41'), ('42'), ('43'), ('44'), ('45'), ('46'), ('47'), ('48'), ('49'),
		   ('50'), ('51'), ('52'), ('53'), ('54'), ('55'), ('56'), ('57'), ('58'), ('59'),
		   ('60'), ('61'), ('62'), ('63'), ('64'), ('65'), ('66'), ('67'), ('68'), ('69'),
		   ('70'), ('71'), ('72'), ('74'), ('75'), ('76'), ('77'), ('78'), ('79'),
		   ('80'), ('81'), ('82'), ('83')

--正式作曲家會員
INSERT INTO [FComp] ([MemberID])
	VALUES ('1'), ('2'), ('3'), ('4'), ('7'), ('8'), ('9'),
		  ('10'), ('11'), ('12'), ('13'), ('14'), ('15'), ('16'), ('17'), ('18'), ('19'),
		  ('20'), ('21'), ('22'), ('23'), ('25'), ('26'), ('27'), ('28'),
		  ('33'), ('36'), ('38'), ('39'),
		  ('41'), ('43'), ('45'), ('46'), ('48'), ('49'),
		  ('51'), ('52'), ('53'), ('54'), ('55'), ('56'), ('57'), ('58'), ('59'),
		  ('60'), ('61'), ('62'), ('63'), ('65'), ('68'), ('69'),
		  ('70'), ('71'), ('74'), ('75'), ('76'), ('77'), ('79'),
		  ('80'), ('81'), ('82'), ('83') 

--正式演奏家會員
INSERT INTO [FInst] ([MemberID], [Instrument])
	VALUES ('31', 'sax'), ('55', '笙'), ('78', 'sax'), ('40', '大鍵琴'), ('47', '古箏'), ('37', '打擊'),
		   ('72', '打擊'), ('60', '古箏'), ('80', '打擊'), ('51', '竹笛'), ('39', '指揮'), ('1', '鋼琴'),
		   ('24', '長笛'), ('44', '音樂學'),  ('64', '單簧管'), ('66', '單簧管'), ('32', '琵琶'), ('50', '琵琶'),
		   ('5', '鋼琴'), ('29', '鋼琴'), ('42', '鋼琴'), ('34', '擊樂'), ('35', '擊樂'), ('67', '擊樂')

-------------------------------------------------
--儲備相關表格
CREATE TABLE [dbo].[Student](
	[MemberID] [int] Primary Key,
CONSTRAINT Student_MemberID_FK
	FOREIGN KEY ([MemberID]) REFERENCES [Member],
CONSTRAINT Student_MemberID_Unique UNIQUE (MemberID))

CREATE TABLE [dbo].[SComp](
	[MemberID] [int] Primary Key,
CONSTRAINT SComp_MemberID_FK
	FOREIGN KEY ([MemberID]) References [Member],
CONSTRAINT SComp_MemberID_Unique UNIQUE (MemberID))

CREATE TABLE [dbo].[SInst](
	[MemberID] [int] Primary Key,
	[Instrument] [nvarchar] (20)
CONSTRAINT SInst_MemberID_FK
	FOREIGN KEY ([MemberID]) References [Member],
CONSTRAINT SInst_MemberID_Unique UNIQUE (MemberID))

--儲備會員
INSERT INTO [Student]([MemberID])
	VALUES ('73')
INSERT INTO [SComp]([MemberID])
	VALUES ('73')

-------------------------------------------------
--建立演奏家會員名單的view
CREATE VIEW Instrumentalist AS
	SELECT MemberID, Instrument FROM FInst
	UNION
	SELECT MemberID, Instrument FROM HInst
	UNION
	SELECT MemberID, Instrument FROM EInst
	UNION
	SELECT MemberID, Instrument FROM SInst

-------------------------------------------------
--建立作曲家會員名單的view
CREATE VIEW Composer AS
	SELECT MemberID FROM FComp
	UNION
	SELECT MemberID FROM HComp
	UNION
	SELECT MemberID FROM EComp
	UNION
	SELECT MemberID FROM SComp