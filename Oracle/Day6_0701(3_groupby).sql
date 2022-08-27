-- 주제 : 행을 그룹화 하고 그룹화 함수를 사용 합니다. 사용하는 순서는 아래처럼 합니다.
-- select 문
-- [WHERE] 그룹화 하기 전에 사용할 조건식
-- GROUP BY 그룹화에 사용할 컬럼명
-- [HAVING] 그룹화 결과에 대한 조건식
-- [ORDER BY] 그룹화 결과 정렬 컬럼
	
SELECT PCODE ,count(*) FROM TBL_BUY tb GROUP BY PCODE ;
SELECT PCODE ,count(*), sum(QUANTITY) FROM TBL_BUY tb 
	GROUP BY PCODE 
	ORDER BY 2;		-- 조회된 컴럼의 위치

SELECT PCODE ,count(*) cnt, sum(QUANTITY) total FROM TBL_BUY tb 
	GROUP BY PCODE 
	ORDER BY cnt;	-- 그룹함수 결과의 별칭
	
-- 그룹화 후에 수량 합계가 3 이상만 조회
SELECT PCODE ,count(*) cnt, sum(QUANTITY) total FROM TBL_BUY tb 
	GROUP BY PCODE
--	HAVING total >= 3   	-- HAVING 에는 컬럼 별칭 사용 못함. 테이블컬럼명은 사용할수 있음.
	HAVING sum(QUANTITY) >= 3
	ORDER BY cnt;

-- 구매날짜 2022-04-01 이후인 것만 그룹하여 조회
SELECT PCODE ,count(*) cnt, sum(QUANTITY) total FROM TBL_BUY tb 
	WHERE BUY_DATE >= '2022-04-01'
	GROUP BY PCODE
	ORDER BY cnt;

--Day2 참고
--통계 함수 : count, avg, max, min, sum. 통계함수는 그룹함수라고도 한다.
--			해당 함수 결과값을 구하기 위해 특정 컬럼 사용하여 여러 데이터를 그룹화한후 실행.

SELECT count(*) FROM EMPLOYEES ;		--테이블 전체 데이터 갯수 : 107
SELECT max(SALARY) FROM EMPLOYEES ;		--salary 컬럼의 최대값 : 24000
SELECT min(SALARY) FROM EMPLOYEES ;		--salary 컬럼의 최소값 : 2100
SELECT avg(salary) FROM EMPLOYEES ;		--			   평균값 : 6461.83...
SELECT sum(salary) FROM EMPLOYEES ;		-- 				합계 : 691416

--위 5개 통계함수를 JOB_ID = 'IT_PROG' 값을 조건식으로 똑같이 실행해보기
SELECT count(*) FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG';		--5
SELECT max(SALARY) FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG';		--9000	
SELECT min(SALARY) FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG';		--4200
SELECT avg(salary) FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG';		--5760
SELECT sum(salary) FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG';		--28800

-- 통계함수 결과는 다른 컬럼값과 같이 조회 못한다.(그룹함수이기 때문)
SELECT JOB_ID,count(*) FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG';	--오류 : 단일 그룹의 그룹 함수가 아닙니다
