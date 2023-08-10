--音樂會
CREATE TABLE [dbo].[Concert](
	[ConcertID] [int] IDENTITY Primary Key,
	[ConTitle] [nvarchar] (50) NOT NULL,
	[ConTime] [date] NOT NULL,
	[Venue] [nvarchar] (20) DEFAULT '國家兩廳院演奏廳'  NOT NULL)

INSERT INTO [Concert] ([ConTitle], [ConTime], [Venue])
	VALUES('2019臺北國際現代音樂節─單簧樂器篇', '2019-10-26 19:30:00', '十方樂集音樂劇場音樂廳')
INSERT INTO [Concert] ([ConTitle], [ConTime], [Venue])
	VALUES('2019臺北國際現代音樂節─鋼琴篇', '2019-10-27 14:30:00', '十方樂集音樂劇場音樂廳')
INSERT INTO [Concert] ([ConTitle], [ConTime], [Venue])
	VALUES('《現打･擊音》「現代音樂協會X朱宗慶打擊樂團」臺灣當代擊樂作品音樂會', '2020-09-24 19:30:00', '國立臺北藝術大學音樂廳')
INSERT INTO [Concert] ([ConTitle], [ConTime])
	VALUES('2020年臺北國際現代音樂節─擊樂場', '2020-10-30 19:30:00')
INSERT INTO [Concert] ([ConTitle], [ConTime])
	VALUES('2020年臺北國際現代音樂節─室內樂場', '2020-10-31 14:30:00')
INSERT INTO [Concert] ([ConTitle], [ConTime])
	VALUES('2020年臺北國際現代音樂節─大鍵琴場', '2020-11-01 14:30:00')
INSERT INTO [Concert] ([ConTitle], [ConTime])
	VALUES('2020年臺北國際現代音樂節─琵琶場', '2020-11-01 19:30:00')