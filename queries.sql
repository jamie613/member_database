--查詢會員繳費狀況
--以會員編號查詢
SELECT DISTINCT M.MemberID, LName_1, FName_1, AdmissionYear, For_Year
FROM Member M, Annual_Fee A
WHERE M.MemberID = A.MemberID
AND M.MemberID = 13 --指定會員編號

--以會員姓名查詢
SELECT DISTINCT M.MemberID, LName_1, FName_1, AdmissionYear, For_Year
FROM Member M, Annual_Fee A
WHERE M.MemberID = A.MemberID
AND LName_1 = '潘'
AND FName_1 = '家琳'

-----------------------------------------------

--查詢指定年度未繳年費者
--搜尋指定年有繳費的MemberID，再找出沒有繳費的MemberID
--排除於指定年之後入會者
--排除榮譽會員
SELECT DISTINCT M.MemberID, LName_1, FName_1, AdmissionYear
FROM Member M, Annual_Fee A, Honor H
WHERE M.MemberID NOT IN (
	Select M. MemberID From Member M, Annual_Fee A
	WHERE M.MemberID = A.MemberID
		 AND For_Year = '2019') --指定年度
AND AdmissionYear <= '2019' --確認入會年於指定年度之前
AND M.MemberID != H.MemberID

-----------------------------------------------

--查詢有效會員人數
--有效會員為當年已繳會費者
SELECT  COUNT(M.MemberID)+1 as '有效會員人數'
FROM Member M, Annual_Fee A
WHERE M.MemberID = A.MemberID
AND For_Year = 2020

-----------------------------------------------

--查詢有效正式會員人數
SELECT  COUNT(M.MemberID) as '有效正式會員人數'
FROM Member M, Annual_Fee A, FullM F --選定查詢會員類別
WHERE M.MemberID = F.MemberID
AND M.MemberID = A.MemberID
AND For_Year = 2020

-----------------------------------------------

--查詢演奏家會員
INSERT INTO [HInst]([MemberID], [Instrument]) --加一個測試會員資料到Honor
	VALUES('6', '雙簧管')
INSERT INTO [EInst]([MemberID], [Instrument]) --加一個測試會員資料到EInst
	VALUES('30', '聲樂')

SELECT LName_1, FName_1, Instrument
FROM Member M, Instrumentalist I
WHERE M.MemberID = I.MemberID

DELETE FROM [HInst] WHERE MemberID = 6 --刪除測試用假資料
DELETE FROM [EInst] WHERE MemberID = 30 --刪除測試用假資料

-----------------------------------------------
--查詢特定年演出場次
SELECT C1.ConTitle, ConTime, Venue
FROM Concert C1, (SELECT Year(ConTime) as Year, ConcertID FROM Concert) C2
WHERE C1.ConcertID = C2.ConcertID
AND Year = 2020 --特定年


-----------------------------------------------
--查詢歷年委創作品
SELECT LName_1, FName_1, CTitle, CommissionYear, ConTitle
FROM Member M, Composition C, MComposition MC, Program_List PL, Concert Con
WHERE M.MemberID = MC.MemberID
AND C.CompID = MC.CompID
AND MC.CompID = PL.CompID
AND PL.ConcertID = Con.ConcertID
AND CommissionYear IS NOT NULL

-----------------------------------------------
--查詢最近三年沒有被委創的作曲家會員
--已入會超過二年
--近二年都有繳會費
SELECT DISTINCT MemberID, LName_1, FName_1
FROM Member
WHERE MemberID NOT IN (
	SELECT MemberID
	FROM MComposition
	WHERE CommissionYear >= YEAR(getdate())-3) --近三年有被委創的會員
AND MemberID IN (
	SELECT MemberID
	FROM Annual_Fee
	WHERE For_Year = 2020) --應該用 Year(getdate())-1 但目前沒有建 2021的年費繳費資料
AND MemberID IN (
	Select MemberID
	FROM Annual_Fee
	WHERE For_Year = 2019) --應該用 Year(getdate())-1 但目前沒有建 2021的年費繳費資料
AND AdmissionYear <= YEAR(getdate())-2 --入會已滿二年

-----------------------------------------------
--查詢特定編制之會員作品
SELECT M.MemberID, LName_1, FName_1, CTitle, Instrumentation
FROM Member M, Composition C, MComposition MC
WHERE M.MemberID = MC.MemberID
AND C.CompID = MC.CompID
AND Instrumentation LIKE '%Percussion%'

-----------------------------------------------
--查詢曲目演出人員
--會員演奏者演奏之曲目
SELECT ConTitle, Comp.CTitle, LName_1, FName_1
FROM Member M, Composition Comp, Performer_List PerL, MPerformer MPer, --人員與曲目
	 Concert Con, Program_List ProL --音樂會
WHERE Comp.CompID = PerL.CompID
AND PerL.PerformerID = MPer.PerformerID
AND MPer.MemberID = M.MemberID
AND Con.ConcertID = ProL.ConcertID
AND ProL.CompID = Comp.CompID
UNION
--非會員演奏者演出之曲目
SELECT ConTitle, Comp.CTitle, LName, FName
FROM Composition Comp, Performer_List PerL, NPerformer NPer, --人員與曲目
	 Concert Con, Program_List ProL --音樂會
WHERE Comp.CompID = PerL.CompID
AND PerL.PerformerID = NPer.PerformerID
AND Con.ConcertID = ProL.ConcertID
AND ProL.CompID = Comp.CompID
ORDER BY ConTitle, Comp.CTitle

-----------------------------------------------
--查詢作品演出次數最多的會員作曲家
SELECT LName_1, FName_1, Count(M.MemberID)
FROM Program_List ProL, Composition Comp, MComposition MComp, --演出樂曲資料
	 Member M
WHERE ProL.CompID = Comp.CompID
AND MComp.CompID = Comp.CompID
AND MComp.MemberID = M.MemberID
GROUP BY M.MemberID, LName_1, FName_1
ORDER BY Count(M.MemberID) DESC