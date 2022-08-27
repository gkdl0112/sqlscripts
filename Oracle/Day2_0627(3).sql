--���̺� ����� create table, ������ ���� �׽�Ʈ

CREATE TABLE tbl_member(
	mno NUMBER,			--�⺻ 38�ڸ�
	name nvarchar2(50),
	email varchar2(100),
	join_date DATE		--��¥ ��-��-��, �ð� ��:��:��.�и���
);

--1. DML INSERT ���� (������ ��(row) �߰�)
--��� �÷��� �����͸� �����ϴ� ����(�÷��� ����), ��¥�� date �ڵ���ȯ
INSERT INTO tbl_member VALUES (1,'����','momo@naver.com','2022-03-02');
SELECT * FROM TBL_MEMBER tm ;
--�Ϻ� �÷��� �����͸� �����ϴ� ����
INSERT INTO tbl_member(mno,name)		--������ ����� �÷��� ����
VALUES (2,'�̳���');
-------------------------------------------------------------
--2. DML SELECT ���� (������ ��(row) ��ȸ)
-- select ��ȸ�� �÷� ��� from ���̺��̸� [where ���ǽ�]; ����÷��� * �� ��ü 
SELECT name FROM TBL_MEMBER;
SELECT name,JOIN_DATE  FROM TBL_MEMBER;
SELECT * FROM TBL_MEMBER;
SELECT * FROM TBL_MEMBER WHERE name = '�ִ���'; --���ǽ��� �÷��̸����� ��ȸ�� ����,����
SELECT * FROM TBL_MEMBER WHERE mno > 2;
SELECT * FROM TBL_MEMBER WHERE JOIN_DATE > '2022-03-03';
SELECT name,email FROM TBL_MEMBER WHERE JOIN_DATE > '2022-03-03';
-- null �� ��ȸ
SELECT * FROM TBL_MEMBER tm WHERE email IS NULL;
SELECT * FROM TBL_MEMBER tm WHERE email IS NOT NULL;
-- ���ڿ��� �κа˻� : like ����
SELECT * FROM TBL_MEMBER WHERE name LIKE '%����';		-- %�� don't care
SELECT * FROM TBL_MEMBER WHERE name LIKE '����%';		-- �������� �����ϴ�
SELECT * FROM TBL_MEMBER WHERE name LIKE '%����%';		-- 
-- or ���� : mno ���� 1 �Ǵ� 2 �Ǵ� 4
SELECT * FROM TBL_MEMBER WHERE mno = 1 OR mno = 2 OR mno = 4;
-- ����Ŭ�� or ��ü ������ : in (���� �÷��� ���� ���ǽ��϶�)
SELECT * FROM TBL_MEMBER WHERE mno IN (1,2,4);
SELECT * FROM TBL_MEMBER WHERE mno NOT IN (1,2,4);
SELECT * FROM TBL_MEMBER WHERE name IN ('����','�ִ���');

-- Date ����
--INSERT INTO tbl_member 
--VALUES (3,'�ִ���','dahy@naver.com','2022-03-04 16:47'); ���� : ��¥�������� �ڵ���ȯ ����

--����Ŭ�� to_date�Լ��� ���ڿ��� ��¥�������� ��ȯ.
INSERT INTO tbl_member 
VALUES (3,'�ִ���','dahy@naver.com',to_date('2022-03-04 16:47','YYYY-MM-DD HH24:MI'));
SELECT * FROM TBL_MEMBER tm ;

--to_char �Լ� : ��¥���Ŀ��� ���ڿ��� �����Ѵ�. �ι�° ���ڴ� ���� -> �⵵ �Ǵ� �Ϻ� ���� ����
SELECT to_char(join_date,'YYYY') FROM TBL_MEMBER;

--���� �ý����� ��¥�� �ð� : sysdate �Լ�
INSERT INTO TBL_MEMBER VALUES (4,'����','aaa@gmail.com',sysdate);

SELECT * FROM tbl_member;

--ó�� ���� ���̺� ���� �� mno �÷��� ���е� 5�� ��� ����
--			��� �����Ҷ��� mno �÷��� ���� ����� �Ѵ�.
--ALTER TABLE "C##IDEV".TBL_MEMBER MODIFY MNO NUMBER(5,0);
