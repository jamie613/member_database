--�a�A�|���������
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

--�a�A�|��
INSERT INTO [HONOR]([MemberID])
	VALUES ('6')
INSERT INTO [HComp]([MemberID])
	VALUES ('6')

-------------------------------------------------
--���C�|���������
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

--���C�|��
INSERT INTO [Elder]([MemberID])
	VALUES ('30')
INSERT INTO [EComp]([MemberID])
	VALUES ('30')

-------------------------------------------------
--�����|���������
--1��83�A���F 6�B30�B73
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

--�����|��
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

--�����@���a�|��
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

--�����t���a�|��
INSERT INTO [FInst] ([MemberID], [Instrument])
	VALUES ('31', 'sax'), ('55', '��'), ('78', 'sax'), ('40', '�j��^'), ('47', '�j��'), ('37', '����'),
		   ('72', '����'), ('60', '�j��'), ('80', '����'), ('51', '�˲�'), ('39', '����'), ('1', '���^'),
		   ('24', '����'), ('44', '���־�'),  ('64', '��®��'), ('66', '��®��'), ('32', '�\�]'), ('50', '�\�]'),
		   ('5', '���^'), ('29', '���^'), ('42', '���^'), ('34', '����'), ('35', '����'), ('67', '����')

-------------------------------------------------
--�x�Ƭ������
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

--�x�Ʒ|��
INSERT INTO [Student]([MemberID])
	VALUES ('73')
INSERT INTO [SComp]([MemberID])
	VALUES ('73')

-------------------------------------------------
--�إߺt���a�|���W�檺view
CREATE VIEW Instrumentalist AS
	SELECT MemberID, Instrument FROM FInst
	UNION
	SELECT MemberID, Instrument FROM HInst
	UNION
	SELECT MemberID, Instrument FROM EInst
	UNION
	SELECT MemberID, Instrument FROM SInst

-------------------------------------------------
--�إߧ@���a�|���W�檺view
CREATE VIEW Composer AS
	SELECT MemberID FROM FComp
	UNION
	SELECT MemberID FROM HComp
	UNION
	SELECT MemberID FROM EComp
	UNION
	SELECT MemberID FROM SComp