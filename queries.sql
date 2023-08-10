--�d�߷|��ú�O���p
--�H�|���s���d��
SELECT DISTINCT M.MemberID, LName_1, FName_1, AdmissionYear, For_Year
FROM Member M, Annual_Fee A
WHERE M.MemberID = A.MemberID
AND M.MemberID = 13 --���w�|���s��

--�H�|���m�W�d��
SELECT DISTINCT M.MemberID, LName_1, FName_1, AdmissionYear, For_Year
FROM Member M, Annual_Fee A
WHERE M.MemberID = A.MemberID
AND LName_1 = '��'
AND FName_1 = '�a�Y'

-----------------------------------------------

--�d�߫��w�~�ץ�ú�~�O��
--�j�M���w�~��ú�O��MemberID�A�A��X�S��ú�O��MemberID
--�ư�����w�~����J�|��
--�ư��a�A�|��
SELECT DISTINCT M.MemberID, LName_1, FName_1, AdmissionYear
FROM Member M, Annual_Fee A, Honor H
WHERE M.MemberID NOT IN (
	Select M. MemberID From Member M, Annual_Fee A
	WHERE M.MemberID = A.MemberID
		 AND For_Year = '2019') --���w�~��
AND AdmissionYear <= '2019' --�T�{�J�|�~����w�~�פ��e
AND M.MemberID != H.MemberID

-----------------------------------------------

--�d�ߦ��ķ|���H��
--���ķ|������~�wú�|�O��
SELECT  COUNT(M.MemberID)+1 as '���ķ|���H��'
FROM Member M, Annual_Fee A
WHERE M.MemberID = A.MemberID
AND For_Year = 2020

-----------------------------------------------

--�d�ߦ��ĥ����|���H��
SELECT  COUNT(M.MemberID) as '���ĥ����|���H��'
FROM Member M, Annual_Fee A, FullM F --��w�d�߷|�����O
WHERE M.MemberID = F.MemberID
AND M.MemberID = A.MemberID
AND For_Year = 2020

-----------------------------------------------

--�d�ߺt���a�|��
INSERT INTO [HInst]([MemberID], [Instrument]) --�[�@�Ӵ��շ|����ƨ�Honor
	VALUES('6', '��®��')
INSERT INTO [EInst]([MemberID], [Instrument]) --�[�@�Ӵ��շ|����ƨ�EInst
	VALUES('30', '�n��')

SELECT LName_1, FName_1, Instrument
FROM Member M, Instrumentalist I
WHERE M.MemberID = I.MemberID

DELETE FROM [HInst] WHERE MemberID = 6 --�R�����եΰ����
DELETE FROM [EInst] WHERE MemberID = 30 --�R�����եΰ����

-----------------------------------------------
--�d�߯S�w�~�t�X����
SELECT C1.ConTitle, ConTime, Venue
FROM Concert C1, (SELECT Year(ConTime) as Year, ConcertID FROM Concert) C2
WHERE C1.ConcertID = C2.ConcertID
AND Year = 2020 --�S�w�~


-----------------------------------------------
--�d�߾��~�e�Ч@�~
SELECT LName_1, FName_1, CTitle, CommissionYear, ConTitle
FROM Member M, Composition C, MComposition MC, Program_List PL, Concert Con
WHERE M.MemberID = MC.MemberID
AND C.CompID = MC.CompID
AND MC.CompID = PL.CompID
AND PL.ConcertID = Con.ConcertID
AND CommissionYear IS NOT NULL

-----------------------------------------------
--�d�̪߳�T�~�S���Q�e�Ъ��@���a�|��
--�w�J�|�W�L�G�~
--��G�~����ú�|�O
SELECT DISTINCT MemberID, LName_1, FName_1
FROM Member
WHERE MemberID NOT IN (
	SELECT MemberID
	FROM MComposition
	WHERE CommissionYear >= YEAR(getdate())-3) --��T�~���Q�e�Ъ��|��
AND MemberID IN (
	SELECT MemberID
	FROM Annual_Fee
	WHERE For_Year = 2020) --���ӥ� Year(getdate())-1 ���ثe�S���� 2021���~�Oú�O���
AND MemberID IN (
	Select MemberID
	FROM Annual_Fee
	WHERE For_Year = 2019) --���ӥ� Year(getdate())-1 ���ثe�S���� 2021���~�Oú�O���
AND AdmissionYear <= YEAR(getdate())-2 --�J�|�w���G�~

-----------------------------------------------
--�d�߯S�w�s��|���@�~
SELECT M.MemberID, LName_1, FName_1, CTitle, Instrumentation
FROM Member M, Composition C, MComposition MC
WHERE M.MemberID = MC.MemberID
AND C.CompID = MC.CompID
AND Instrumentation LIKE '%Percussion%'

-----------------------------------------------
--�d�ߦ��غt�X�H��
--�|���t���̺t��������
SELECT ConTitle, Comp.CTitle, LName_1, FName_1
FROM Member M, Composition Comp, Performer_List PerL, MPerformer MPer, --�H���P����
	 Concert Con, Program_List ProL --���ַ|
WHERE Comp.CompID = PerL.CompID
AND PerL.PerformerID = MPer.PerformerID
AND MPer.MemberID = M.MemberID
AND Con.ConcertID = ProL.ConcertID
AND ProL.CompID = Comp.CompID
UNION
--�D�|���t���̺t�X������
SELECT ConTitle, Comp.CTitle, LName, FName
FROM Composition Comp, Performer_List PerL, NPerformer NPer, --�H���P����
	 Concert Con, Program_List ProL --���ַ|
WHERE Comp.CompID = PerL.CompID
AND PerL.PerformerID = NPer.PerformerID
AND Con.ConcertID = ProL.ConcertID
AND ProL.CompID = Comp.CompID
ORDER BY ConTitle, Comp.CTitle

-----------------------------------------------
--�d�ߧ@�~�t�X���Ƴ̦h���|���@���a
SELECT LName_1, FName_1, Count(M.MemberID)
FROM Program_List ProL, Composition Comp, MComposition MComp, --�t�X�֦����
	 Member M
WHERE ProL.CompID = Comp.CompID
AND MComp.CompID = Comp.CompID
AND MComp.MemberID = M.MemberID
GROUP BY M.MemberID, LName_1, FName_1
ORDER BY Count(M.MemberID) DESC