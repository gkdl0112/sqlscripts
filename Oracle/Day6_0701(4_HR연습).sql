-- 조인과 group by 를 포함해서 select 로 검색하는 문제를 10개 만들기
-- group by 결과로도 조인을 할수 있다. 예시 : 부서인원이 가장 많은 부서는?

-- 1) First_name이 Jennifer인 직원의 ID 조회
SELECT EMPLOYEE_ID FROM EMPLOYEES e WHERE FIRST_NAME = 'Jennifer';

SELECT first_name, last_name,salary FROM EMPLOYEES e 
WHERE SALARY = (SELECT min(SALARY) FROM EMPLOYEES e2 WHERE JOB_ID = 'IT_PROG');

--job id 가 'IT_PROG' 가 아닌 것 조회
SELECT min(salary) FROM EMPLOYEES e WHERE JOB_ID <> 'IT_PROG';
SELECT min(salary) FROM EMPLOYEES e WHERE NOT JOB_ID = 'IT_PROG'; --**

-- 부서별 평균급여를 조회합니다. 정렬은 평균급여 내림차순으로 부서_ID, 부서명, 평균급여 (소수점 1자리로 반올림)
-- 오라클 소수점 관련 함수 : round(반올림), trunc(버림), ceil(내림)

-- 그룹함수 조회할 때 group by 를 써야 그룹바이에 쓴 컬럼을 select 로 조회할수 있다.
-- 그룹 바이 컬럼 외에는 다른 컬럼 select 할수 없다. -> join, 서브쿼리

-- 1단계 : 사용할 그룹함수 실행하기
SELECT DEPARTMENT_ID,avg(salary) FROM EMPLOYEES e GROUP BY DEPARTMENT_ID ;

-- 2단계 : 조인하기
SELECT * FROM DEPARTMENTS d JOIN 
		(SELECT DEPARTMENT_ID,avg(salary) cavg FROM EMPLOYEES e GROUP BY DEPARTMENT_ID) tavg
		ON d.DEPARTMENT_ID = tavg.DEPARTMENT_ID; 

-- 3단계 : 컬럼 지정하기
	SELECT d.DEPARTMENT_ID ,d.DEPARTMENT_NAME ,round(tavg.cavg) FROM DEPARTMENTS d JOIN 
		(SELECT DEPARTMENT_ID,avg(salary) cavg FROM EMPLOYEES e GROUP BY DEPARTMENT_ID) tavg
		ON d.DEPARTMENT_ID = tavg.DEPARTMENT_ID
		ORDER BY tavg.cavg DESC 
	
-- 4단계 : 정렬한 결과로 특정 위치 지정 : FIRST n 은 상위 n개를 조회.	
		SELECT d.DEPARTMENT_ID ,d.DEPARTMENT_NAME ,round(tavg.cavg) FROM DEPARTMENTS d JOIN 
		(SELECT DEPARTMENT_ID,avg(salary) cavg FROM EMPLOYEES e GROUP BY DEPARTMENT_ID) tavg
		ON d.DEPARTMENT_ID = tavg.DEPARTMENT_ID
		ORDER BY tavg.cavg DESC
		FETCH FIRST 1 ROWS ONLY; 
	
-- 다른 예시
	SELECT d.DEPARTMENT_ID did, d.DEPARTMENT_NAME ,e.cnt
	FROM DEPARTMENTS d 
	JOIN 
	 	(SELECT DEPARTMENT_ID,count(*) cnt FROM EMPLOYEES
	 	GROUP BY DEPARTMENT_ID ) e
	ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
	ORDER BY cnt DESC
	FETCH FIRST 1 ROWS ONLY;		-- 오라클 12c 버전 부터 사용가능

-- 오라클의 rownum은 가상의 컬럼으로 조회된 결과에 순차적으로 오라클이 부여하는 값이다.
--			가상 컬럼 사용을 위해 join이 한번 더 필요하다.
SELECT rownum,tcnt.* FROM
(SELECT DEPARTMENT_ID, count(*) cnt FROM EMPLOYEES 
		GROUP BY DEPARTMENT_ID ORDER BY cnt DESC ) tcnt
WHERE rownum < 5;

SELECT rownum,tcnt.* FROM
(SELECT DEPARTMENT_ID, count(*) cnt FROM EMPLOYEES 
		GROUP BY DEPARTMENT_ID ORDER BY cnt DESC ) tcnt
WHERE rownum = 1;

-- rownum 사용할때 결과 확인이 안되는 예시 : rownum 1부터 시작해서 찾아갈수 있는 조건식만 가능
-- where rownum = 3;
-- where rownum > 5;
-- 그래서 한번더 rownum 을 포함한 조회 결과로 select 를 한다. 이때 rownum 은 별칭 부여

SELECT * from
	(SELECT rownum rn,tcnt.* FROM
		(SELECT DEPARTMENT_ID, count(*) cnt FROM EMPLOYEES 
			GROUP BY DEPARTMENT_ID ORDER BY cnt DESC ) tcnt)
WHERE rn BETWEEN 5 AND 9;
--WHERE rn = 3;
	

	
	
	
	
