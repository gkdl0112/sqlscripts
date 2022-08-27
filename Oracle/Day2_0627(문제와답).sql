/*
1. hire_date�� 2006�� 1�� 1�� ������ ������ �̸�,��,�̸���

2. lastname�� 'Jones' �� ������ ��� �÷�

3. salary �� 5000 �̻��� ������ �̸�,��,JOB_ID ��ȸ

4. JOB_ID �� ACCOUNT �� ���� ������ �̸�,��,salary ��ȸ

5. �μ�_ID �� 50 ,60, 80,90 �� ������ ����_ID, �̸�,�� ��ȸ

*/

--1 
SELECT FIRST_NAME,LAST_NAME,EMAIL FROM EMPLOYEES where hire_date < '2006-01-01';

--2
select * FROM EMPLOYEES WHERE LAST_NAME = 'Jones';
--��ҹ��� �˻�� ���ǽĿ� �����ؾ� �Ѵ�.
--�÷����� ��ҹ��� ��ȯ �� ���ǰ� �� -> ��ҹ��� �����ϰ� �˻� �ϴ� ���
select * FROM EMPLOYEES WHERE UPPER(LAST_NAME) = 'Jones';
select * FROM EMPLOYEES WHERE LOWER(LAST_NAME) = 'Jones';

--3
SELECT FIRST_NAME,LAST_NAME,JOB_ID FROM EMPLOYEES WHERE SALARY >= 5000;

--4
SELECT FIRST_NAME,LAST_NAME,SALARY FROM EMPLOYEES WHERE JOB_ID LIKE '%ACCOUNT%';

--5 : ������ Ÿ�� ��ȯ
SELECT JOB_ID,FIRST_NAME,LAST_NAME FROM EMPLOYEES WHERE DEPARTMENT_ID IN (50,60,80,90);

--��� �Լ� : count, avg, max, min. ����Լ��� �׷��Լ���� �Ѵ�.
--			�ش� �Լ� ������� ���ϱ� ���� Ư�� �÷� ����Ͽ� ���� �����͸� �׷�ȭ���� ����.

SELECT count(*) FROM EMPLOYEES ;		--���̺� ��ü ������ ���� : 107
SELECT max(SALARY) FROM EMPLOYEES ;		--salary �÷��� �ִ밪 : 24000
SELECT min(SALARY) FROM EMPLOYEES ;		--salary �÷��� �ּҰ� : 2100
SELECT avg(salary) FROM EMPLOYEES ;		--			   ��հ� : 6461.83...
SELECT sum(salary) FROM EMPLOYEES ;		-- 				�հ� : 691416

--�� 5�� ����Լ��� JOB_ID = 'IT_PROG' ���� ���ǽ����� �Ȱ��� �����غ���
SELECT count(*) FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG';		--5
SELECT max(SALARY) FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG';		--9000	
SELECT min(SALARY) FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG';		--4200
SELECT avg(salary) FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG';		--5760
SELECT sum(salary) FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG';		--28800

-- ����Լ� ����� �ٸ� �÷����� ���� ��ȸ ���Ѵ�.(�׷��Լ��̱� ����)
SELECT JOB_ID,count(*) FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG';	--���� : ���� �׷��� �׷� �Լ��� �ƴմϴ�

-- ������ ��� : create teble, insert into, select ~ where ~ �⺻ ����

-- ���� : ��Ī(alias). �÷� �Ǵ� ���̺� �̸��� �� �� ª�� �ٿ��� ���� �̸�.
SELECT * FROM EMPLOYEES e ;		--EMPLOYEES ���̺��� ��Ī e
SELECT * FROM DEPARTMENTS d ;	--DEPARTMENTS ���̺��� ��Ī 
--�������� ���� ��Ī�� �ʿ����. �׷��� ������ �����ϰ� ���δ�.