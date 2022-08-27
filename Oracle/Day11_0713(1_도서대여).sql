/*
 * [[ 
 *
 */


-- 1) 도서를 추가합니다. ‘B1102’ , ‘스트라이크 던지기’, ‘박철순’ ,’KBO’ , ‘2020-11-10’’
INSERT INTO TBL_BOOK (bcode,TITLE,WRITER,PUBLISHER,PDATE)
VALUES ('B1102','스트라이크 던지기','박철순','KBO','2020-11-20');

--2) 반납된 도서의 연체일수를 계산하여 delay_days 컬럼값을 update 합니다.
UPDATE TBL_BOOKRENT SET DELAY_DAYS = RETURN_DATE - EXP_DATE 
WHERE RENT_DATE IS NOT NULL;

SELECT * FROM TBL_BOOKRENT tb ;

--3) 대출 중인 도서의 연체일수 계산해서 회원IDX, 도서코드, 연체 일수 조회
-- sysdate 는 년월일 패턴이 저장되지 않아 그냥 하면 long 값으로 계산된다.
SELECT mem_idx, bcode, to_date(to_char(sysdate,'yyyy-MM-dd')) - exp_date 
FROM TBL_BOOKRENT tb WHERE RETURN_DATE IS NULL;
-- 또는 
SELECT mem_idex, bcode trunc(sysdate) - exp_date -- trunc(sysdate)는 sysdate 의 시간부분은 버린다. 
FROM TBL_BOOKRENT tb WHERE RETURN_DATE IS NULL;

--4) 현재 대출 중인 도서 중 연체인 회원의 이름,전화번호를 검색합니다. 오늘 날짜 sysdate 기준
-- 현재 기준으로 연체 중인것은 반납기한 < 현재날짜
SELECT name,tel FROM BOOK_MEMBER bm JOIN TBL_BOOKRENT tb 
ON bm.MEM_IDX = tb.MEM_IDX AND sysdate > exp_date AND return_date IS NULL;

--5) 현재 대출중인 도서의 도서명코드와 도서명 검색합니다.
SELECT tb.BCODE , TITLE FROM TBL_BOOK tb JOIN TBL_BOOKRENT tb2 
ON tb.BCODE = tb2.BCODE AND return_date IS NULL;

--6) 현재 도서를 대여한 회원의 IDX와 회원이름을 검색합니다.
SELECT bm.MEM_IDX , name FROM BOOK_MEMBER bm JOIN TBL_BOOKRENT tb 
ON bm.MEM_IDX = tb.MEM_IDX AND return_date IS NULL;

--7) 대출중인 도서의 회원이름, 도서명, 반납기한 검색합니다.
SELECT bm.NAME , tb.TITLE , tb2.EXP_DATE  FROM BOOK_MEMBER bm ,TBL_BOOKRENT tb2 , TBL_BOOK tb 
WHERE bm.MEM_IDX = tb2.MEM_IDX 
AND tb.BCODE = tb2.BCODE AND tb2.return_date IS null;

--또는
SELECT name, title, exp_date FROM TBL_BOOKRENT tb 
JOIN TBL_BOOK tb2 ON tb2.BCODE = tb.BCODE 
JOIN BOOK_MEMBER bm ON tb.MEM_IDX = bm.MEM_IDX 
WHERE RETURN_DATE IS NULL; -- WHERE 대신 AND 도 가능


--8) 현재 연체 중인 도서의 회원IDX, 도서코드, 반납기한을 검색합니다.
SELECT mem_idx,bcode,exp_date FROM TBL_BOOKRENT tb 
WHERE SYSDATE > EXP_DATE ;

--9) 회원  IDX '10002'는 도서 대출이 가능한지 프로시저를 작성합니다. 다음 평가 프로시저
DECLARE 
	vcnt NUMBER ;
BEGIN
	SELECT count(*) INTO vcnt
	FROM TBL_BOOKRENT tb 
	WHERE MEM_IDX = 10001 AND RETURN_DATE IS NULL; -- rcnt가 0 일때만 대여 가능
	IF (vcnt=0) THEN 
	 DBMS_OUTPUT.put_line('책 대여 가능 합니다.');
	ELSE 
	 DBMS_OUTPUT.put_line('대여 중인 책을 반납해야 가능합니다.');
	END IF;
END;


	CREATE OR REPLACE PROCEDURE check_member(
		arg_mem IN book_member.MEM_IDX%TYPE ,	-- 프로시저 실핼할때 값을 받을 매개변수
		isOk OUT varchar2	-- 자바의 리턴값에 해당하는 부분.
	)
	IS 
		vcnt NUMBER ;
	BEGIN
	SELECT count(*) 
	INTO vcnt	-- SELECT 조회 결과 저장할 변수. 여러개 , 로 나열할수 있음.
	FROM TBL_BOOKRENT tb 
	WHERE MEM_IDX = arg_mem AND RETURN_DATE IS NULL; -- rcnt가 0 일때만 대여 가능
	IF (vcnt=0) THEN 
	 DBMS_OUTPUT.put_line('책 대여 가능 합니다.');
	 isOk := '가능';
	ELSE 
	 DBMS_OUTPUT.put_line('대여 중인 책을 반납해야 가능합니다.');
	 isOk := '불가능';
	END IF;
END;
	
	-- 프로시저 실행하기
	DECLARE 
		vresult varchar2(20);
	BEGIN
		check_member(10003,vresult);
		DBMS_OUTPUT.put_line('결과 : ' || vresult);
	END;
		

--10) 도서명 ‘페스트’ 라는 도서가 대출이 가능한지 프로시저를 작성합니다. 프로시저이름은 check_book
DECLARE 
	v_bcode varchar2(100);
	v_cnt NUMBER;
BEGIN
	SELECT bcode INTO v_bcode		-- v_bcode는 'A1102'
		FROM TBL_BOOK tb WHERE title = '페스트';
	SELECT count(*) INTO v_cnt		--v_cnt 값이 1 이면 v_bcode 책은 대출중
		FROM TBL_BOOKRENT tb WHERE bcode = v_bcode AND return_date IS NULL; 
	IF (v_cnt = 1) THEN
	DBMS_OUTPUT.put_line('책 대여 가능 합니다.');
	ELSE 
	DBMS_OUTPUT.put_line('대여 중인 책을 반납해야 가능합니다.');
	END IF;
END;

--11) 9과 10을 이용해서 insert 를 하는 프로시저를 작성합니다.


