/*
1. hire_date가 2006년 1월 1일 이전인 직원의 이름,성,이메일

2. lastname이 'Jones' 인 직원의 모든 컬럼

3. salary 가 5000 이상인 직원의 이름,성,JOB_ID 조회

4. JOB_ID 에 ACCOUNT 가 들어가는 직원의 이름,성,salary 조회

5. 부서_ID 가 50 ,60, 80,90 인 직원의 직원_ID, 이름,성 조회

*/

--1 
SELECT FIRST_NAME,LAST_NAME,EMAIL FROM EMPLOYEES where hire_date < '2006-01-01';

--2
select * FROM EMPLOYEES WHERE LAST_NAME = 'Jones';
--대소문자 검사는 조건식에 주의해야 한다.
--컬럼값을 대소문자 변환 후 조건값 비교 -> 대소문자 무관하게 검사 하는 방법
select * FROM EMPLOYEES WHERE UPPER(LAST_NAME) = 'Jones';
select * FROM EMPLOYEES WHERE LOWER(LAST_NAME) = 'Jones';

--3
SELECT FIRST_NAME,LAST_NAME,JOB_ID FROM EMPLOYEES WHERE SALARY >= 5000;

--4
SELECT FIRST_NAME,LAST_NAME,SALARY FROM EMPLOYEES WHERE JOB_ID LIKE '%ACCOUNT%';

--5 : 데이터 타입 변환
SELECT JOB_ID,FIRST_NAME,LAST_NAME FROM EMPLOYEES WHERE DEPARTMENT_ID IN (50,60,80,90);

--통계 함수 : count, avg, max, min. 통계함수는 그룹함수라고도 한다.
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

-- 오늘의 요약 : create teble, insert into, select ~ where ~ 기본 형식

-- 참고 : 별칭(alias). 컬럼 또는 테이블 이름이 길 때 짧게 줄여서 쓰는 이름.
SELECT * FROM EMPLOYEES e ;		--EMPLOYEES 테이블의 별칭 e
SELECT * FROM DEPARTMENTS d ;	--DEPARTMENTS 테이블의 별칭 
--위에서는 굳이 별칭이 필요없다. 그러나 언젠간 유용하게 쓰인다.