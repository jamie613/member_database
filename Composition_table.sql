--樂曲資料
CREATE TABLE [dbo].[Composition](
	[CompID] [int] IDENTITY Primary Key,
	[CTitle] [nvarchar] (50) NOT NULL,
	[OTitle] [nvarchar] (100),
	[Instrumentation] [nvarchar] (50),
	[Duration] [nvarchar] (10),
	[CompYear] [int] --如果修改過 (xxxx/xxxx) 以最初創作年建檔
)

--會員作品資料
CREATE TABLE [dbo].[MComposition](
	[CompID] [int],
	[MemberID] [int],
	[CommissionYear] [int], --為哪一年的演出而委託
CONSTRAINT MComposition_CompID_FK
	FOREIGN KEY ([CompID]) References [Composition],
CONSTRAINT MComposition_MemberID_FK
	FOREIGN KEY ([MemberID]) References [Member])

--非會員作品資料
CREATE TABLE [dbo].[NComposition](
	[CompID] [int],
	[LName_1] [nvarchar] (50) NOT NULL,
	[FName_1] [nvarchar] (50) NOT NULL,
	[LName_2] [nvarchar] (50),
	[FName_2] [nvarchar] (50),
CONSTRAINT NComposition_CompID_FK
	FOREIGN KEY ([CompID]) References [Composition])

-------------------------------------------------

--2019年TINMF 單簧篇作品
--Bruno Mantovani (1974) : L’incandescence de la bruine pour saxophone soprano et piano (1997)
INSERT INTO [Composition] ([CTitle], [OTitle], [Instrumentation], [CompYear])
	VALUES ('《細雨之熾》為高音薩克管與鋼琴', 'L’incandescence de la bruine pour saxophone soprano et piano', 'Sax, Piano', '1997')
INSERT INTO [NComposition] ([CompID], [LName_1], [FName_1], [LName_2])
	VALUES ('1', 'Mantovani', 'Bruno', '曼托望尼')

--Alban Berg (1885-1935): 4 Stücke for clarinet and piano, Op. 5 (1913)
INSERT INTO [Composition] ([CTitle], [OTitle], [Instrumentation], [CompYear])
	VALUES ('四首小品，為單簧管與鋼琴，作品五', '4 Stücke for clarinet and piano, Op. 5', 'Clarinet, Piano', '1913')
INSERT INTO [NComposition] ([CompID], [LName_1], [FName_1], [LName_2])
	VALUES ('2', 'Berg', 'Alban', '貝爾格')

--許德彰 (1983) : 52 Matches in the Dark for alto sax (2011)*
INSERT INTO [Composition] ([CTitle], [OTitle], [Instrumentation], [CompYear])
	VALUES ('《暗夜裡的52枝火柴》為中音薩克管', '52 Matches in the Dark for alto sax', 'Sax', '2011')
INSERT INTO [NComposition] ([CompID], [LName_1], [FName_1], [LName_2], [FName_2])
	VALUES ('3', '許', '德彰', 'Hui', 'Tak-Cheung')

--邱妍甯 (1988)：萬花競放（委託創作，世界首演）*
INSERT INTO [Composition] ([CTitle], [OTitle], [Instrumentation], [CompYear])
	VALUES ('《萬花競放》為中音薩克管獨奏', 'Eternal for alto saxophone solo', 'Sax', '2019')
INSERT INTO [MComposition] ([CompID], [MemberID], [CommissionYear])
	VALUES ('4', '49', '2019')

--劉韋志：《紋I：星芒的剪影》為單簧管與鋼琴 (2011)
INSERT INTO [Composition] ([CTitle], [OTitle], [Instrumentation], [CompYear])
	VALUES ('《紋I：星芒的剪影》為單簧管與鋼琴', 'Veins I : Silhouette of Asterism for clarinet and piano', 'Clarinet, Piano', '2011')
INSERT INTO [NComposition] ([CompID], [LName_1], [FName_1])
	VALUES ('5', '劉', '韋志')

--Isang Yun (1917-1995): Monolog for bass clarinet (1983)
INSERT INTO [Composition] ([CTitle], [OTitle], [Instrumentation], [CompYear])
	VALUES ('《獨白》為低音單簧管而作', 'Monolog for bass clarinet', 'Clarinet', '1983')
INSERT INTO [NComposition] ([CompID], [LName_1], [FName_1], [LName_2], [FName_2])
	VALUES ('6', 'Yun', 'Isang', '尹', '伊桑')

--董昭民：《于喁》為豎笛和即時電聲 (2001)
INSERT INTO [Composition] ([CTitle], [Instrumentation], [CompYear])
	VALUES ('《于喁》為豎笛和即時電聲', 'Clarinet', '2001')
INSERT INTO [MComposition] ([CompID], [MemberID])
	VALUES ('7', '3')

--李元貞：《告》為中音薩克管獨奏 （2018，臺灣首演）
INSERT INTO [Composition] ([CTitle], [OTitle], [Instrumentation], [CompYear])
	VALUES ('《告》為中音薩克管獨奏', 'Tell for solo alto saxophone', 'Sax', '2018')
INSERT INTO [NComposition] ([CompID], [LName_1], [FName_1])
	VALUES ('8', '李', '元貞 ')

--陳立立：Be Flower, Be Water，為低音單簧管獨奏（2019，世界首演）
INSERT INTO [Composition] ([CTitle], [OTitle], [Instrumentation], [CompYear])
	VALUES ('Be Flower, Be Water，為低音單簧管獨奏', 'Be Flower, Be Water for solo bass clarinet', 'Clarinet', '2019')
INSERT INTO [MComposition] ([CompID], [MemberID], [CommissionYear])
	VALUES ('9', '15', '2019')

--Roshanne Etezady (1973): Glint for clarinet and alto saxophone (2006)
INSERT INTO [Composition] ([CTitle], [OTitle], [Instrumentation], [CompYear])
	VALUES ('閃爍給單簧管與中音薩克管', ' Glint for clarinet and alto saxophone', 'Sax, Clarinet', '2006')
INSERT INTO [NComposition] ([CompID], [LName_1], [FName_1], [LName_2])
	VALUES('10', 'Etezady', 'Roshanne', '愛德查蒂')
	
-------------------------------------------------

--2019年TINMF 鋼琴篇作品
--Helmut Lachenmann (1935): Ein Kinderspiel / Child’s Play (1981)
INSERT INTO [Composition] ([CTitle], [OTitle], [Instrumentation], [CompYear])
	VALUES ('《兒戲》', 'Ein Kinderspiel / Child’s Play', 'Piano', '1981')
INSERT INTO [NComposition] ([CompID], [LName_1], [FName_1], [LName_2])
	VALUES('11', 'Lachenmann', 'Helmut', '拉亨曼')

--林桂如：《小星星幻想曲》 （2019，世界首演）
INSERT INTO [Composition] ([CTitle], [OTitle], [Instrumentation], [CompYear])
	VALUES ('《小星星幻想曲》', 'twinkle twinkle little fantasia', 'Piano', '2019')
INSERT INTO [MComposition] ([CompID], [MemberID])
	VALUES ('12', '20')

--周久渝：《流漾》 (2012)
INSERT INTO [Composition] ([CTitle], [OTitle], [Instrumentation], [CompYear])
	VALUES ('《流漾》', 'Fluid Ripples', 'Piano', '2012')
INSERT INTO [MComposition] ([CompID], [MemberID])
	VALUES ('13', '58')

--Alfred Schnittke (1934-1998): 5 Aphorisms for Piano, No. 1 Moderato Assai 
INSERT INTO [Composition] ([CTitle], [OTitle], [Instrumentation], [CompYear])
	VALUES ('《五則格言》，第一首：有節制的中板', '5 Aphorisms for Piano, No. 1 Moderato Assai', 'Piano', '1990')
INSERT INTO [NComposition] ([CompID], [LName_1], [FName_1], [LName_2])
	VALUES('14', 'Schnittke', 'Alfred', '施尼特克')

--Laurent Durupt (1978) : Interdite au mineur (2017)
INSERT INTO [Composition] ([CTitle], [OTitle], [Instrumentation], [CompYear])
	VALUES ('《小調禁止》', 'Interdite au mineur', 'Piano', '2017')
INSERT INTO [NComposition] ([CompID], [LName_1], [FName_1], [LName_2])
	VALUES('15', 'Durupt', 'Laurent', '杜盧浦')

--Richard Whalley (1974): Butterflies for solo piano (2012)
INSERT INTO [Composition] ([CTitle], [OTitle], [Instrumentation], [CompYear])
	VALUES ('《蝴蝶》', 'Butterflies for solo piano', 'Piano', '2012')
INSERT INTO [NComposition] ([CompID], [LName_1], [FName_1], [LName_2])
	VALUES('16', 'Whalley', 'Richard', '魏理')

--陳宜貞：《迷離之鏡》 (2016)
INSERT INTO [Composition] ([CTitle], [OTitle], [Instrumentation], [CompYear])
	VALUES ('《迷離之鏡》', 'Mystic Reflections', 'Piano', '2016')
INSERT INTO [MComposition] ([CompID], [MemberID])
	VALUES ('17', '57')

--邱浩源：《說吧，海》 （2019，世界首演）
INSERT INTO [Composition] ([CTitle], [OTitle], [Instrumentation], [CompYear])
	VALUES ('《說吧，海》', 'Dites moi, la mer', 'Piano', '2019')
INSERT INTO [MComposition] ([CompID], [MemberID], [CommissionYear])
	VALUES ('18', '61', '2019')

-------------------------------------------------

--2020年TINMF 擊樂場演出作品
--Malika Kishino: Vagues des Passions for Marimbaphone and Vibraphone (2010)
INSERT INTO [Composition] ([CTitle], [OTitle], [Instrumentation], [CompYear])
	VALUES ('《熱情潮浪》為鍵盤擊樂二重奏》', 'Vagues des Passions for Marimbaphone and Vibraphone', 'Percussion Duo', '2010')
INSERT INTO [NComposition] ([CompID], [LName_1], [FName_1], [LName_2], [FName_2])
	VALUES('19', 'Kishino', 'Malika', '岸野', '末利加')

--陳珩：《歪邀》為擊樂二重奏（委託創作，世界首演）
INSERT INTO [Composition] ([CTitle], [OTitle], [Instrumentation], [CompYear])
	VALUES ('《歪邀》為擊樂二重奏', 'WhyOuch ', 'Percussion Duo', '2020')
INSERT INTO [MComposition] ([CompID], [MemberID], [CommissionYear])
	VALUES ('20', '14', '2020')

--鄭日蓮：《時機》為杖鼓與擊樂四重奏（2015，臺灣首演）
INSERT INTO [Composition] ([CTitle], [OTitle], [Instrumentation], [CompYear])
	VALUES ('《時機》為杖鼓與擊樂四重奏', 'Timing for Kut-Janggu/Janggu and Four Percussionists', 'Percussion', '2015')
INSERT INTO [NComposition] ([CompID], [LName_1], [FName_1], [LName_2], [FName_2])
	VALUES('21', 'Chung', 'Il-Ryun', '鄭', '日蓮')

--潘家琳：《打？游～擊！》為三位擊樂演奏家（委託創作，世界首演）
INSERT INTO [Composition] ([CTitle], [OTitle], [Instrumentation], [CompYear])
	VALUES ('《打？游～擊！》為三位擊樂演奏家', 'The Wandering… Sound, for Three Percussionists', 'Percussion', '2020')
INSERT INTO [MComposition] ([CompID], [MemberID], [CommissionYear])
	VALUES ('22', '21', '2020')

--楊祖垚：《主題標籤》為二位擊樂演奏家（委託創作，世界首演）
INSERT INTO [Composition] ([CTitle], [OTitle], [Instrumentation], [CompYear])
	VALUES ('《主題標籤》為二位擊樂演奏家', 'Hashtag, pour deux percussionnistes', 'Percussion', '2020')
INSERT INTO [MComposition] ([CompID], [MemberID], [CommissionYear])
	VALUES ('23', '2', '2020')

--邱浩源：《傍請相公》為擊樂四重奏 (2014)
INSERT INTO [Composition] ([CTitle], [OTitle], [Instrumentation], [CompYear])
	VALUES ('《傍請相公》為擊樂四重奏', 'Bataille - Foret de bambous pour quatuor de percussions', 'Percussion', '2014')
INSERT INTO [MComposition] ([CompID], [MemberID])
	VALUES ('24', '61')

-------------------------------------------------

--2020年TINMF 室內樂場演出作品
--邱妍甯：《我以我獨特的方式美麗著》為絃樂四重奏 (2016)
INSERT INTO [Composition] ([CTitle], [OTitle], [Instrumentation], [CompYear])
	VALUES ('《我以我獨特的方式美麗著》為絃樂四重奏', 'Wie aus einem Mund, for String Quartet', 'String Quartet', '2016')
INSERT INTO [MComposition] ([CompID], [MemberID])
	VALUES ('25', '49')

--蔡承哲：《在夢見牛飲一碗香灰水之後》為中提琴獨奏 (2014)
INSERT INTO [Composition] ([CTitle], [OTitle], [Instrumentation], [CompYear])
	VALUES ('《在夢見牛飲一碗香灰水之後》為中提琴獨奏', 'After dreaming of gulping down a bowl of water with incense ashes, for Solo Viola', 'Viola', '2014')
INSERT INTO [MComposition] ([CompID], [MemberID])
	VALUES ('26', '9')

--羅芳偉：《孤夜》絃樂四重奏 (2018)
INSERT INTO [Composition] ([CTitle], [OTitle], [Instrumentation], [CompYear])
	VALUES ('《孤夜》絃樂四重奏', 'Nights of Loneliness, for String Quartet', 'String Quartet', '2018')
INSERT INTO [MComposition] ([CompID], [MemberID])
	VALUES ('27', '16')

--張譽馨：《致散佚之光、星體與時間》為鋼琴獨奏 (2015/2019)
INSERT INTO [Composition] ([CTitle], [OTitle], [Instrumentation], [CompYear])
	VALUES ('《致散佚之光、星體與時間》為鋼琴獨奏', 'On the Elapsed Light, Celestial Bodies and Time, for Solo Piano', 'Piano', '2015')
INSERT INTO [MComposition] ([CompID], [MemberID])
	VALUES ('28', '17')

--陳以德：《街景速寫》給長笛、中提琴與鐵琴 (2016)
INSERT INTO [Composition] ([CTitle], [OTitle], [Instrumentation], [CompYear])
	VALUES ('《街景速寫》給長笛、中提琴與鐵琴', 'Street Sketch, for Flute, Viola, and Vibraphone', 'Flute, Viloa, Percussion', '2016')
INSERT INTO [MComposition] ([CompID], [MemberID])
	VALUES ('29', '53')

--李建諭：《無聲的告白》給長笛、中提琴與鋼琴（委託創作，世界首演）
INSERT INTO [Composition] ([CTitle], [OTitle], [Instrumentation], [CompYear])
	VALUES ('《無聲的告白》給長笛、中提琴與鋼琴', 'Silent Confession for Flute, Viola and Piano', 'Flute, Viola, Piano', '2020')
INSERT INTO [MComposition] ([CompID], [MemberID], [CommissionYear])
	VALUES ('30', '68', '2020')
