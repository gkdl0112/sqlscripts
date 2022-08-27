/*
 * [[ 
 *
 */


-- 1) ������ �߰��մϴ�. ��B1102�� , ����Ʈ����ũ �����⡯, ����ö���� ,��KBO�� , ��2020-11-10����
INSERT INTO TBL_BOOK (bcode,TITLE,WRITER,PUBLISHER,PDATE)
VALUES ('B1102','��Ʈ����ũ ������','��ö��','KBO','2020-11-20');

--2) �ݳ��� ������ ��ü�ϼ��� ����Ͽ� delay_days �÷����� update �մϴ�.
UPDATE TBL_BOOKRENT SET DELAY_DAYS = RETURN_DATE - EXP_DATE 
WHERE RENT_DATE IS NOT NULL;

SELECT * FROM TBL_BOOKRENT tb ;

--3) ���� ���� ������ ��ü�ϼ� ����ؼ� ȸ��IDX, �����ڵ�, ��ü �ϼ� ��ȸ
-- sysdate �� ����� ������ ������� �ʾ� �׳� �ϸ� long ������ ���ȴ�.
SELECT mem_idx, bcode, to_date(to_char(sysdate,'yyyy-MM-dd')) - exp_date 
FROM TBL_BOOKRENT tb WHERE RETURN_DATE IS NULL;
-- �Ǵ� 
SELECT mem_idex, bcode trunc(sysdate) - exp_date -- trunc(sysdate)�� sysdate �� �ð��κ��� ������. 
FROM TBL_BOOKRENT tb WHERE RETURN_DATE IS NULL;

--4) ���� ���� ���� ���� �� ��ü�� ȸ���� �̸�,��ȭ��ȣ�� �˻��մϴ�. ���� ��¥ sysdate ����
-- ���� �������� ��ü ���ΰ��� �ݳ����� < ���糯¥
SELECT name,tel FROM BOOK_MEMBER bm JOIN TBL_BOOKRENT tb 
ON bm.MEM_IDX = tb.MEM_IDX AND sysdate > exp_date AND return_date IS NULL;

--5) ���� �������� ������ �������ڵ�� ������ �˻��մϴ�.
SELECT tb.BCODE , TITLE FROM TBL_BOOK tb JOIN TBL_BOOKRENT tb2 
ON tb.BCODE = tb2.BCODE AND return_date IS NULL;

--6) ���� ������ �뿩�� ȸ���� IDX�� ȸ���̸��� �˻��մϴ�.
SELECT bm.MEM_IDX , name FROM BOOK_MEMBER bm JOIN TBL_BOOKRENT tb 
ON bm.MEM_IDX = tb.MEM_IDX AND return_date IS NULL;

--7) �������� ������ ȸ���̸�, ������, �ݳ����� �˻��մϴ�.
SELECT bm.NAME , tb.TITLE , tb2.EXP_DATE  FROM BOOK_MEMBER bm ,TBL_BOOKRENT tb2 , TBL_BOOK tb 
WHERE bm.MEM_IDX = tb2.MEM_IDX 
AND tb.BCODE = tb2.BCODE AND tb2.return_date IS null;

--�Ǵ�
SELECT name, title, exp_date FROM TBL_BOOKRENT tb 
JOIN TBL_BOOK tb2 ON tb2.BCODE = tb.BCODE 
JOIN BOOK_MEMBER bm ON tb.MEM_IDX = bm.MEM_IDX 
WHERE RETURN_DATE IS NULL; -- WHERE ��� AND �� ����


--8) ���� ��ü ���� ������ ȸ��IDX, �����ڵ�, �ݳ������� �˻��մϴ�.
SELECT mem_idx,bcode,exp_date FROM TBL_BOOKRENT tb 
WHERE SYSDATE > EXP_DATE ;

--9) ȸ��  IDX '10002'�� ���� ������ �������� ���ν����� �ۼ��մϴ�. ���� �� ���ν���
DECLARE 
	vcnt NUMBER ;
BEGIN
	SELECT count(*) INTO vcnt
	FROM TBL_BOOKRENT tb 
	WHERE MEM_IDX = 10001 AND RETURN_DATE IS NULL; -- rcnt�� 0 �϶��� �뿩 ����
	IF (vcnt=0) THEN 
	 DBMS_OUTPUT.put_line('å �뿩 ���� �մϴ�.');
	ELSE 
	 DBMS_OUTPUT.put_line('�뿩 ���� å�� �ݳ��ؾ� �����մϴ�.');
	END IF;
END;


	CREATE OR REPLACE PROCEDURE check_member(
		arg_mem IN book_member.MEM_IDX%TYPE ,	-- ���ν��� �����Ҷ� ���� ���� �Ű�����
		isOk OUT varchar2	-- �ڹ��� ���ϰ��� �ش��ϴ� �κ�.
	)
	IS 
		vcnt NUMBER ;
	BEGIN
	SELECT count(*) 
	INTO vcnt	-- SELECT ��ȸ ��� ������ ����. ������ , �� �����Ҽ� ����.
	FROM TBL_BOOKRENT tb 
	WHERE MEM_IDX = arg_mem AND RETURN_DATE IS NULL; -- rcnt�� 0 �϶��� �뿩 ����
	IF (vcnt=0) THEN 
	 DBMS_OUTPUT.put_line('å �뿩 ���� �մϴ�.');
	 isOk := '����';
	ELSE 
	 DBMS_OUTPUT.put_line('�뿩 ���� å�� �ݳ��ؾ� �����մϴ�.');
	 isOk := '�Ұ���';
	END IF;
END;
	
	-- ���ν��� �����ϱ�
	DECLARE 
		vresult varchar2(20);
	BEGIN
		check_member(10003,vresult);
		DBMS_OUTPUT.put_line('��� : ' || vresult);
	END;
		

--10) ������ ���佺Ʈ�� ��� ������ ������ �������� ���ν����� �ۼ��մϴ�. ���ν����̸��� check_book
DECLARE 
	v_bcode varchar2(100);
	v_cnt NUMBER;
BEGIN
	SELECT bcode INTO v_bcode		-- v_bcode�� 'A1102'
		FROM TBL_BOOK tb WHERE title = '�佺Ʈ';
	SELECT count(*) INTO v_cnt		--v_cnt ���� 1 �̸� v_bcode å�� ������
		FROM TBL_BOOKRENT tb WHERE bcode = v_bcode AND return_date IS NULL; 
	IF (v_cnt = 1) THEN
	DBMS_OUTPUT.put_line('å �뿩 ���� �մϴ�.');
	ELSE 
	DBMS_OUTPUT.put_line('�뿩 ���� å�� �ݳ��ؾ� �����մϴ�.');
	END IF;
END;

--11) 9�� 10�� �̿��ؼ� insert �� �ϴ� ���ν����� �ۼ��մϴ�.


