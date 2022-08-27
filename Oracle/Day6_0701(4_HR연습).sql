-- ���ΰ� group by �� �����ؼ� select �� �˻��ϴ� ������ 10�� �����
-- group by ����ε� ������ �Ҽ� �ִ�. ���� : �μ��ο��� ���� ���� �μ���?

-- 1) First_name�� Jennifer�� ������ ID ��ȸ
SELECT EMPLOYEE_ID FROM EMPLOYEES e WHERE FIRST_NAME = 'Jennifer';

SELECT first_name, last_name,salary FROM EMPLOYEES e 
WHERE SALARY = (SELECT min(SALARY) FROM EMPLOYEES e2 WHERE JOB_ID = 'IT_PROG');

--job id �� 'IT_PROG' �� �ƴ� �� ��ȸ
SELECT min(salary) FROM EMPLOYEES e WHERE JOB_ID <> 'IT_PROG';
SELECT min(salary) FROM EMPLOYEES e WHERE NOT JOB_ID = 'IT_PROG'; --**

-- �μ��� ��ձ޿��� ��ȸ�մϴ�. ������ ��ձ޿� ������������ �μ�_ID, �μ���, ��ձ޿� (�Ҽ��� 1�ڸ��� �ݿø�)
-- ����Ŭ �Ҽ��� ���� �Լ� : round(�ݿø�), trunc(����), ceil(����)

-- �׷��Լ� ��ȸ�� �� group by �� ��� �׷���̿� �� �÷��� select �� ��ȸ�Ҽ� �ִ�.
-- �׷� ���� �÷� �ܿ��� �ٸ� �÷� select �Ҽ� ����. -> join, ��������

-- 1�ܰ� : ����� �׷��Լ� �����ϱ�
SELECT DEPARTMENT_ID,avg(salary) FROM EMPLOYEES e GROUP BY DEPARTMENT_ID ;

-- 2�ܰ� : �����ϱ�
SELECT * FROM DEPARTMENTS d JOIN 
		(SELECT DEPARTMENT_ID,avg(salary) cavg FROM EMPLOYEES e GROUP BY DEPARTMENT_ID) tavg
		ON d.DEPARTMENT_ID = tavg.DEPARTMENT_ID; 

-- 3�ܰ� : �÷� �����ϱ�
	SELECT d.DEPARTMENT_ID ,d.DEPARTMENT_NAME ,round(tavg.cavg) FROM DEPARTMENTS d JOIN 
		(SELECT DEPARTMENT_ID,avg(salary) cavg FROM EMPLOYEES e GROUP BY DEPARTMENT_ID) tavg
		ON d.DEPARTMENT_ID = tavg.DEPARTMENT_ID
		ORDER BY tavg.cavg DESC 
	
-- 4�ܰ� : ������ ����� Ư�� ��ġ ���� : FIRST n �� ���� n���� ��ȸ.	
		SELECT d.DEPARTMENT_ID ,d.DEPARTMENT_NAME ,round(tavg.cavg) FROM DEPARTMENTS d JOIN 
		(SELECT DEPARTMENT_ID,avg(salary) cavg FROM EMPLOYEES e GROUP BY DEPARTMENT_ID) tavg
		ON d.DEPARTMENT_ID = tavg.DEPARTMENT_ID
		ORDER BY tavg.cavg DESC
		FETCH FIRST 1 ROWS ONLY; 
	
-- �ٸ� ����
	SELECT d.DEPARTMENT_ID did, d.DEPARTMENT_NAME ,e.cnt
	FROM DEPARTMENTS d 
	JOIN 
	 	(SELECT DEPARTMENT_ID,count(*) cnt FROM EMPLOYEES
	 	GROUP BY DEPARTMENT_ID ) e
	ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
	ORDER BY cnt DESC
	FETCH FIRST 1 ROWS ONLY;		-- ����Ŭ 12c ���� ���� ��밡��

-- ����Ŭ�� rownum�� ������ �÷����� ��ȸ�� ����� ���������� ����Ŭ�� �ο��ϴ� ���̴�.
--			���� �÷� ����� ���� join�� �ѹ� �� �ʿ��ϴ�.
SELECT rownum,tcnt.* FROM
(SELECT DEPARTMENT_ID, count(*) cnt FROM EMPLOYEES 
		GROUP BY DEPARTMENT_ID ORDER BY cnt DESC ) tcnt
WHERE rownum < 5;

SELECT rownum,tcnt.* FROM
(SELECT DEPARTMENT_ID, count(*) cnt FROM EMPLOYEES 
		GROUP BY DEPARTMENT_ID ORDER BY cnt DESC ) tcnt
WHERE rownum = 1;

-- rownum ����Ҷ� ��� Ȯ���� �ȵǴ� ���� : rownum 1���� �����ؼ� ã�ư��� �ִ� ���ǽĸ� ����
-- where rownum = 3;
-- where rownum > 5;
-- �׷��� �ѹ��� rownum �� ������ ��ȸ ����� select �� �Ѵ�. �̶� rownum �� ��Ī �ο�

SELECT * from
	(SELECT rownum rn,tcnt.* FROM
		(SELECT DEPARTMENT_ID, count(*) cnt FROM EMPLOYEES 
			GROUP BY DEPARTMENT_ID ORDER BY cnt DESC ) tcnt)
WHERE rn BETWEEN 5 AND 9;
--WHERE rn = 3;
	

	
	
	
	
